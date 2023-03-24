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

      <!--div>
              {{ getProcessDesignsList() }}
            </div-->
      <span v-if="bPStepLocal.processDesigns.length > 0">
        <div v-for="item of getProcessDesignsList()" :key="item.id">

          <div class="card-header"
                >{{
                  item.nr +
                  "-" +
                  item.processDesignId +
                  "-" +
                  item.processDesignDescription
                }}
              <div class="card-action float-right">
                <CTableLink
                  :authenticated="isAuthenticated"
                  @handleView="handleView(item)"
                  @handleEdit="handleEdit(item)"
                  @handleDelete="handleOpenModalDelete(item)"
                />
              </div>
          </div>    
          <div class="card" title="vai a">
            <CDataTable
              class="col-12"
              v-if="bPStepLocal"
              :items="getDesignSpecificationList(item)"
              :items-per-page="5"
              :fields="fieldsDesignSpecification"
              hover
              pagination
            ></CDataTable>
          </div>
        </div>
      </span>
      <span v-else>Non sono presenti process design</span>
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
import CTableLink from "@/components/CTableLink.vue";
//import CModalDelete from "@/components/CModalDelete.vue";
import CTitle from "@/components/CTitle.vue";
var _ = require("lodash");

export default {
  name: "CBusinessProcessStepEdit",
  components: {
    CBusinessProcessDesignNew,
    CBusinessProcessDesignEdit,
    CTableLink,
    //  CModalDelete,
    CTitle,
  },

  data() {
    return {
      designTypeLocal: [],
      /*
      columns: [
        {
          key: "name",
          _style: { width: "50%" },
        },
        {
          key: "role",
          _style: { width: "50%" },
          filter: (values, onChange) => {
            const unique = [...new Set(values)].sort();
            return (
              <CMultiSelect
                size="sm"
                onChange={(selected) => {
                  const _selected = selected.map((element) => {
                    return element.value;
                  });
                  onChange((item) => {
                    return Array.isArray(_selected) && _selected.length
                      ? _selected.includes(item.toLowerCase())
                      : true;
                  });
                }}
                options={unique.map((element) => {
                  return {
                    value: element.toLowerCase(),
                    text: element,
                  };
                })}
              />
            );
          },
          sorter: false,
        },
      ],
      */

      fields: [
        {
          key: "nr",
          label: "#",
          _style: "width:1%;",
        },
        {
          key: "processDesignId",
          label: "id",
          _style: "width:2%;",
        },
        {
          key: "processDesignDescription",
          label: "Descrizione",
          _style: "width:4%;",
        },

        {
          key: "show_actions",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      fieldsDesignSpecification: [
        {
          key: "processSpecificationId",
          label: "ID ",
          _style: "width:2%;",
        },
        {
          key: "designTypeParent",
          label: "Tipo I/O",
          _style: "width:15%;",
        },

        
        {
          key: "designTypeType",
          label: "Dati I/O",
          _style: "width:15%;",
        },
        /*
        {
          key: "informationObjectId",
          label: "informationObject ID",
          _style: "width:auto;",
        },
        */
        {
          key: "informationObjectName",
          label: "Information Object Name",
          _style: "width:auto;",
        },
        /*
        {
          key: "informationObjectDescription",
          label: " information Object Description",
          _style: "width:20%;",
        },
        */
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
      type: Object,
      required: true,
      default: () => {},
    },
  },
  methods: {
    getProcessDesignsList: function () {
      if (this.bPStepLocal && this.bPStepLocal.processDesigns.length > 0) {
        return this.bPStepLocal.processDesigns.map((processDesign, index) => {
          return {
            nr: index + 1,
            processDesignId: processDesign.id,
            processDesignDescription: processDesign.descr,
            processSpecification: processDesign.processSpecification,
          };
        });
      } else {
        return [];
      }
    },
    getDesignSpecificationList: function (processDesign) {
      return processDesign.processSpecification.map(
        (processSpecification, index) => {
          return {
            nr: index + 1,
            processSpecificationId: processSpecification.id,

            designTypeParent:
              processSpecification.designType.parent == null
                ? processSpecification.designType.type
                : this.getDesignType(processSpecification.designType.parent),
            designTypeType:
              processSpecification.designType.parent == null
                ? ""
                : processSpecification.designType.type,
            informationObjectId: processSpecification.informationObject.id,
            informationObjectName: processSpecification.informationObject.name,
            informationObjectDescription:
              processSpecification.informationObject.descr,
          };
        }
      );
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
    handleView(item) {
      console.log(item);
      alert("funzione di update process step non attiva!");
      //this.$router.push({ name: "xxxDetails", params: { id: item.id } });
    },
    handleEdit(item) {
      console.log(item);
      alert("funzione di update process step non attiva!");
      //this.$router.push({ name: "xxxEdit", params: { id: item.id } });
    },
    handleDelete(item) {
      console.log(item);
      alert("funzione di update process step non attiva!");
      //this.$store.dispatch("xxx/delete", this.selectedTool.id);
      //this.showModal = false;
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
