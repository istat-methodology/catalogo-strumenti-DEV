<template>
  <div class="row p-0">
    <div class="col-10 p-0 ml-0">
      <!--       
        Elenco Processi      
      -->
      <div v-if="stateform == FormState.LIST">
        <div class="row p-0">
          <div class="col-12 p-0">
            <CTitle
              title="Processi"
              buttonTitle=" Processo"
              functionality=""
              :authenticated="isAuthenticated"
              :buttons="['aggiungi', 'indietro']"
              @handleNew="stateform = FormState.ADD_PROCESS"
              @handleBack="handleBack"
            />

            <div class="columns">
              <div class="row">
                <div
                  class="card col-md-3 mr-4"
                  v-for="bProcess of bProcesses"
                  :key="bProcess.id"
                >
                  <div class="card-header">
                    {{ bProcess.name }}
                    <div class="card-header-actions">
                      <span>
                        <span
                          class="icon-link"
                          @click="handleEditBProcess(bProcess)"
                          ><edit-icon title="Edit" /></span
                        >&nbsp;
                        <span class="icon-link" @click="modalOpen(bProcess)"
                          ><delete-icon title="Cancella"
                        /></span>
                      </span>
                    </div>
                  </div>
                  <div class="card-body">
                    <span
                      v-if="
                        bProcess.processSteps &&
                        bProcess.processSteps.length > 0
                      "
                    >
                      <ol>
                        <strong>Passi:</strong>
                        <li
                          v-for="processStep of bProcess.processSteps"
                          :key="processStep.id"
                        >
                          {{ processStep.name }}
                        </li>
                      </ol>
                    </span>
                    <span v-else>Non sono presenti passi</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 
        Nuovo Processo
      -->
      <div v-if="stateform == FormState.ADD_PROCESS">
        <CTitle
          title="Aggiungi Processo"
          buttonTitle=" Aggiungi Processo"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="stateform = FormState.LIST"
        />
        <div class="card">
          <div class="card-slot" v-if="bProcessList">
            <label>Elenco Processi esistenti</label>
            <v-select
              label="name"
              :options="bProcessList"
              @input="selectId($event)"
            ></v-select>
            <span class="help-block">Seleziona un processo</span>
            <span
              class="icon-link float-right"
              @click="stateform = FormState.NEW"
              ><add-icon />Nuovo Processo</span
            >
          </div>
        </div>
      </div>
      <div v-if="stateform == FormState.EDIT">
        <CTitle
          :title="selectedEditProcess.name"
          :buttonTitle="selectedEditProcess.name"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva','indietro']"
          @handleBack="stateform = FormState.LIST"
        />

        <div v-if="selectedEditProcess">
          <app-business-process-edit
            :bProcess="selectedEditProcess"
            @enableEditStep="showEditStep"
          >
          </app-business-process-edit>
        </div>
      </div>

      <div v-if="stateform == FormState.STEP_EDIT">
        <CCardHeader
          ><i>{{ this.bFunctionName | dashEmpty }}</i> >
          <i>{{ this.selectedEditProcess.name | dashEmpty }}</i> > Modifica
          passo
          <span
            class="icon-link float-right"
            @click.prevent="stateform = FormState.LIST"
            title="Chiudi"
          >
            <close-icon title="Chiudi" />
          </span>
        </CCardHeader>

        <div v-if="selectedEditStep">
          <app-business-process-step-edit
            :bPStep="selectedEditStep"
            @enableEditStep="showEditStep"
            @enableNewStep="showNewStep"
          >
          </app-business-process-step-edit>
        </div>
      </div>

      <div v-if="stateform == FormState.STEP_NEW">
        <CCardHeader
          ><i>{{ this.bFunctionName | dashEmpty }}</i> >
          <i>{{ this.selectedEditProcess.name | dashEmpty }}</i> > Nuovo passo

          <span
            class="icon-link float-right"
            @click.prevent="stateform = FormState.EDIT"
            title="Chiudi"
          >
            <close-icon title="Chiudi" />
          </span>
        </CCardHeader>

        <div v-if="selectedEditProcess">
          <app-business-process-step-new
            :bProcess="selectedEditProcess"
            @enableEditStep="showEditStep"
            @enableNewStep="showNewStep"
          >
          </app-business-process-step-new>
        </div>
      </div>

      <div v-if="stateform == FormState.NEW">
        <CTitle
          title="Nuovo Processo"
          buttonTitle=" Nuovo Processo"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="stateform = FormState.LIST"
        />
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
import { mapGetters } from "vuex";
import BusinessProcessEdit from "./BusinessProcessEdit";
import ProcessStepEdit from "../../processSteps/shared/ProcessStepEdit";
import ProcessStepNew from "../../processSteps/shared/ProcessStepNew";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "BusinessProcessEditView",
  components: {
    "app-business-process-edit": BusinessProcessEdit,
    "app-business-process-step-edit": ProcessStepEdit,
    "app-business-process-step-new": ProcessStepNew,
    CTitle,
  },
  data() {
    return {
      selectedBProcess: {},
      selectedBProcessId: null,
      selectedEditProcess: null,
      selectedEditStep: null,
      states: [],
      FormState: {
        LIST: 0,
        EDIT: 1,
        NEW: 2,
        ADD_PROCESS: 3,
        STEP_EDIT: 4,
        STEP_NEW: 5,
      },
      stateform: 0,
      warningModal: false,
      bProcessLocal: {
        id: "",
        name: "",
        descr: "",
        label: "",
        orderCode: "",
        businessFunction: "",
      },
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcessList"]),
  },
  emits: ["refreshBProcess"],

  props: {
    bProcesses: {
      type: Array,
      required: true,
      default: () => [],
    },
    functionId: {
      type: Number,
      required: true,
      default: null,
    },
    bFunctionName: {
      type: String,
      required: true,
      default: null,
    },
  },
  methods: {
    changeBProcess(value) {
      this.bProcessLocal.processStep = value.id;
      alert(this.bProcessLocal.processStep);
    },
    handleSubmit() {
      this.bProcessLocal.businessFunction = this.functionId;
      console.log(this.bProcessLocal);
      this.$store
        .dispatch("bProcess/save", this.bProcessLocal)
        .then(this.$emit("refreshBProcess", this.functionId));

      this.stateform = this.FormState.LIST;
    },
    selectId(e) {
      this.bProcessLocal.id = e.id;
      this.bProcessLocal.name = e.name;
      this.bProcessLocal.descr = e.descr;
      this.bProcessLocal.label = e.label;
      this.bProcessLocal.orderCode = e.orderCode;
    },
    showEditStep(step) {
      this.selectedEditStep = step;
      this.stateform = this.FormState.STEP_EDIT;
    },
    showNewStep() {
      alert("pippo");
      this.selectedEditStep = null;
      this.stateform = this.FormState.STEP_NEW;
    },
    handleEditBProcess(process) {
      this.selectedEditProcess = process;
      this.stateform = this.FormState.EDIT;
    },

    handleBack() {
      this.$router.back();
    },

    deleteBProcess() {
      alert("da rivedere! vuoi cancellare la l'id:  " + this.selectedBProcess.id);
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
    },
  },
  created() {
    //this.$store.dispatch("tools/findAll");
    this.$store.dispatch("bProcess/findAll");
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

