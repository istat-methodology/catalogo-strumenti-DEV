<template>
  <div>
    <div>
      <CCardHeader
        ><i>{{ this.bFunctionName | dashEmpty }}</i> > Processi
      </CCardHeader>
      <div class="card-text">
        <span v-if="stateform == FormState.EDIT">
          <p class="card-text">Elenco referenti associati:</p></span
        >
      </div>
      <div v-if="stateform == FormState.NEW_AGENT">
        <app-agent-add :goBackClose="true" @appClose="closeNewAgent" />
      </div>

      <div v-if="stateform == FormState.NEW">
        <CCardHeader
          >Nuovo Processo
          <div class="card-header-actions">
            <span class="icon-link" @click="handleSubmit()"
              ><floppy-icon title="Salva"/></span
            >&nbsp;
            <span
              class="icon-link"
              @click.prevent="stateform = FormState.LIST"
              title="Chiudi"
            >
              <close-circle-icon title="Chiudi" />
            </span>
          </div>
        </CCardHeader>
        <CCard>
          <CCardBody>
            <CInput
              label="Nome*"
              placeholder="Nome"
              v-model="bProcessLocal.name"
            />
            <CTextarea
              label="Descrizione"
              placeholder="Descrizione"
              v-model="bProcessLocal.descr"
            />
            <div class="row justify-content-between">
              <CInput
                class="col-4"
                label="Etichetta"
                placeholder="Etichetta"
                v-model="bProcessLocal.label"
              />
              <CInput
                label="Ordine"
                type="number"
                placeholder="Ordine"
                v-model="bProcessLocal.orderCode"
              />
            </div>
          </CCardBody>
        </CCard>
      </div>
      <div v-if="stateform == FormState.LIST">
        <div class="row justify-content-between">
          <div class="col-4"></div>
          <div class="col-4">
            <span
              class="icon-link"
              @click="stateform = FormState.NEW"
              title="Aggiungi una nuova associazione"
            >
              <add-box-icon /> Nuovo processo
            </span>
          </div>
        </div>
        <div class="columns">
          <div class="row">
            <div class="card" v-for="bProcess of bProcesses" :key="bProcess.id">
              <div class="card-header">
                {{ bProcess.name }}
                <div class="card-header-actions">
                  <span>
                    <span class="icon-link" @click="changeState(index)"
                      ><edit-icon title="Edit"/></span
                    >&nbsp;
                    <span class="icon-link" @click="modalOpen(linkedAgent)"
                      ><delete-icon title="Cancella"
                    /></span>
                  </span>
                </div>
              </div>
              <div class="card-body">
                <span
                  v-if="
                    bProcess.processSteps && bProcess.processSteps.length > 0
                  "
                >
                  <p class="card-text">Passi:</p>

                  <ol
                    v-for="processStep of bProcess.processSteps"
                    :key="processStep.id"
                  >
                    <li>{{ processStep.name }}</li>
                  </ol>
                </span>
                <span v-else>Non sono presenti passi</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <CModal
      title="Warning!"
      :show.sync="warningModal"
      @close="
        () => {
          this.$emit('refreshBProcess');
        }
      "
    >
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="deleteBProcess"
        >
          Delete
        </CButton>
      </template>
      Elimina Business Process '{{ selectedBProcess.name }}'?
    </CModal>
  </div>
</template>
<script>
//import { mapGetters } from "vuex";

export default {
  name: "BusinessProcessEditView",
  data() {
    return {
      selectedBProcess: {},
      states: [],
      FormState: {
        LIST: 0,
        EDIT: 1,
        NEW: 2,
        ADD_PROCESS: 3
      },
      stateform: 0,
      warningModal: false,
      bProcessLocal: {
        name: "",
        descr: "",
        label: "",
        orderCode: "",
        businessFunction: ""
      }
    };
  },
  computed: {
    //...mapGetters("procStep", ["procStepList"])
  },
  emits: ["refreshBProcess"],

  props: {
    bProcesses: {
      type: Array,
      required: true,
      default: () => []
    },
    functionId: {
      type: Number,
      required: true,
      default: null
    },
    bFunctionName: {
      type: String,
      required: true,
      default: null
    }
  },
  methods: {
    changeBProcess(value) {
      this.bProcessLocal.processStep = value.id;
    },
    handleSubmit() {
      this.bProcessLocal.businessFunction = this.functionId;
      console.log(this.bProcessLocal);
      this.$store
        .dispatch("bProcess/save", this.bProcessLocal)
        .then(this.$emit("refreshBProcess", this.functionId));
      this.stateform = this.FormState.LIST;
    },
    goBack() {
      this.$router.push("/catalogue/businessFunctions");
    },
    deleteBProcess() {
      this.$store
        .dispatch("bProcess/delete", this.selectedBProcess.id)
        .then(this.$emit("refreshBProcess"));
      this.warningModal = false;
    },

    modalOpen(app) {
      this.selectedBProcess = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    }
  },
  created() {
    //this.$store.dispatch("documentation/findAll");
    //this.$store.dispatch("tools/findAll");
    this.$store.dispatch("bProcess/findAll");
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
