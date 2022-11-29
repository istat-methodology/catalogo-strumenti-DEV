<template>
  <div v-if="bPStepLocal">
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
            label="Funzione"
            placeholder="Funzione"
            v-model="bPStepLocal.stepInstances"
          />
        </div>

        <div class="row mt-4">
          <label class="col-12 mt-4">processDesigns:</label>

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
                  <span class="icon-link" @click="handleEditStep(item)"
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
</template>
<script>
export default {
  name: "CBusinessProcessStepEdit",
  data() {
    return {
      fields: [
        {
          key: "index",
          label: "#",
          _style: "width:1%;",
        },
        {
          key: "id",
          label: "id",
          _style: "width:20%;",
        },

        {
          key: "descr",
          label: "descrizione",
          _style: "width:40%;",
        },
        {
          key: "id_processDesignDescription",
          label: "ID Process Designs",
          _style: "width:20%;",
        },
        {
          key: "description_processDesignDescription",
          label: "Description Process Designs",
          _style: "width:20%;",
        },
        {
          key: "id_designType",
          label: "ID Design Type ",
          _style: "width:20%;",
        },
        {
          key: "type_designType",
          label: "type Design Type",
          _style: "width:20%;",
        },
        {
          key: "id_informationObject",
          label: "id informationObject",
          _style: "width:20%;",
        },
        {
          key: "name_informationObject",
          label: "name informationObject",
          _style: "width:20%;",
        },
        {
          key: "description_informationObject",
          label: "description informationObject",
          _style: "width:20%;",
        },
        {
          key: "csmAppRoleId_informationObject",
          label: "csmAppRoleId informationObject",
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
      bPStepLocal: {},
      states: [],
      FormState: {},
      stateform: 0,
      warningModal: false,
    };
  },
  computed: {},
  emits: ["enableEditStep"],
  props: {
    bPStep: {
      type: Object,
      required: true,
      default: () => [],
    },
  },
  methods: {
    getProcessDesignsList: function () {
      if (this.bPStepLocal && this.bPStepLocal.processDesigns.length > 0) {
        return this.bPStepLocal.processDesigns.map((step, index) => {
          return {
            index: index + 1,
            id: step.id,
            descr: step.descr,
            id_processDesignDescription: step.processDesignDescription.id,
            description_processDesignDescription: step.processDesignDescription.descr,
            id_designType: step.designType.id,
            type_designType: step.designType.type,

            id_informationObject: step.informationObject.id,
            name_informationObject: step.informationObject.name,
            description_informationObject: step.informationObject.descr,
            csmAppRoleId_informationObject: step.informationObject.csmAppRoleId,
            
          }
        });
      } else {
        return [];
      }
    },
    handleEditStep(step) {
      this.$emit("enableEditStep", step);
    },
    handleBack() {
      this.$emit("handeleBack");
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
