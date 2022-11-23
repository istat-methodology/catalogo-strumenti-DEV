<template>
  <div>
    <div v-if="bPStepLocal">
      <div class="card">
        <div class="row">
          <CInput
            class="col-6"
            label="Nome*"
            placeholder="Nome"
            v-model="bPStepLocal.name"
          />
          <CInput
            class="col-4"
            label="Etichetta"
            placeholder="Etichetta"
            v-model="bPStepLocal.label"
          />
          <CInput
            class="col-2"
            label="Ordine"
            type="number"
            placeholder="Ordine"
            v-model="bPStepLocal.orderCode"
          />
        </div>
        <CTextarea
          label="Descrizione"
          placeholder="Descrizione"
          v-model="bPStepLocal.descr"
        />
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "ProcessStepNew",
  data() {
    return {
      bPStepLocal: {},
      warningModal: false
    };
  },
  computed: {},
  emits: ["enableEditStep"],

  props: {
    bProcess: {
      type: Object,
      required: true,
      default: () => []
    }
  },
  methods: {
    handleSubmit() {
      this.stateform = this.FormState.LIST;
    },
    handleEditStep(step) {
      this.$emit("enableEditStep", step);
    },
    goBack() {
      this.$router.push("/catalogue/businessFunctions");
    },
    deleteBProcess() {
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
  created() {}
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
