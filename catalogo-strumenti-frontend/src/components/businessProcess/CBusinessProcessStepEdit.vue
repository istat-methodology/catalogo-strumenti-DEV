<template>
  <div v-if="bPStepLocal">
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
              class="col-2"
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
      <CCard>
        <CCardBody>
          <div
            v-for="(item, index) in getProcessDesignDescriptionList()"
            :key="index"
          >
            <div v-if="index < 1">
              <!--CInput
                class="col-2"
                label="ID"
                placeholder="ID"
                v-model="item.processDesignDescription_id"

                /-->
              <div class="row mt-4">
                <label class="pl-4"
                  ><h3>
                    {{ item.processDesignDescription_description }}
                  </h3></label
                >
                <!--CTextarea
                  class="col-12"
                  label="Descrizione"
                  placeholder="Descrizione"
                  v-model="item.processDesignDescription_description"
                  disabled
                /-->
              </div>
            </div>
          </div>
          <!--/CCardBody>
      </CCard-->

          <!--CCard>
        <CCardBody-->

          <div class="row mt-4">
            <span v-if="bPStepLocal.processDesigns.length > 0">
              <CDataTable
                class="col-12"
                v-if="bPStepLocal"
                :items="getProcessDesignsList()"
                :fields="fields"
                :items-per-page="10"
                hover
                pagination
                ><template #show_details="{ item }">
                  <td>
                    <span class="icon-link" @click="showEditProcessDesign(item)"
                      ><edit-icon title="Edit"
                    /></span>
                  </td>
                </template>
              </CDataTable>
            </span>
            <span v-else>Non sono presenti process desigp</span>
          </div>
        </CCardBody>
      </CCard>
    </div>
    <!-- 
        New Process Design
    -->
    <div v-if="stateform == FormState.PROCESS_DESIGN_NEW">
      <CBusinessProcessDesignNew
        :bProcessStep="bPStepLocal"
        :bProcessDesign="selectedProcessDesign"
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
        @enableEditProcessDesign="handleSubmitEditProcessDesign"
        @enableBack="stateform = FormState.STEP_EDIT"
      />
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CBusinessProcessDesignNew from "@/components/businessProcess/CBusinessProcessDesignNew";
import CBusinessProcessDesignEdit from "@/components/businessProcess/CBusinessProcessDesignEdit";
//import CModalDelete from "@/components/CModalDelete.vue";

import CTitle from "@/components/CTitle.vue";
export default {
  name: "CBusinessProcessStepEdit",
  components: {
    CBusinessProcessDesignNew,
    CBusinessProcessDesignEdit,
    //  CModalDelete,
    CTitle,
  },
  data() {
    return {
      processDesignDescription: [
        {
          key: "processDesignDescription_id",
        },
        {
          key: "processDesignDescription_description",
        },
      ],
      fields: [
        /*
        {
          key: "processDesigns_index",
          label: "#",
          _style: "width:1%;",
        },
        */
        {
          key: "processDesigns_id",
          label: "id",
          _style: "width:2%;",
        },

        /* sempre null
        {
          key: "processDesigns_descr",
          label: "descrizione",
          _style: "width:40%;",
        },
        */

        /* si ripete quindi va estratto e visualizzato una sola volta
        {
          key: "processDesignDescription_id",
          label: "Process Designs Description ID",
          _style: "width:20%;",
        },
        */
        /*
        {
          key: "processDesignDescription_description",
          label: "Process Designs Description Description",
          _style: "width:20%;",
        },
        */

        /*
        {
          key: "designType_id",
          label: "Design Type ID ",
          _style: "width:20%;",
        },
        */
        {
          key: "designType_type",
          label: "Dati I/O",
          _style: "width:20%;",
        },
        {
          key: "designType_type",
          label: "Tipo I/O",
          _style: "width:20%;",
        },
        /*
        {
          key: "informationObject_id",
          label: "informationObject ID",
          _style: "width:20%;",
        },
        */
        {
          key: "informationObject_name",
          label: "Information Object Name",
          _style: "width:20%;",
        },
        {
          key: "informationObject_description",
          label: " information Object Description",
          _style: "width:20%;",
        },
        /*
        {
          key: "informationObject_csmAppRoleId",
          label: "information Object csmAppRoleId",
          _style: "width:20%;",
        },
        */
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
            processDesignDescription: {
              id: "",
              descr: "",
            },
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
        ],
      },

      selectedProcessDesign: {},
      states: [],

      FormState: {
        STEP_EDIT: 4,
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
  },
  emits: ["enableBack", "enableEditDesignProcess", "enableNewDesignProcess"],
  props: {
    bPStep: {
      type: Object,
      required: true,
      default: () => {},
    },
  },
  methods: {
    getProcessDesignsList: function () {
      if (this.bPStepLocal && this.bPStepLocal.processDesigns.length > 0) {
        //return this.bPStepLocal.processDesigns.map((step, index) => {
        return this.bPStepLocal.processDesigns.map((step) => {
          return {
            /* process design */
            //processDesigns_index: index + 1,
            processDesigns_id: step.id,
            processDesigns_descr: step.descr,

            /* process design description */
            processDesignDescription_id: step.processDesignDescription.id,
            processDesignDescription_description:
              step.processDesignDescription.descr,

            /* design type */
            designType_id: step.designType.id,
            designType_type: step.designType.type,
            designType_typeByParameter: step.designType.type,

            /* information Object */
            informationObject_id: step.informationObject.id,
            informationObject_name: step.informationObject.name,
            informationObject_description: step.informationObject.descr,
            informationObject_csmAppRoleId: step.informationObject.csmAppRoleId,
          };
        });
      } else {
        return [];
      }
    },
    getProcessDesignDescriptionList: function () {
      if (this.bPStepLocal && this.bPStepLocal.processDesigns.length > 0) {
        return this.bPStepLocal.processDesigns.map((step) => {
          return {
            /* process design description */
            processDesignDescription_id: step.processDesignDescription.id,
            processDesignDescription_description:
              step.processDesignDescription.descr,
          };
        });
      } else {
        return [];
      }
    },
    showEditProcessDesign(processDesign) {
      this.selectedProcessDesign = processDesign;
      this.stateform = this.FormState.PROCESS_DESIGN_EDIT;
    },
    showNewProcessDesign() {
      this.selectedProcessDesign = {};
      this.stateform = this.FormState.PROCESS_DESIGN_NEW;
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
  },
  created() {
    this.bPStepLocal = this.bPStep;
    this.getProcessDesignDescriptionList();
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

