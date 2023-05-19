<template>
  <div>
    <!-- 
        Aggiungi Passo dalla lista
      -->
    <div v-if="stateform == FormState.STEP_ADD">
      <CTitle
        title="Elenco passi"
        buttonTitle=" Aggiungi Passo"
        functionality="AGGIUNGI PASSO DA ELENCO"
        :authenticated="isAuthenticated"
        :buttons="['salva', 'indietro']"
        @handleSubmit="handleSubmit()"
        @handleBack="handleBack"
      />
      <div class="card">
        <div class="card-slot" v-if="processStepsList">
          <label>Selezione passi esistenti:</label>
          <v-select
            label="name"
            :options="processStepsList"
            @input="selectId($event)"
          ></v-select>
          <span class="help-block">Seleziona un passo</span>
          <span
            class="icon-link float-right"
            @click="stateform = FormState.STEP_NEW"
            ><add-icon />Nuovo Passo</span
          >
        </div>
      </div>
    </div>

    <div v-if="stateform == FormState.STEP_NEW">
      <CTitle
        title="Nuovo Passo"
        :buttonTitle="' passo '"
        functionality="NUOVO PASSO"
        :authenticated="isAuthenticated"
        :buttons="['salva', 'indietro']"
        @handleSubmit="handleSubmit"
        @handleBack="stateform = FormState.STEP_ADD"
      />
      <CCard>
        <CCardBody>
          <div class="row">
            <CInput
              class="col-1"
              label="id"
              placeholder="id"
              v-model="lProcessStep.id"
              disabled
            />
            <CInput
              class="col-6"
              label="Nome*"
              placeholder="Nome"
              v-model="lProcessStep.name"
            />
            <CInput
              class="col-5"
              label="Etichetta"
              placeholder="Etichetta"
              v-model="lProcessStep.label"
            />
          </div>
          <div class="row mt-4">
            <CTextarea
              class="col-12"
              label="Descrizione"
              placeholder="Descrizione"
              v-model="lProcessStep.descr"
            />
          </div>
        </CCardBody>
      </CCard>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
//var _ = require("lodash");

export default {
  name: "CBusinessProcessStepNew",
  components: {
    CTitle,
  },
  data() {
    return {
      processStepToSave: {
        id: 0,
        name: "",
        descr: "",
        label: "",
        businessServiceId: 999,
        processIds: [],
        substep: 0,
      },
      lProcessStep: {
        id: 0,
        name: "",
        descr: "",
        label: "",
        businessServiceId: 999,
        processIds: [],
        substep: 0,
      },

      FormState: {
        STEP_ADD: 21,
        STEP_NEW: 22,
      },
      stateform: 21,
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("processSteps", ["processStepsList"]),
  },
  props: {
    pProcess: {
      type: Object,
      required: true,
      default: () => {},
    }
  },
  methods: {
    selectId(e) {
      this.lProcessStep.id = e.id;
      this.lProcessStep.name = e.name;
      this.lProcessStep.descr = e.descr;
      this.lProcessStep.label = e.label;
    },

    handleSubmit() {
      if (this.stateform == this.FormState.STEP_ADD) {
        let params = { idProcess: 0, idStep: 0 };
        params.idProcess = this.pProcess.id;
        params.idStep = this.lProcessStep.id;
        this.$store.dispatch("bProcess/addStep", params);
      } else if (this.stateform == this.FormState.STEP_NEW) {
        this.processStepToSave.id = this.lProcessStep.id;
        this.processStepToSave.name = this.lProcessStep.name;
        this.processStepToSave.label = this.lProcessStep.label;
        this.processStepToSave.descr = this.lProcessStep.descr;
        this.processStepToSave.businessServiceId =
          this.lProcessStep.businessServiceId;
        if (this.pProcess) {
          this.processStepToSave.processIds.push(this.pProcess.id);
        }
        this.processStepToSave.substep = this.lProcessStep.substep;
        this.$store.dispatch("processSteps/save", this.processStepToSave);
        this.$emit("refreshProcess", this.pFunctionId);
      }
      this.$emit("enableBack");
    },
    handleBack() {
      this.$emit("enableBack");
    },
  },
  created() {
    this.$store.dispatch("processSteps/findAll").catch(() => {});
    //this.lDesignType = _.map(this.pDesignType, "type");
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
