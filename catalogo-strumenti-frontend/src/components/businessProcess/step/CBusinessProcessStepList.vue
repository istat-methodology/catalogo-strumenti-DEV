<template>
  <div>
    <div v-if="lProcess">
      <CTitle
        title="Passi"
        buttonTitle=" Passo"
        functionality=""
        :authenticated="isAuthenticated"
        :buttons="['aggiungi']"
        @handleNew="handleNewStep"
      />
      <CCard>
        <CCardBody>
          <span v-if="lProcess.processSteps">
            <CDataTable
              v-if="lProcess"
              :items="getProcessStepsList()"
              :fields="fields"
              :items-per-page="10"
              hover
              pagination
              ><template #show_details="{ item }">
                <CTableLink
                  :authenticated="isAuthenticated"
                  @handleEdit="handleEditStep(item)"
                  @handleDelete="handleOpenModalDelete(item)"
                />
              </template>
            </CDataTable>
          </span>
          <span v-else>Non sono presenti passi</span>
        </CCardBody>
      </CCard>
      <CModalDelete
        :message="getMessage()"
        :showModal="showModal"
        @closeModal="closeModal"
        @handleDelete="handleDelete"
      />
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
import CTableLink from "@/components/CTableLink.vue";
import CModalDelete from "@/components/CModalDelete.vue";

export default {
  name: "CBusinessProcessEdit",
  components: {
    //CBusinessProcessDesignNew,
    CTitle,
    CTableLink,
    CModalDelete,
  },
  data() {
    return {
      fields: [
        {
          key: "id",
          label: "id",
          _style: "width:2%;",
        },
        {
          key: "name",
          label: "Nome",
          _style: "width:10%;",
        },
        {
          key: "label",
          label: "etichetta",
          _style: "width:10%;",
        },
        {
          key: "descr",
          label: "Descrizione",
          _style: "width:10%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      lProcess: {
        id: "",
        name: "",
        descr: "",
        label: "",
        orderCode: "",
        businessFunction: "",
      },
      selectedProcessStep: {},
      showModal: false    
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
  },
  props: {
    pFunctionId: {
      type: Number,
      required: false,
      default: null,
    },
    pFunctionName: {
      type: String,
      required: false,
      default: null,
    },
    pProcess: {
      type: Object,
      required: true,
      default: () => {},
    },
  },
  methods: {
    getProcessStepsList: function () {
      if (this.lProcess && this.lProcess.processSteps) {
        return this.lProcess.processSteps.map((step) => {
          return {
            id: step.id,
            name: step.name == null ? "" : step.name,
            label: step.label == null ? "" : step.label,
            descr: step.descr == null ? "" : step.descr,
            //tool: step.businessService == null ? "" : step.businessService.name,
            stepInstances:
              step.stepInstances == null
                ? ""
                : step.stepInstances
                    .map((instance) => {
                      return (
                        instance.functionality + " (" + instance.method + ")"
                      );
                    })
                    .join(", "),
            processDesigns: step.processDesigns,
          };
        });
      } else {
        return [];
      }
    },

    handleEditStep(step) {
      this.$emit("enableEditStep", step);
    },
    handleNewStep() {
      this.$emit("enableNewStep");
    },
    handleBack() {
      this.$emit("enableBack");
    },
    handleOpenModalDelete(app) {
      this.selectedProcessStep = app;
      this.showModal = true;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il passo " +
        this.selectedProcessStep.name +
        " selezionato?"
      );
    },
    handleDelete() {
      let params = { idStep: 0, idProcess: 0 };
      params.idStep = this.selectedProcessStep.id;
      params.idProcess = this.pProcess.id;
      this.$store.dispatch("processSteps/removeStep", params);
    },
    closeModal() {
      this.showModal = false;
    },
  },
  created() {
    this.lProcess = this.pProcess;
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
