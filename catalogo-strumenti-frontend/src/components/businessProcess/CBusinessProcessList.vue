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
              @handleNew="stateform = FormState.ADD"
              @handleBack="handleBack"
            />
            <div class="columns">
              <div class="row">
                <div
                  class="col-4"
                  v-for="process of pProcesses"
                  :key="process.id"
                >
                  <div class="text-info center mt-2 mb-2">
                    <h6 class="card-header no-border text-info center row">
                      <div class="col-9">{{ process.name }}</div>
                      <div class="row">
                        <div class="col">
                          <div class="card-header-actions float-right">
                            <span
                              class="icon-link text-info pr-1"
                              @click="handleEditProcess(process)"
                              ><edit-icon title="Edit"
                            /></span>
                            <span
                              class="icon-link text-info"
                              @click="handleOpenModalDelete(process)"
                              ><delete-icon title="Cancella"
                            /></span>
                          </div>
                        </div>
                      </div>
                    </h6>
                  </div>
                  <div class="card col-12">
                    <div class="card-body">
                      <div class="row mb-2"><strong>Passi:</strong></div>
                      <span v-if="process.processSteps">
                        <div class="d-flex flex-wrap">
                          <ol
                            v-for="(
                              processStep, index
                            ) of process.processSteps"
                            :key="processStep.id"
                          >
                            <li
                              class="list-group-item list-group-item-action p-0 p-1 border cursor-pointer"
                            >
                              <strong>{{ index + 1 + ")" }} </strong>
                              {{ processStep.name }}
                            </li>
                          </ol>
                        </div>
                      </span>
                      <span v-else>
                        <div class="list-group">
                          <li
                            class="list-group-item list-group-item-action p-0 p-1 no-border cursor-pointer"
                          >
                            Non sono presenti passi
                          </li>
                        </div>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 
        Aggiungi Processo dalla lista
      -->
      <div v-if="stateform == FormState.ADD">
        <CTitle
          title="Aggiungi Processo"
          buttonTitle=" Aggiungi Processo"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit()"
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
      <!-- 
        Crea nuovo Processo
      -->
      <div v-if="stateform == FormState.NEW">
        <CTitle
          title="Nuovo Processo"
          buttonTitle=" Nuovo Processo"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="stateform = FormState.ADD"
        />
        <CCard>
          <CCardBody>
            <div class="row">
              <CInput
                class="col-6"
                label="Nome*"
                placeholder="Nome"
                v-model="lProcess.name"
              />
              <CInput
                class="col-4"
                label="Etichetta"
                placeholder="Etichetta"
                v-model="lProcess.label"
              />
              <CInput
                class="col-2"
                label="Ordine"
                type="number"
                placeholder="Ordine"
                v-model="lProcess.orderCode"
              />
            </div>
            <div class="row mt-4">
              <CTextarea
                class="col-12"
                label="Descrizione"
                placeholder="Descrizione"
                v-model="lProcess.descr"
              />
            </div>
          </CCardBody>
        </CCard>
      </div>
      <!-- 
        Modifica Processo
      -->
      <div v-if="stateform == FormState.EDIT">
        <CTitle
          :title="selectedProcess.name"
          :buttonTitle="selectedProcess.name"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="stateform = FormState.LIST"
        />
        <div v-if="selectedProcess">
          <CBusinessProcessEdit
          
            :pProcess="selectedProcess"
            @enableEditStep="showEditStep"
            @enableNewStep="showNewStep"
          />
        </div>
      </div>
      <!-- 
        Modifica Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_EDIT">
        <div v-if="selectedEditStep">
          <CBusinessProcessStepEdit
          :pProcess="selectedProcess"
            :pPStep="selectedEditStep"
            :pDesignType="designtypeList"
            @enableBack="stateform = FormState.EDIT"
          />
        </div>
      </div>
      <!-- 
        Nuovo Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_NEW">
        <CBusinessProcessStepNew
        :pProcess="selectedProcess"
          :pPStep="selectedEditStep"
          :pDesignType="designtypeList"
          @enableBack="stateform = FormState.EDIT"
        />
      </div>
    </div>
    <CModalDelete
      :message="getMessage()"
      :showModal="showModal"
      @closeModal="closeModal"
      @handleDelete="handleDelete"
    />
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CBusinessProcessEdit from "@/components/businessProcess/CBusinessProcessEdit";
import CBusinessProcessStepEdit from "@/components/businessProcess/CBusinessProcessStepEdit";
import CBusinessProcessStepNew from "@/components/businessProcess/CBusinessProcessStepNew";
import CModalDelete from "@/components/CModalDelete.vue";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "CBusinessProcessList",
  components: {
    CBusinessProcessEdit,
    CBusinessProcessStepEdit,
    CBusinessProcessStepNew,
    CModalDelete,
    CTitle,
  },
  data() {
    return {
      selectedProcess: {},
      selectedProcessId: null,
      selectedEditStep: {},
      selectedEditStepId: null,
      selectedProcessDesign: {},
      selectedProcessDesignId:null,
      states: [],
      FormState: {
        LIST: 0,
        EDIT: 1,
        NEW: 2,
        ADD: 3,
        STEP_EDIT: 4,
        STEP_NEW: 5,
      },
      stateform: 0,
      warningModal: false,
      lProcess: {
        id: "",
        name: "",
        descr: "",
        label: "",
        orderCode: "",
        businessFunction: "",
      },
      showModal: false,
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcessList"]),
    ...mapGetters("filter", ["params"]),
    ...mapGetters("designtypes", ["designtypeList"]),
  },
  emits: ["refreshProcess"],

  props: {
    pFunctionId: {
      type: Number,
      required: true,
      default: null,
    },
    pFunctionName: {
      type: String,
      required: true,
      default: null,
    },
    pProcesses: {
      type: Array,
      required: true,
      default: () => {},
    },
  },
  methods: {
    /*changeProcess(value) {
      this.lProcess.processStep = value.id;
      alert(this.lProcess.processStep);
    },
    */
    handleSubmit() {
      this.lProcess.businessFunction = this.pFunctionId;
      if (
        this.stateform == this.FormState.ADD ||
        this.stateform == this.FormState.NEW
      ) {
        this.$store
          .dispatch("bProcess/save", this.lProcess)
          .then(this.$emit("refreshProcess", this.pFunctionId));
      }
      if (this.stateform == this.FormState.EDIT) {
        this.lProcess = this.selectedProcess;
        this.$store
          .dispatch("bProcess/update", this.lProcess)
          .then(this.$emit("refreshProcess", this.pFunctionId));
      }
      this.stateform = this.FormState.LIST;
    },
    selectId(e) {
      this.lProcess.id = e.id;
      this.lProcess.name = e.name;
      this.lProcess.descr = e.descr;
      this.lProcess.label = e.label;
      this.lProcess.orderCode = e.orderCode;
    },
    showEditStep(step) {
      this.selectedEditStep = step;
      this.stateform = this.FormState.STEP_EDIT;
    },
    showNewStep() {
      this.selectedEditStep = {};
      this.stateform = this.FormState.STEP_NEW;
    },
    handleEditProcess(process) {
      this.selectedProcess = process;
      this.stateform = this.FormState.EDIT;
    },
    handleBack() {
      this.$router.back();
    },
    closeModal() {
      this.showModal = false;
    },

    handleDelete() {
      let params = { fID: 0, pID: 0 };
      params.fID = this.bFunctionId;
      params.pID = this.selectedProcess.id;
      this.$store
        .dispatch("bFunction/removeProcess", params)
        .then(this.$emit("refreshProcess", this.pFunctionId));
      this.showModal = false;
    },

    handleOpenModalDelete(app) {
      this.selectedBProcess = app;
      this.showModal = true;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il collegamento al Business Process: " +
        this.selectedProcess.name +
        " selezionato? ['" +
        this.pFunctionId +
        " / " +
        this.selectedProcess.id +
        "]"
      );
    },
  },
  created() {
    this.$store.dispatch("bProcess/filter", this.params).catch(() => {});
    this.$store.dispatch("designtypes/findAll");
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
