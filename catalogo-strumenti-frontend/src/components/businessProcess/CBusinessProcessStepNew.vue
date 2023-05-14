<template>
  <div v-if="pDesignType">
    <!-- 
        Aggiungi Passo dalla lista
      -->
    <div v-if="stateform == FormState.STEP_ADD">
      <CTitle
        title="Elenco passi"
        buttonTitle=" Aggiungi Passo"
        functionality="AGGIUNGI PASSO DA ELENCO"
        :authenticated="isAuthenticated"
        :buttons="['salva', 'indietro']"
        @handleSubmit="handleSubmit()"
        @handleBack="enableBack"
      />
      <div class="card">
        <div class="card-slot" v-if="processStepsList">
          <label>Selezione passi esistenti:</label>
          <v-select
            label="name"
            :options="processStepsList"
            @input="selectId($event)"
          ></v-select>
          <span class="help-block">Seleziona un passo</span>
          <span
            class="icon-link float-right"
            @click="stateform = FormState.STEP_NEW"
            ><add-icon />Nuovo Passo</span
          >
        </div>
      </div>
    </div>

    <div v-if="stateform == FormState.STEP_NEW">
      <CTitle
        title="Nuovo Passo"
        :buttonTitle="' passo '"
        functionality="NUOVO PASSO"
        :authenticated="isAuthenticated"
        :buttons="['salva', 'indietro']"
        @handleSubmit="handleSubmit"
        @handleBack="enableBack"
      />
      <CCard>
        <CCardBody>
          <div class="row">
            <CInput
              class="col-1"
              label="id"
              placeholder="id"
              v-model="lProcessStep.id"
              disabled
            />
            <CInput
              class="col-6"
              label="Nome*"
              placeholder="Nome"
              v-model="lProcessStep.name"
            />
            <CInput
              class="col-5"
              label="Etichetta"
              placeholder="Etichetta"
              v-model="lProcessStep.label"
            />
          </div>
          <div class="row mt-4">
            <CTextarea
              class="col-12"
              label="Descrizione"
              placeholder="Descrizione"
              v-model="lProcessStep.descr"
            />
          </div>
        </CCardBody>
      </CCard>

      <CTitle
        title="Process Design"
        buttonTitle=" nuovo Process Design "
        functionality=""
        :authenticated="isAuthenticated"
        :buttons="['aggiungi']"
        @handleNew="showNewProcessDesign"
      />

      <div
        v-if="
          lProcessStep.processDesigns && lProcessStep.processDesigns.length > 0
        "
      >
        <div
          v-for="processDesign of getProcessDesign()"
          :key="processDesign.id"
        >
          <div class="card">
            <div class="card-header no-border m-0">
              <h5>
                <div class="text-info float-left">
                  {{ processDesign.id }} - {{ processDesign.descr }}
                </div>
              </h5>
            </div>
            <CDataTable
              v-if="lProcessStep"
              :items="getProcessSpecification(processDesign)"
              :items-per-page="5"
              :fields="fieldsProcessSpecification"
              hover
              pagination
              class="p-0"
            >
              <template #designType_Tipo_IO="{ item }">
                <td>
                  {{ item.designType_Tipo_IO.type }}
                </td>
              </template>
              <template #designType_Dati_IO="{ item }">
                <td>
                  {{ item.designType_Dati_IO.type }}
                </td>
              </template>
              <template #informationObjectId="{ item }">
                <td>
                  {{ item.informationObject.id }}
                </td>
              </template>
              <template #informationObjectName="{ item }">
                <td>
                  {{ item.informationObject.name }}
                </td>
              </template>
              <template #informationObjectDescription="{ item }">
                <td>
                  {{ item.informationObject.descr }}
                </td>
              </template>

              <template #show_details="{ item }">
                <CTableLink
                  :authenticated="isAuthenticated"
                  @handleView="
                    showViewProcessSpecification(processDesign, item)
                  "
                  @handleEdit="
                    showEditProcessSpecification(processDesign, item)
                  "
                  @handleDelete="
                    handleOpenModalDeleteProcessSpecification(
                      processDesign,
                      item
                    )
                  "
              /></template>
            </CDataTable>
            <div class="pt-4 pb-2 pr-2">
              <button
                @click="showNewProcessSpecification"
                class="btn btn-info float-right mr-4"
              >
                aggiungi Process Specification
              </button>
              <button
                @click="showEditProcessDesign(processDesign)"
                class="btn btn-info float-right mr-4"
              >
                modifica
              </button>
              <button
                @click="handleOpenModalDeleteProcessDesign(processDesign)"
                class="btn btn-info float-right mr-4"
              >
                cancella
              </button>
            </div>
          </div>
        </div>
      </div>
      <div v-else>Non sono presenti process design</div>
    </div>
    <!-- 
        New Process Design
    -->
    <div v-if="stateform == FormState.PROCESS_DESIGN_NEW">
      <CBusinessProcessDesignNew
        :pProcessStep="lProcessStep"
        :pProcessDesign="selectedProcessDesign"
        @enableNewProcessDesign="handleSubmitNewProcessDesign"
        @enableBack="stateform = FormState.STEP_NEW"
      />
    </div>
    <!-- 
        New Process Design
    -->
    <div v-if="stateform == FormState.PROCESS_DESIGN_EDIT">
      <CBusinessProcessDesignEdit
        :pProcessStep="lProcessStep"
        :pProcessDesign="selectedProcessDesign"
        @enableEditProcessDesign="handleSubmitEditProcessDesign"
        @enableBack="stateform = FormState.STEP_NEW"
      />
    </div>
    <!-- 
        View Process Specification
    -->
    <div v-if="stateform == FormState.PROCESS_SPECIFICATION_VIEW">
      <CBusinessProcessSpecificationView
        :pProcessStep="lProcessStep"
        :pProcessDesign="selectedProcessDesign"
        :pProcessSpecification="selectedProcessSpecification"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
    <!-- 
        New Process Specification
    -->
    <div v-if="stateform == FormState.PROCESS_SPECIFICATION_NEW">
      <CBusinessProcessSpecificationNew
        :pProcessStep="lProcessStep"
        :pProcessDesign="selectedProcessDesign"
        :pProcessSpecification="{}"
        @enableNewProcessSpecification="handleSubmitNewProcessSpecification"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
    <!-- 
        Edit Process Specification
    -->
    <div v-if="stateform == FormState.PROCESS_SPECIFICATION_EDIT">
      <CBusinessProcessSpecificationEdit
        :bProcessStep="lProcessStep"
        :bProcessDesign="selectedProcessDesign"
        :bProcessSpecification="selectedProcessSpecification"
        @enableEditProcessSpecification="handleSubmitEditProcessSpecification"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CBusinessProcessDesignNew from "@/components/businessProcess/CBusinessProcessDesignView";
import CBusinessProcessDesignEdit from "@/components/businessProcess/CBusinessProcessDesignEdit";
import CBusinessProcessSpecificationView from "@/components/businessProcess/CBusinessProcessSpecificationView";
import CBusinessProcessSpecificationNew from "@/components/businessProcess/CBusinessProcessSpecificationNew";
import CBusinessProcessSpecificationEdit from "@/components/businessProcess/CBusinessProcessSpecificationEdit";
//import CTableLink from "@/components/CTableLink.vue";
//import CModalDelete from "@/components/CModalDelete.vue";
import CTitle from "@/components/CTitle.vue";
var _ = require("lodash");

export default {
  name: "CBusinessProcessStepNew",
  components: {
    CBusinessProcessDesignNew,
    CBusinessProcessDesignEdit,
    CBusinessProcessSpecificationView,
    CBusinessProcessSpecificationNew,
    CBusinessProcessSpecificationEdit,
    //CTableLink,
    //  CModalDelete,
    CTitle
  },
  data() {
    return {
      fieldsProcessSpecification: [
        {
          key: "id",
          label: "ID ",
          _style: "width:auto;"
        },
        {
          key: "designType_Tipo_IO",
          label: "Tipo I/O",
          _style: "width:auto;"
        },

        {
          key: "designType_Dati_IO",
          label: "Dati I/O",
          _style: "width:auto;"
        },
        {
          key: "informationObjectId",
          label: "information Object ID",
          _style: "width:auto;"
        },
        {
          key: "informationObjectName",
          label: "Information Object Name",
          _style: "width:auto;"
        },
        {
          key: "informationObjectDescription",
          label: " information Object Description",
          _style: "width:20%;"
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ],
      processStepToSave: {
        id: 0,
        name: "",
        descr: "",
        label: "",
        businessServiceId: 999,
        processIds: [],
        substep: 0
      },
      lProcessStep: {
        id: 0,
        name: "",
        descr: "",
        label: "",
        businessServiceId: 999,
        processIds: [],
        substep: 0
      },

      processDesignToSave: {
        id: 0,
        descr: "",
        step: ""
      },

      processDesigns: {
        id: null,
        descr: null,
        processSpecification: {
          id: null,
          designType: {
            id: null,
            type: null,
            parent: null
          },
          informationObject: {
            id: null,
            name: null,
            descr: null,
            csmAppRoleId: null,
            businessService: {
              id: null,
              name: null,
              descr: null
            }
          }
        }
      },
      lDesignType: {},
      designTypeSelected: {},
      selectedProcessDesign: {},
      selectedProcessSpecification: {},

      FormState: {
        STEP_ADD: 4,
        STEP_NEW: 5,
        PROCESS_DESIGN_VIEW: 10,
        PROCESS_DESIGN_NEW: 11,
        PROCESS_DESIGN_EDIT: 12,

        PROCESS_SPECIFICATION_VIEW: 20,
        PROCESS_SPECIFICATION_NEW: 21,
        PROCESS_SPECIFICATION_EDIT: 22
      },
      stateform: 4,
      warningModal: false
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("processSteps", ["processStepsList"]),
    ...mapGetters("designtypes", ["designtypeList"]),
    ...mapGetters("processDesign", ["processDesign"])
  },
  props: {
    pProcess: {
      type: Object,
      required: true,
      default: () => {}
    },
    pDesignType: {
      type: Array,
      required: true,
      default: () => []
    }
  },
  methods: {
    getProcessDesign: function() {
      if (this.lProcessStep && this.lProcessStep.processDesigns.lenght > 0) {
        return this.lProcessStep.processDesigns.map(item => {
          return {
            id: item.id,
            descr: item.descr,
            processSpecification: item.processSpecification
          };
        });
      } else {
        return [];
      }
    },
    getProcessSpecification: function(processDesign) {
      return processDesign.processSpecification.map(item => {
        return {
          id: item.id,
          designType_Tipo_IO: {
            id:
              item.designType.parent == null
                ? item.designType.id
                : item.designType.parent,
            type:
              item.designType.parent == null
                ? item.designType.type
                : this.getDesignType(item.designType.parent)
          },
          designType_Dati_IO: {
            id: item.designType.parent == null ? 0 : item.designType.id,
            type: item.designType.parent == null ? "" : item.designType.type
          },
          informationObject: {
            id: item.informationObject.id,
            name: item.informationObject.name,
            descr: item.informationObject.descr,
            businessServiceId: item.informationObject.businessService.id
          }
        };
      });
    },
    getDesignType(id) {
      console.log(this.lDesignType);
      var dt = this.lDesignType[id];
      console.log(dt);
      return dt;
    },
    /* Process Step */

    selectId(e) {
      this.lProcessStep.id = e.id;
      this.lProcessStep.name = e.name;
      this.lProcessStep.descr = e.descr;
      this.lProcessStep.label = e.label;
    },

    handleSubmit() {
      if (this.stateform == this.FormState.STEP_ADD) {
        let params = { idProcess: 0, idStep: 0 };
        params.idProcess = this.pProcess.id;
        params.idStep = this.lProcessStep.id;
        this.$store.dispatch("bProcess/addStep", params);
      } else if (this.stateform == this.FormState.STEP_NEW) {
        this.processStepToSave.id = this.lProcessStep.id;
        this.processStepToSave.name = this.lProcessStep.name;
        this.processStepToSave.label = this.lProcessStep.label;
        this.processStepToSave.descr = this.lProcessStep.descr;
        this.processStepToSave.businessServiceId = this.lProcessStep.businessServiceId;
        if (this.pProcess) {
          this.processStepToSave.processIds.push(this.pProcess.id);
        }
        this.processStepToSave.substep = this.lProcessStep.substep;
        this.$store.dispatch("processSteps/save", this.processStepToSave);
      }
    },
    enableBack() {
      this.$emit("enableBack");
    },

    /* Process Design */
    showNewProcessDesign(processDesign) {
      this.selectedProcessDesign = processDesign;
      this.stateform = this.FormState.PROCESS_DESIGN_NEW;
    },
    showEditProcessDesign(processDesign) {
      this.selectedProcessDesign = processDesign;
      this.stateform = this.FormState.PROCESS_DESIGN_EDIT;
    },
    handleSubmitNewProcessDesign() {
      console.log("funzione di insert non attiva!");
      alert("funzione di insert non attiva!");
    },
    handleSubmitEditProcessDesign(processDesign) {
      this.processDesignToSave.id = processDesign.id;
      this.processDesignToSave.descr = processDesign.descr;
      this.processDesignToSave.step = this.lProcessStep.id;
      this.$store.dispatch("processDesign/update", this.processDesignToSave);
    },
    handleSubmitDeleteProcessDesign() {
      console.log("funzione delete process design non attiva!");
      alert("funzione delete process design non attiva!");
    },
    handleOpenModalDeleteProcessDesign() {
      console.log("funzione delete process design non attiva!");
      alert("funzione delete process design non attiva!");
    },
    showEditProcessSpecification(processDesign, processDesignSpecification) {
      this.selectedProcessDesign = processDesign;
      this.selectedProcessSpecification = processDesignSpecification;
      this.stateform = this.FormState.PROCESS_SPECIFICATION_EDIT;
    },
    showViewProcessSpecification(processDesign, processDesignSpecification) {
      this.selectedProcessDesign = processDesign;
      this.selectedProcessSpecification = processDesignSpecification;
      this.stateform = this.FormState.PROCESS_SPECIFICATION_VIEW;
    },
    showNewProcessSpecification(processDesign, processDesignSpecification) {
      this.selectedProcessDesign = processDesign;
      this.selectedProcessSpecification = processDesignSpecification;
      this.stateform = this.FormState.PROCESS_SPECIFICATION_NEW;
    },

    /* Process Specification */
    handleSubmitNewProcessSpecification() {
      console.log("funzione new process specification non attiva!");
      alert("funzione new process specification non attiva!");
    },
    handleSubmitEditProcessSpecification() {
      console.log("funzione edit process specification non attiva!");
      alert("funzione edit process specification non attiva!");
    },
    handleSubmitViewProcessSpecification() {
      console.log("funzione View process specification non attiva!");
      alert("funzione View process specification non attiva!");
    },
    handleSubmitDeleteProcessSpecification() {
      console.log("funzione delete process specification non attiva!");
      alert("funzione delete process specification non attiva!");
    },
    handleOpenModalDeleteProcessSpecification() {
      console.log("funzione delete process specification non attiva!");
      alert("funzione delete process specification non attiva!");
    }
  },
  created() {
    //this.$store.dispatch("processSteps/findAll").catch(() => {});
    //this.lProcessStep = this.processStep;
    this.lDesignType = _.map(this.pDesignType, "type");
  }
};
</script>
<style scoped>
h5 {
  margin-bottom: 0.1rem;
}
.card-border {
  border: 1px solid #d8dbe0 !important;
  box-shadow: none !important;
}
.bg-lighter {
  background-color: #f8f8f8 !important;
}
.material-design-icon {
  margin-bottom: 0.2rem;
}

* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding in columns */
.row {
  margin: 0 -5px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* this adds the "card" effect */
  padding: 12px;
  text-align: left;
  background-color: #f1f1f1;
  margin-left: 5px;
}

/* Responsive columns - one column layout (vertical) on small screens */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}
</style>
