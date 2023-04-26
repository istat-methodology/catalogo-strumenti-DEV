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
                  v-for="bProcess of bProcesses"
                  :key="bProcess.id"
                >
                  <div class="text-info center mt-2 mb-2">
                    <h6 class="card-header no-border text-info center row">
                      <div class="col-9">{{ bProcess.name }}</div>
                      <div class="row">
                        <div class="col">
                          <div class="card-header-actions float-right">
                            <span
                              class="icon-link text-info pr-1"
                              @click="handleEditBProcess(bProcess)"
                              ><edit-icon title="Edit"
                            /></span>
                            <span
                              class="icon-link text-info"
                              @click="handleOpenModalDelete(bProcess)"
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
                      <span
                        v-if="
                          bProcess.processSteps &&
                          bProcess.processSteps.length > 0
                        "
                      >
                        <div class="d-flex flex-wrap">
                          <ol
                            v-for="(
                              processStep, index
                            ) of bProcess.processSteps"
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
                v-model="bProcessLocal.name"
              />
              <CInput
                class="col-4"
                label="Etichetta"
                placeholder="Etichetta"
                v-model="bProcessLocal.label"
              />
              <CInput
                class="col-2"
                label="Ordine"
                type="number"
                placeholder="Ordine"
                v-model="bProcessLocal.orderCode"
              />
            </div>
            <div class="row mt-4">
              <CTextarea
                class="col-12"
                label="Descrizione"
                placeholder="Descrizione"
                v-model="bProcessLocal.descr"
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
          :title="selectedEditProcess.name"
          :buttonTitle="selectedEditProcess.name"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="stateform = FormState.LIST"
        />
        <div v-if="selectedEditProcess">
          <CBusinessProcessEdit
            :bProcess="selectedEditProcess"
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
            :bDesignType="designtypeList"
            :bPStep="selectedEditStep"
            @enableEditStep="showEditStep"
            @enableBack="stateform = FormState.EDIT"
          />
        </div>
      </div>
      <!-- 
        Nuovo Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_NEW">
        <!--div v-if="selectedEditProcess"-->
        <CBusinessProcessStepNew
          :bDesignType="designtypeList"
          :bPStep="selectedEditStep"
          @enableNewStep="showNewStep"
          @enableBack="stateform = FormState.EDIT"
        />
        <!--/div-->
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
      selectedBProcess: {},
      selectedBProcessId: null,
      selectedEditProcess: null,
      selectedEditStep: null,
      selectedEditProcessDesign: null,
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
      bProcessLocal: {
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
    ...mapGetters("designtypes", ["designtypeList"]),
  },
  emits: ["refreshBProcess"],

  props: {
    bFunctionId: {
      type: Number,
      required: true,
      default: null,
    },
    bFunctionName: {
      type: String,
      required: true,
      default: null,
    },
    bProcesses: {
      type: Array,
      required: true,
      default: () => {},
    },
  },
  methods: {
    changeBProcess(value) {
      this.bProcessLocal.processStep = value.id;
      alert(this.bProcessLocal.processStep);
    },
    handleSubmit() {
      this.bProcessLocal.businessFunction = this.bFunctionId;
      if (this.stateform == this.FormState.ADD) {
        this.$store
          .dispatch("bProcess/save", this.bProcessLocal)
          .then(this.$emit("refreshBProcess", this.bFunctionId));
      }
      if (this.stateform == this.FormState.EDIT) {
        this.bProcessLocal = this.selectedEditProcess;
        this.$store
          .dispatch("bProcess/update", this.bProcessLocal)
          .then(this.$emit("refreshBProcess", this.bFunctionId));
      }
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
      this.selectedEditStep = {};
      this.stateform = this.FormState.STEP_NEW;
    },
    handleEditBProcess(process) {
      this.selectedEditProcess = process;
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
      params.pID = this.selectedBProcess.id;
      this.$store
        .dispatch("bFunction/removeBProcess", params)
        .then(this.$emit("refreshBProcess", this.bFunctionId));
      this.showModal = false;
    },

    handleOpenModalDelete(app) {
      this.selectedBProcess = app;
      this.showModal = true;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il collegamento al Business Process: " +
        this.selectedBProcess.name +
        " selezionato? ['" +
        this.bFunctionId +
        " / " +
        this.selectedBProcess.id +
        "]"
      );
    },
  },
  created() {
    this.$store.dispatch("bProcess/findAll");
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
