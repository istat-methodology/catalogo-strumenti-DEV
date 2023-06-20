<template>
  <div>
    <!-- 
        Aggiungi Passo dalla lista
      -->
    <COrigin :origins="[pFunctionName, pProcess.name + pProcess.id]" />
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
          @input="selectIdFromStepList($event)"
        ></v-select>
        <span class="help-block">Seleziona un passo</span>
        <span class="icon-link float-right" @click="enableNewStep"
          ><add-icon />Nuovo Passo</span
        >
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
import COrigin from "@/components/COrigin.vue";

export default {
  name: "CBusinessProcessStepAdd",
  components: {
    CTitle,
    COrigin
  },
  data() {
    return {
      lProcessStep: {
        id: 0
      },
      FormState: {
        STEP_ADD: 21,
        STEP_NEW: 22
      },
      stateform: 21,
      bp: []
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcess"]),
    ...mapGetters("processSteps", ["processStepsList"])
  },
  props: {
    pFunctionName: {
      type: String,
      required: false,
      default: () => ""
    },
    pProcess: {
      type: Object,
      required: true,
      default: () => {}
    }
  },
  methods: {
    selectIdFromStepList(e) {
      this.lProcessStep.id = e.id;
      this.bp = [];
      this.bp = e.businessProcesses;
    },

    handleSubmit() {
      let pId = this.pProcess.id;
      let isSubmit = true;
      if (pId) {
        if (this.bp instanceof Array) {
          this.bp.forEach(function(item) {
            if (item.id === pId) {
              return (isSubmit = false);
            }
          });
        }
      }
      if (isSubmit == true) {
        let params = { idProcess: 0, idStep: 0 };
        params.idProcess = this.pProcess.id;
        params.idStep = this.lProcessStep.id;
        this.$store.dispatch("bProcess/addStep", params).then(() => {
          this.$emit("enableBack");
        });
      } else {
        this.$store.dispatch(
          "message/success",
          "Step già presente nel Process!",
          {
            root: true
          }
        );
      }
    },
    enableNewStep() {
      this.$emit("enableNewStep");
    },
    handleBack() {
      this.$emit("enableBack");
    }
  },
  created() {
    this.$store.dispatch("processSteps/findAll").catch(() => {});
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
