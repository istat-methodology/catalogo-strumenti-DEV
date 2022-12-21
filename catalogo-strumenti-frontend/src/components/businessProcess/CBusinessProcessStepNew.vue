<template>
  <div>
    <CTitle
      title="Nuovo Passo"
      buttonTitle=" nuovo passo"
      functionality=""
      :authenticated="isAuthenticated"
      :buttons="['salva', 'indietro']"
      @handleSubmit="handleSubmit"
      @handleBack="enableBack"
    />
    <CCard>
      <CCardBody>
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
        <div class="row">
          <CTextarea
          class="col-12"
            label="Descrizione"
            placeholder="Descrizione"
            v-model="bPStepLocal.descr"
          />
        </div>
      </CCardBody>
    </CCard>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "CBusinessProcessStepNew",
  components: {
    CTitle,
  },
  data() {
    return {
      bPStepLocalToSave: {
        index: "",
        name: "",
        label: "",
        description: "",
      },
      bPStepLocal: {
        index: "",
        name: "",
        label: "",
        description: "",
        processDesign: [
          {
            id: "",
            description: "",
            name: "",
            label: "",
            processDesignDescription: {
              id: "",
              descr: "",
            },
            designType: {
              id: "",
              type: "",
              parent: "",
            },
            informationObject: {
              id: "",
              name: "",
              descr: "",
              csmAppRoleId: "",
            },
          },
        ],
      },
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
  },
  emits: ["enableEditStep"],

  props: {
    bPStep: {
      type: Object,
      required: true,
      default: () => {},
    },
  },
  methods: {
    handleSubmit() {
      //alert("funzione di update process step non attiva!");
      //console.log("funzione di update process step non attiva!");
      this.bPStepLocalToSave.id = this.bPStepLocal.id;
      this.bPStepLocalToSave.index = this.bPStepLocal.index;
      this.bPStepLocalToSave.name = this.bPStepLocal.name;
      this.bPStepLocalToSave.label = this.bPStepLocal.label;
      this.bPStepLocalToSave.description = this.bPStepLocal.description;

      this.$store.dispatch("procStep/save", this.bPStepLocalToSave); //.then(() => {  alert(this.bPStepLocal())});
    },
    enableBack() {
      this.$emit("enableBack");
    },
  },
  created() {},
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
