<template>
  <div class="row p-0">
    <div class="col-12 p-0 ml-0">
      <!--       
        Elenco Processi      
      -->
      <div v-if="stateform == FormState.PROCESS_LIST">
        <div class="row p-0">
          <div class="col-12 p-0">
            <COrigin :origins="[pFunctionName]" />
            <CTitle
              title="Processi"
              buttonTitle=" Processo"
              functionality="elenco processi"
              :authenticated="isAuthenticated"
              :buttons="['aggiungi', 'indietro']"
              @handleNew="showAddProcess"
              @handleBack="handleBack"
            />
            <div v-if="pProcesses">
              <div class="columns">
                <div class="row">
                  <div
                    class="col-4"
                    v-for="process of pProcesses"
                    :key="process.id"
                  >
                    <div class="text-info center mt-2 mb-2" v-if="process">
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
                        <span v-if="pProcesses.length == 0">
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
            <div v-if="!pProcesses">
              <div class="list-group">
                <li
                  class="list-group-item list-group-item-action p-0 p-1 no-border cursor-pointer"
                >
                  Non sono presenti progetti
                </li>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 
        Aggiungi Processo dalla lista
      -->
      <div v-if="stateform == FormState.PROCESS_ADD">
        <COrigin :origins="[pFunctionName]" />
        <CBusinessProcessAdd
          :pFunctionId="pFunctionId"
          :pFunctionName="pFunctionName"
          @enableNew="showNewProcess"
          @enableBack="showListProcess"
        />
      </div>
      <!-- 
        Crea nuovo Processo
      -->
      <div v-if="stateform == FormState.PROCESS_NEW">
        <COrigin :origins="[pFunctionName]" />
        <CBusinessProcessNew
          :pFunctionId="pFunctionId"
          :pFunctionName="pFunctionName"
          @enableAdd="showAddProcess"
          @enableBack="showListProcess"
        />
      </div>
      <!-- 
        Modifica Processo
      -->
      <div v-if="stateform == FormState.PROCESS_EDIT">
        <div v-if="bProcess">
          <COrigin :origins="[pFunctionName]" />
          <CBusinessProcessEdit
            :pFunctionId="pFunctionId"
            :pFunctionName="pFunctionName"
            :pProcess="bProcess"
            @enableBack="showListProcess"
          />
          <CBusinessProcessStepList
            :pFunctionId="pFunctionId"
            :pFunctionName="pFunctionName"
            :pProcess="bProcess"
            @enableViewStep="showViewStep"
            @enableEditStep="showEditStep"
            @enableAddStep="showAddStep"
            @enableNewStep="showNewStep"
            @enableBack="showListProcess"
          />
        </div>
      </div>
      <!-- 
        Visualizza Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_VIEW">
        <div v-if="bProcess">
          <div v-if="selectedEditStep">
            <CBusinessProcessStepView
              :pFunctionName="pFunctionName"
              :pProcess="bProcess"
              :pPStep="selectedEditStep"
              :pDesignType="designtypeList"
              @enableBack="showEditProcess"
            />
          </div>
        </div>
      </div>
      <!-- 
        Modifica Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_EDIT">
        <div v-if="bProcess">
          <div v-if="selectedEditStep">
            <CBusinessProcessStepEdit
              :pFunctionName="pFunctionName"
              :pProcess="bProcess"
              :pPStep="selectedEditStep"
              :pDesignType="designtypeList"
              @enableBack="showEditProcess"
            />
          </div>
        </div>
      </div>
    </div>
    <!-- 
        Nuovo Passo del Processo dalla lista
      -->
    <div v-if="stateform == FormState.STEP_ADD">
      <div v-if="bProcess">
        <CBusinessProcessStepAdd
          :pFunctionName="pFunctionName"
          :pProcess="bProcess"
          :pPStep="selectedEditStep"
          @enableNewStep="showNewStep"
          @enableBack="showEditProcess"
        />
      </div>
    </div>
    <!-- 
        Nuovo Passo del Processo
      -->
    <div v-if="stateform == FormState.STEP_NEW">
      <div v-if="bProcess">
        <CBusinessProcessStepNew
          :pFunctionName="pFunctionName"
          :pProcess="bProcess"
          :pPStep="selectedEditStep"
          @enableAddStep="showAddStep"
          @enableBack="showEditProcess"
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
import CBusinessProcessAdd from "@/components/businessProcess/process/CBusinessProcessAdd";
import CBusinessProcessNew from "@/components/businessProcess/process/CBusinessProcessNew";
import CBusinessProcessEdit from "@/components/businessProcess/process/CBusinessProcessEdit";

import CBusinessProcessStepList from "@/components/businessProcess/step/CBusinessProcessStepList";
import CBusinessProcessStepView from "@/components/businessProcess/step/CBusinessProcessStepView";
import CBusinessProcessStepEdit from "@/components/businessProcess/step/CBusinessProcessStepEdit";
import CBusinessProcessStepAdd from "@/components/businessProcess/step/CBusinessProcessStepAdd";
import CBusinessProcessStepNew from "@/components/businessProcess/step/CBusinessProcessStepNew";

import CModalDelete from "@/components/CModalDelete.vue";
import CTitle from "@/components/CTitle.vue";
import COrigin from "@/components/COrigin.vue";

var _ = require("lodash");

export default {
  name: "CBusinessProcessList",
  components: {
    CBusinessProcessAdd,
    CBusinessProcessNew,
    CBusinessProcessEdit,
    CBusinessProcessStepList,
    CBusinessProcessStepView,
    CBusinessProcessStepEdit,
    CBusinessProcessStepAdd,
    CBusinessProcessStepNew,
    CModalDelete,
    CTitle,
    COrigin,
  },
  data() {
    return {
      selectedProcess: {},
      selectedProcessId: null,
      selectedEditStep: {},
      selectedEditStepId: null,
      selectedProcessDesign: {},
      selectedProcessDesignId: null,
      states: [],
      FormState: {
        PROCESS_LIST: 10,
        PROCESS_VIEW: 11,
        PROCESS_EDIT: 12,
        PROCESS_NEW: 13,
        PROCESS_ADD: 14,

        STEP_VIEW: 20,
        STEP_ADD: 21,
        STEP_NEW: 22,
        STEP_EDIT: 23,
      },
      stateform: 10,

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
    ...mapGetters("filter", ["params"]),
    ...mapGetters("designtypes", ["designtypeList"]),
    ...mapGetters("bProcess", ["bProcess"]),
  },
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
    handleDelete() {
      let params = { fID: 0, pID: 0 };
      params.fID = this.pFunctionId;
      params.pID = this.selectedProcess.id;
      this.$store
        .dispatch("bFunction/removeProcess", params)
        .then(this.$emit("refreshProcess", this.pFunctionId));
      this.showModal = false;
    },
    showListProcess() {
      this.stateform = this.FormState.PROCESS_LIST;
      this.$emit("refreshProcess", this.pFunctionId);
    },
    showNewProcess() {
      this.stateform = this.FormState.PROCESS_NEW;
    },
    showAddProcess() {
      this.stateform = this.FormState.PROCESS_ADD;
    },
    showEditProcess: _.debounce(function () {
      if (this.bProcess) {
        this.$store.dispatch("bProcess/findById", this.bProcess.id).then(() => {
          this.stateform = this.FormState.PROCESS_EDIT;
        });
      }
    }, 500),
    showViewStep(step) {
      this.selectedEditStep = step;
      this.stateform = this.FormState.STEP_VIEW;
    },
    showEditStep(step) {
      this.selectedEditStep = step;
      this.stateform = this.FormState.STEP_EDIT;
    },
    showAddStep() {
      this.selectedEditStep = {};
      this.stateform = this.FormState.STEP_ADD;
    },
    showNewStep() {
      this.selectedEditStep = {};
      this.stateform = this.FormState.STEP_NEW;
    },

    handleEditProcess: _.debounce(function (process) {
      if (process) {
        this.$store.dispatch("bProcess/findById", process.id).then(() => {
          this.stateform = this.FormState.PROCESS_EDIT;
        });
      }
    }, 500),

    handleBack() {
      this.$router.back();
    },
    closeModal() {
      this.showModal = false;
    },
    handleOpenModalDelete(app) {
      this.selectedProcess = app;
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
    loadProcess: _.debounce(function (process) {
      this.$store.dispatch("bProcess/findById", process.id).then(() => {});
    }, 500),
  },
  created() {
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
