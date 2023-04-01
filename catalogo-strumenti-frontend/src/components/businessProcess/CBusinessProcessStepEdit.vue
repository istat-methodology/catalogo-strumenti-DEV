<template>
  <div v-if="bDesignType">
    <div v-if="stateform == FormState.STEP_EDIT">
      <CTitle
        :title="bPStepLocal.name"
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
              label="id"
              placeholder="id"
              v-model="bPStepLocal.id"
              disabled
            />
            <CInput
              class="col-6"
              label="Nome*"
              placeholder="Nome"
              v-model="bPStepLocal.name"
            />
            <CInput
              class="col-4"
              label="Etichetta"
              placeholder="Etichetta"
              v-model="bPStepLocal.label"
            />
            <CInput
              class="col-1"
              label="Index"
              placeholder="Index"
              v-model="bPStepLocal.index"
            />
          </div>
          <div class="row mt-4">
            <CTextarea
              class="col-12"
              label="Descrizione"
              placeholder="Descrizione"
              v-model="bPStepLocal.description"
            />
          </div>
        </CCardBody>
      </CCard>

      <!--label class="col-12 mt-4">processDesigns:</label-->
      <CTitle
        title="Process Design"
        buttonTitle=" nuovo Process Design "
        functionality=""
        :authenticated="isAuthenticated"
        :buttons="['aggiungi']"
        @handleNew="showNewProcessDesign"
      />

      <div v-if="bPStepLocal.processDesigns.length > 0">
        <div
          v-for="iProcessDesigns of getProcessDesignsList()"
          :key="iProcessDesigns.processDesignId"
        >
          <div class="card">
            <div class="card-header no-border m-0">
              <h5>
                <div class="text-info float-left">
                  {{ iProcessDesigns.processDesignId }}
                </div>
                <div class="text-info float-right">
                </div>
              </h5>
            </div>
            <CDataTable
              v-if="bPStepLocal"
              :items="getDesignSpecificationList(iProcessDesigns)"
              :items-per-page="5"
              :fields="fieldsDesignSpecification"
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
                  {{ item.informationObject.description }}
                </td>
              </template>

              <template #show_details="{ item }">
                <CTableLink
                  :authenticated="isAuthenticated"
                  @handleView="showViewProcessDesign(iProcessDesigns, item)"
                  @handleEdit="showEditProcessDesign(iProcessDesigns, item)"
                  @handleDelete="handleOpenModalDelete(iProcessDesigns, item)"
              /></template>
            </CDataTable>
            <div class="pt-4 pb-2 pr-2" >
              <button @click="showNewProcessDesign" class="btn btn-info float-right">Nuovo Process Specificstion</button>            
            </div>
          </div>
        </div>
      </div>
      <div v-else>Non sono presenti process design</div>
    </div>
    <!-- 
        View Process Design
    -->
    <div v-if="stateform == FormState.PROCESS_DESIGN_VIEW">
      <CBusinessProcessDesignView
        :bProcessStep="bPStepLocal"
        :bProcessDesign="selectedProcessDesign"
        :bProcessDesignSpecification="selectedProcessDesignSpecification"
        @enableNewProcessDesign="handleSubmitViewProcessDesign"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
    <!-- 
        New Process Design
    -->
    <div v-if="stateform == FormState.PROCESS_DESIGN_NEW">
      <CBusinessProcessDesignNew
        :bProcessStep="bPStepLocal"
        :bProcessDesign="selectedProcessDesign"
        :bProcessDesignSpecification="selectedProcessDesignSpecification"
        @enableNewProcessDesign="handleSubmitNewProcessDesign"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
    <!-- 
        Edit Process Design
    -->
    <div v-if="stateform == FormState.PROCESS_DESIGN_EDIT">
      <CBusinessProcessDesignEdit
        :bProcessStep="bPStepLocal"
        :bProcessDesign="selectedProcessDesign"
        :bProcessDesignSpecification="selectedProcessDesignSpecification"
        @enableEditProcessDesign="handleSubmitEditProcessDesign"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CBusinessProcessDesignView from "@/components/businessProcess/CBusinessProcessDesignView";
import CBusinessProcessDesignNew from "@/components/businessProcess/CBusinessProcessDesignNew";
import CBusinessProcessDesignEdit from "@/components/businessProcess/CBusinessProcessDesignEdit";
import CTableLink from "@/components/CTableLink.vue";
//import CModalDelete from "@/components/CModalDelete.vue";
import CTitle from "@/components/CTitle.vue";
var _ = require("lodash");

export default {
  name: "CBusinessProcessStepEdit",
  components: {
    CBusinessProcessDesignView,
    CBusinessProcessDesignNew,
    CBusinessProcessDesignEdit,
    CTableLink,
    //  CModalDelete,
    CTitle,
  },

  data() {
    return {
      designTypeLocal: {},
      fieldsDesignSpecification: [
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
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      bPStepLocalToSave: {
        index: "",
        name: "",
        label: "",
        description: "",
      },
      bPStepLocal: {
        index: "",
        name: "",
        label: "",
        description: "",
        processDesign: [
          {
            id: "",
            description: "",
            name: "",
            label: "",
            processSpecification: {
              id: "",
              descr: "",
              designType: {
                id: "",
                type: "",
                parent: "",
              },
              informationObject: {
                id: "",
                name: "",
                descr: "",
                csmAppRoleId: "",
              },
            },
          },
        ],
      },
      designTypeSelected: {},
      selectedProcessDesign: {},
      selectedProcessDesignSpecification: {},

      FormState: {
        STEP_EDIT: 4,
        PROCESS_DESIGN_VIEW: 5,
        PROCESS_DESIGN_ADD: 6,
        PROCESS_DESIGN_EDIT: 7,
        PROCESS_DESIGN_NEW: 8,
      },
      stateform: 4,
      warningModal: false,
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("designtypes", ["designtypeList"]),
  },
  emits: ["enableBack", "enableEditDesignProcess", "enableNewDesignProcess"],
  props: {
    bPStep: {
      type: Object,
      required: true,
      default: () => {},
    },
    bDesignType: {
      type: Array,
      required: true,
      default: () => [],
    },
  },
  methods: {
    getProcessDesignsList: function () {
      if (this.bPStepLocal && this.bPStepLocal.processDesigns.length > 0) {
        return this.bPStepLocal.processDesigns.map((processDesign) => {
          return {
            processDesignId: processDesign.id,
            processDesignDescription: processDesign.description,
            processSpecification: processDesign.processSpecification,
          };
        });
      } else {
        return [];
      }
    },
    getDesignSpecificationList: function (processDesign) {
      return processDesign.processSpecification.map((processSpecification) => {
        return {
          id: processSpecification.id,
          designType_Tipo_IO: {
            id:
              processSpecification.designType.parent == null
                ? processSpecification.designType.id
                : processSpecification.designType.parent,
            type:
              processSpecification.designType.parent == null
                ? processSpecification.designType.type
                : this.getDesignType(processSpecification.designType.parent),
          },
          designType_Dati_IO: {
            id:
              processSpecification.designType.parent == null
                ? 0
                : processSpecification.designType.id,
            type:
              processSpecification.designType.parent == null
                ? ""
                : processSpecification.designType.type,
          },
          informationObject: {
            id: processSpecification.informationObject.id,
            name: processSpecification.informationObject.name,
            description: processSpecification.informationObject.descr,
          },
        };
      });
    },
    showEditProcessDesign(processDesign, processDesignSpecification) {
      this.selectedProcessDesign = processDesign;
      this.selectedProcessDesignSpecification = processDesignSpecification;
      this.stateform = this.FormState.PROCESS_DESIGN_EDIT;
    },
    showViewProcessDesign(processDesign, processDesignSpecification) {
      this.selectedProcessDesign = processDesign;
      this.selectedProcessDesignSpecification = processDesignSpecification;
      this.stateform = this.FormState.PROCESS_DESIGN_VIEW;
    },
    showNewProcessDesign(processDesign, processDesignSpecification) {
      this.selectedProcessDesign = processDesign;
      this.selectedProcessDesignSpecification = processDesignSpecification;
      this.stateform = this.FormState.PROCESS_DESIGN_NEW;
    },
    handleAddProcessSpecification() {
      alert("funzione non disponibile");
    },
    handleSubmitNewProcessDesign() {
      console.log("funzione di insert non attiva!");
      alert("funzione di insert non attiva!");
      /*this.$store.dispatch(".../update", this.Local).then(() => {
        this.load();
      });
      */
    },
    handleSubmitEditProcessDesign() {
      console.log("funzione di update non attiva!");
      alert("funzione di update non attiva!");
      /*this.$store.dispatch(".../update", this.Local).then(() => {
        this.load();
      });
      */
    },
    handleSubmitViewProcessDesign() {
      console.log("funzione di update non attiva!");
      alert("funzione di update non attiva!");
      /*this.$store.dispatch(".../update", this.Local).then(() => {
        this.load();
      });
      */
    },
    enableBack() {
      this.$emit("enableBack");
    },
    handleSubmit() {
      //alert("funzione di update process step non attiva!");
      //console.log("funzione di update process step non attiva!");
      this.bPStepLocalToSave.id = this.bPStepLocal.id;
      this.bPStepLocalToSave.index = this.bPStepLocal.index;
      this.bPStepLocalToSave.name = this.bPStepLocal.name;
      this.bPStepLocalToSave.label = this.bPStepLocal.label;
      this.bPStepLocalToSave.description = this.bPStepLocal.description;
      this.$store.dispatch("procStep/update", this.bPStepLocalToSave); //.then(() => {  alert(this.bPStepLocal())});
    },
    getDesignType(id) {
      console.log(this.designTypeLocal);
      var dt = this.designTypeLocal[id];
      console.log(dt);
      return dt;
    },
  },
  created() {
    this.bPStepLocal = this.bPStep;
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
