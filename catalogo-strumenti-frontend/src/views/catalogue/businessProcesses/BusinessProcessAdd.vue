<template>
  <div class="row p-0">
    <div class="col-10 p-0 ml-0">
      <!--div v-if="stateform == FormState.EDIT">
        <CTitle
          :title="selectedEditProcess.name"
          :buttonTitle="selectedEditProcess.name"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['indietro']"
          @handleBack="stateform = FormState.LIST"
        />

        <div v-if="selectedEditProcess">
          <app-business-process-edit
            :bProcess="selectedEditProcess"
            @enableEditStep="showEditStep"
          >
          </app-business-process-edit>
        </div>
      </div-->

      <div v-if="stateform == FormState.STEP_EDIT">
        <CCardHeader
          ><i>{{ this.bFunctionName | dashEmpty }}</i> >
          <i>{{ this.selectedEditProcess.name | dashEmpty }}</i> > Modifica
          passo
          <span
            class="icon-link float-right"
            @click.prevent="stateform = FormState.LIST"
            title="Chiudi">
            <close-icon title="Chiudi" />
          </span>
        </CCardHeader>

        <div v-if="selectedEditStep">
          <app-business-process-step-edit
            :bPStep="selectedEditStep"
            @enableEditStep="showEditStep"
            @enableNewStep="showNewStep">
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
            title="Chiudi">
            <close-icon title="Chiudi" />
          </span>
        </CCardHeader>

        <div v-if="selectedEditProcess">
          <CBusinessProcessStepNew
            :bProcess="selectedEditProcess"
            @enableEditStep="showEditStep"
            @enableNewStep="showNewStep" />
        </div>
      </div>
      <div>
        <CTitle
          title="Processo"
          buttonTitle=" Processo"
          functionality="Nuovo"
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="handleBack" />
        <CCard>
          <CCardBody>
            <div class="row">
              <CInput
                class="col-6"
                label="Nome*"
                placeholder="Nome"
                v-model="bProcessLocal.name" />
              <CInput
                class="col-4"
                label="Etichetta"
                placeholder="Etichetta"
                v-model="bProcessLocal.label" />
              <CInput
                class="col-2"
                label="Ordine"
                type="number"
                placeholder="Ordine"
                v-model="bProcessLocal.orderCode" />
            </div>
            <div class="row mt-4">
              <CTextarea
                class="col-12"
                label="Descrizione"
                placeholder="Descrizione"
                v-model="bProcessLocal.descr" />
            </div>
          </CCardBody>
        </CCard>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex"
//import BusinessProcessEdit from "./BusinessProcessEdit";
//import CBusinessProcessStepEdit from "@/components/businessProcess/CBusinessProcessStepEdit.vue";
import CBusinessProcessStepNew from "@/components/businessProcess/CBusinessProcessStepNew"
import CTitle from "@/components/CTitle.vue"
export default {
  name: "BusinessProcessEditView",
  components: {
    //CBusinessProcessStepEdit,
    CBusinessProcessStepNew,
    CTitle
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
        STEP_NEW: 5
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
      }
    }
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcessList"])
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
      this.bProcessLocal.processStep = value.id
      alert(this.bProcessLocal.processStep)
    },
    handleSubmit() {
      this.bProcessLocal.businessFunction = this.functionId
      console.log(this.bProcessLocal)

      this.$store
        .dispatch("bProcess/save", this.bProcessLocal)
        .then(this.$emit("refreshBProcess", this.functionId))

      this.stateform = this.FormState.LIST
    },
    showEditStep(step) {
      this.selectedEditStep = step
      this.stateform = this.FormState.STEP_EDIT
    },
    showNewStep() {
      this.selectedEditStep = null
      this.stateform = this.FormState.STEP_NEW
    },
    handleEditBProcess(process) {
      this.selectedEditProcess = process
      this.stateform = this.FormState.EDIT
    },
    handleBack() {
      this.$router.push({ name: "BusinessProcessList" })
    }
  },
  created() {
    //this.$store.dispatch("documentation/findAll");
    //this.$store.dispatch("tools/findAll");
    this.$store.dispatch("bProcess/findAll")
  }
}
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
