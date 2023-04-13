<template>
  <div v-if="bDesignType">
    <div v-if="stateform == FormState.STEP_EDIT">
      <CTitle
        :title="processStepLocal.name"
        :buttonTitle="' passo '"
        functionality=""
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
              label="ID"
              placeholder="ID"
              v-model="processStepLocal.id"
              disabled
            />
            <CInput
              class="col-6"
              label="Nome*"
              placeholder="Nome"
              v-model="processStepLocal.name"
            />
            <CInput
              class="col-5"
              label="Etichetta"
              placeholder="Etichetta"
              v-model="processStepLocal.label"
            />
          </div>
          <div class="row mt-4">
            <CTextarea
              class="col-12"
              label="Descrizione"
              placeholder="Descrizione"
              v-model="processStepLocal.descr"
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
      <div v-if="processStepLocal.processDesigns.length > 0">
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
              v-if="processStepLocal"
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
        :bProcessStep="processStepLocal"
        :bProcessDesign="selectedProcessDesign"
        @enableNewProcessDesign="handleSubmitNewProcessDesign"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
    <!-- 
        New Process Design
    -->
    <div v-if="stateform == FormState.PROCESS_DESIGN_EDIT">
      <CBusinessProcessDesignEdit
        :bProcessStep="processStepLocal"
        :bProcessDesign="selectedProcessDesign"
        @enableEditProcessDesign="handleSubmitEditProcessDesign"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
    <!-- 
        View Process Specification
    -->
    <div v-if="stateform == FormState.PROCESS_SPECIFICATION_VIEW">
      <CBusinessProcessSpecificationView
        :bProcessStep="processStepLocal"
        :bProcessDesign="selectedProcessDesign"
        :bProcessSpecification="selectedProcessSpecification"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
    <!-- 
        New Process Specification
    -->
    <div v-if="stateform == FormState.PROCESS_SPECIFICATION_NEW">
      <CBusinessProcessSpecificationNew
        :bProcessStep="processStepLocal"
        :bProcessDesign="selectedProcessDesign"
        :bProcessSpecification="{}"
        @enableNewProcessSpecification="handleSubmitNewProcessSpecification"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
    <!-- 
        Edit Process Specification
    -->
    <div v-if="stateform == FormState.PROCESS_SPECIFICATION_EDIT">
      <CBusinessProcessSpecificationEdit
        :bProcessStep="processStepLocal"
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
import CTableLink from "@/components/CTableLink.vue";
//import CModalDelete from "@/components/CModalDelete.vue";
import CTitle from "@/components/CTitle.vue";
var _ = require("lodash");

export default {
  name: "CBusinessProcessStepEdit",
  components: {
    CBusinessProcessDesignNew,
    CBusinessProcessDesignEdit,
    CBusinessProcessSpecificationView,
    CBusinessProcessSpecificationNew,
    CBusinessProcessSpecificationEdit,
    CTableLink,
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
        businessServiceId: 0
      },
      processDesignToSave: {
        id: 0,
        descr: "",
        step: ""
      },

      designTypeLocal: {},
      designTypeSelected: {},
      selectedProcessDesign: {},
      selectedProcessSpecification: {},

      FormState: {
        STEP_EDIT: 4,
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
    ...mapGetters("designtypes", ["designtypeList"]),
    ...mapGetters("processDesign", ["processDesign"])
  },
  props: {
    bPStep: {
      type: Object,
      required: true,
      default: () => {}
    },
    bDesignType: {
      type: Array,
      required: true,
      default: () => []
    }
  },
  methods: {
    getProcessDesign: function() {
      if (
        this.processStepLocal &&
        this.processStepLocal.processDesigns.length > 0
      ) {
        return this.processStepLocal.processDesigns.map(item => {
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
      console.log(this.designTypeLocal);
      var dt = this.designTypeLocal[id];
      console.log(dt);
      return dt;
    },
    /* Process Step */
    handleSubmit() {
      this.processStepToSave.id = this.processStepLocal.id;
      this.processStepToSave.name = this.processStepLocal.name;
      this.processStepToSave.label = this.processStepLocal.label;
      this.processStepToSave.descr = this.processStepLocal.descr;
      this.processStepToSave.businessServiceId = 999; //(this.processStepLocal.businessService.id==null) ? 999: this.processStepLocal.businessService.id;
      this.$store.dispatch("procStep/update", this.processStepToSave); //.then(() => {  alert(this.processStepLocal())});
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
      this.processDesignToSave.step = this.processStepLocal.id;
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
    this.processStepLocal = this.bPStep;
    this.designTypeLocal = _.map(this.bDesignType, "type");
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
