<template>
  <div v-if="pDesignType">
    <div v-if="stateform == FormState.STEP_VIEW">
      <CTitle
        :title="lProcessStep.name"
        :buttonTitle="' passo '"
        functionality="DETTAGLIO PASSO"
        :authenticated="isAuthenticated"
        :buttons="['indietro']"
        @handleBack="handleBack"
      />

      <div class="row p-2">
        <div class="card col-2 p-3">
          <span class="p-2"><strong>id</strong></span>
          <div class="card-slot pl-2">
            <span>
              {{ lProcessStep.id }}
            </span>
          </div>
        </div>

        <div class="card col-5 p-3">
          <span class="p-2"><strong>Etichetta</strong></span>
          <div class="card-slot pl-2">
            <span>
              {{ lProcessStep.label }}
            </span>
          </div>
        </div>

        <div class="card col-5 p-3">
          <span class="p-2"><strong>Descrizione</strong></span>
          <div class="card-slot pl-2">
            <span>
              {{ lProcessStep.descr }}
            </span>
          </div>
        </div>
      </div>

      <CTitle
        title="Process Design"
        buttonTitle=" nuovo Process Design "
        functionality=""
        :authenticated="isAuthenticated"
      />
      <div v-if="lProcessStep.processDesigns">
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

              <!--template #show_details="{ item }">
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
              /></template-->
            </CDataTable>
            <div class="pt-4 pb-2 pr-2">
              <!--button
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
              </button-->
            </div>
          </div>
        </div>
      </div>
      <div v-else>Non sono presenti process design</div>
    </div>
    <!-- 
        View Process Specification
    -->
    <div v-if="stateform == FormState.PROCESS_SPECIFICATION_VIEW">
      <CBusinessProcessSpecificationView
        :pProcessStep="lProcessStep"
        :pProcessDesign="selectedProcessDesign"
        :pProcessSpecification="selectedProcessSpecification"
        :pDesignType="pDesignType"
        @enableBack="enableBack"
      />
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CBusinessProcessSpecificationView from "@/components/businessProcess/CBusinessProcessSpecificationView";
import CTitle from "@/components/CTitle.vue";
var _ = require("lodash");

export default {
  name: "CBusinessProcessStepView",
  components: {
      CBusinessProcessSpecificationView,
      CTitle,
  },
  data() {
    return {
      fieldsProcessSpecification: [
        {
          key: "id",
          label: "ID ",
          _style: "width:auto;",
        },
        {
          key: "designType_Tipo_IO",
          label: "Tipo I/O",
          _style: "width:auto;",
        },

        {
          key: "designType_Dati_IO",
          label: "Dati I/O",
          _style: "width:auto;",
        },
        {
          key: "informationObjectId",
          label: "information Object ID",
          _style: "width:auto;",
        },
        {
          key: "informationObjectName",
          label: "Information Object Name",
          _style: "width:auto;",
        },
        {
          key: "informationObjectDescription",
          label: " information Object Description",
          _style: "width:20%;",
        },
        /*,
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }*/
      ],

      processStepToSave: {
        id: 0,
        name: "",
        descr: "",
        label: "",
        businessServiceId: 0,
      },
      processDesignToSave: {
        id: 0,
        descr: "",
        step: "",
      },

      designTypeLocal: {},
      designTypeSelected: {},
      selectedProcessDesign: {},
      selectedProcessSpecification: {},

      FormState: {
        STEP_VIEW: 40,
        PROCESS_DESIGN_VIEW: 10,
        PROCESS_SPECIFICATION_VIEW: 20,
      },
      stateform: 40,
      warningModal: false,
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("processDesign", ["processDesign"]),
  },
  props: {
    pPStep: {
      type: Object,
      required: true,
      default: () => {},
    },
    pDesignType: {
      type: Array,
      required: true,
      default: () => [],
    },
  },
  methods: {
    getProcessDesign: function () {
      if (
        this.lProcessStep &&
        this.lProcessStep.processDesigns
      ) {
        return this.lProcessStep.processDesigns.map((item) => {
          return {
            id: item.id,
            descr: item.descr,
            processSpecification: item.processSpecification,
          };
        });
      } else {
        return [];
      }
    },
    getProcessSpecification: function (processDesign) {
      return processDesign.processSpecification.map((item) => {
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
                : this.getDesignType(item.designType.parent),
          },
          designType_Dati_IO: {
            id: item.designType.parent == null ? 0 : item.designType.id,
            type: item.designType.parent == null ? "" : item.designType.type,
          },
          informationObject: {
            id: item.informationObject.id,
            name: item.informationObject.name,
            descr: item.informationObject.descr,
            businessServiceId: item.informationObject.businessService.id,
          },
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
      this.processStepToSave.id = this.lProcessStep.id;
      this.processStepToSave.name = this.lProcessStep.name;
      this.processStepToSave.label = this.lProcessStep.label;
      this.processStepToSave.descr = this.lProcessStep.descr;
      this.processStepToSave.businessServiceId = 999; //(this.lProcessStep.businessService.id==null) ? 999: this.lProcessStep.businessService.id;
      this.$store.dispatch("procStep/update", this.processStepToSave); //.then(() => {  alert(this.lProcessStep())});
    },
    handleBack() {
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
    showViewProcessSpecification(processDesign, processDesignSpecification) {
      this.selectedProcessDesign = processDesign;
      this.selectedProcessSpecification = processDesignSpecification;
      this.stateform = this.FormState.PROCESS_SPECIFICATION_VIEW;
    },
   
    handleSubmitViewProcessSpecification() {
      console.log("funzione View process specification non attiva!");
      alert("funzione View process specification non attiva!");
    }
  },
  created() {
    this.lProcessStep = this.pPStep;
    this.designTypeLocal = _.map(this.bDesignType, "type");
  },
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
