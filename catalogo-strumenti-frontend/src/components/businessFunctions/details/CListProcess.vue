<template>
  <div class="row p-0">
    <div class="col-12 p-0">
      <!--       
        Elenco Processi      
      -->
      <div v-if="stateform == FormState.LIST_PROCESS">
        <h2>Processi</h2>
        <div class="columns">
          <div class="row">
            <div
              class="col-4"
              v-for="bProcess of businessProcesses"
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
                          @click="handleViewProcess(bProcess)"
                          ><view-icon title="view"
                        /></span>
                      </div>
                    </div>
                  </div>
                </h6>
              </div>
              <div class="card">
                <div class="card-body">
                  <div class="row mb-2"><strong>Passi:</strong></div>
                  <span v-if="bProcess.processSteps">
                    <div class="d-flex flex-wrap">
                      <ol
                        v-for="(processStep, index) of bProcess.processSteps"
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
    <!-- 
        View Processo
      -->
    <div v-if="stateform == FormState.VIEW_PROCESS">
      <h2>Processo</h2>
      <div v-if="selectedEditProcess">
        <CViewProcess
          :bProcess="selectedEditProcess"
          @enableShowStep="showViewStep"
          @enableBack="stateform = FormState.LIST_PROCESS"
        />
      </div>
    </div>
    <!-- 
        Modifica Passo del Processo
      -->
    <div v-if="stateform == FormState.VIEW_STEP">
      <h2 class="pt-2 pb-2">Passo</h2>

      <div v-if="selectedEditStep">
        <CViewStep
          :bDesignType="designtypeList"
          :bPStep="selectedEditStep"
          @enableBack="stateform = FormState.VIEW_PROCESS"
        />
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CViewProcess from "@/components/businessFunctions/details/CViewProcess.vue";
import CViewStep from "@/components/businessFunctions/details/CViewStep.vue";

export default {
  name: "CListProcess",
  components: {
    CViewProcess,
    CViewStep
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
        LIST_PROCESS: 0,
        VIEW_PROCESS: 1,
        VIEW_STEP: 4
      },
      stateform: 0,
      warningModal: false,
      bProcessLocal: {
        id: "",
        name: "",
        descr: "",
        label: "",
        orderCode: "",
        businessFunction: ""
      },
      showModal: false
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("designtypes", ["designtypeList"])
  },
  emits: ["refreshBProcess"],

  props: {
    businessProcesses: {
      type: Array,
      required: true,
      default: () => []
    }
  },
  methods: {
    selectId(e) {
      this.bProcessLocal.id = e.id;
      this.bProcessLocal.name = e.name;
      this.bProcessLocal.descr = e.descr;
      this.bProcessLocal.label = e.label;
      this.bProcessLocal.orderCode = e.orderCode;
    },
    showViewStep(step) {
      this.selectedEditStep = step;
      this.stateform = this.FormState.VIEW_STEP;
    },
    handleViewProcess(process) {
      this.selectedEditProcess = process;
      this.stateform = this.FormState.VIEW_PROCESS;
    },
    handleBack() {
      this.$router.back();
    }
  },
  created() {
    this.$store.dispatch("designtypes/findAll");
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
