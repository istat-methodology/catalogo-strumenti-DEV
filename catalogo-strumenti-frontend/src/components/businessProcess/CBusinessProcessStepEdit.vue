<template>
  <div v-if="bPStepLocal">
    <div v-if="stateform == FormState.STEP_EDIT">
      <CTitle
        :title="bPStepLocal.name"
        :buttonTitle="' passo '"
        functionality=""
        :authenticated="isAuthenticated"
        :buttons="['salva', 'indietro']"
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
      fields: [
        {
          key: "processDesigns_index",
          label: "#",
          _style: "width:1%;",
        },
        /*
        {
          key: "processDesigns_id",
          label: "id",
          _style: "width:20%;",
        },
        

        {
          key: "processDesigns_descr",
          label: "descrizione",
          _style: "width:40%;",
        },
        /*
        {
          key: "processDesignDescription_id",
          label: "Process Designs Description ID",
          _style: "width:20%;",
        },
        */
        {
          key: "designType_type",
          label: "Design Type Type ",
          _style: "width:20%;",
        },

        {
          key: "processDesignDescription_description",
          label: "Process Designs Description Description",
          _style: "width:20%;",
        },
        /*
        {
          key: "designType_id",
          label: "Design Type ID ",
          _style: "width:20%;",
        },
        */

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
      bPStepLocal: {},
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
        return this.bPStepLocal.processDesigns.map((step, index) => {
          return {
            /* process design */
            processDesigns_index: index + 1,
            processDesigns_id: step.id,
            processDesigns_descr: step.descr,

            /* process design description */
            processDesignDescription_id: step.processDesignDescription.id,
            processDesignDescription_description:
              step.processDesignDescription.descr,

            /* design type */
            designType_id: step.designType.id,
            designType_type: step.designType.type,

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
    showEditProcessDesign(processDesign) {
      this.selectedProcessDesign = processDesign;
      this.stateform = this.FormState.PROCESS_DESIGN_EDIT;
    },
    showNewProcessDesign() {
      this.selectedProcessDesign ={};
      this.stateform = this.FormState.PROCESS_DESIGN_NEW;
    },
    handleSubmitNewProcessDesign() {
      
      console.log("non attiva");
      alert("non attiva");
    
    },
    handleSubmitEditProcessDesign() {
      
      console.log("non attiva");
      alert("non attiva");
    
    },
    enableBack() {
      this.$emit("enableBack");
    },
  },
  created() {
    this.bPStepLocal = this.bPStep;
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

