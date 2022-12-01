<template>
  <div>
    <CTitle
        :title="'New Process Design di '+ bProcessStep.name"
        buttonTitle=" nuovo process design "
        functionality=""
        :authenticated="isAuthenticated"
        :buttons="['salva', 'indietro']"
        @handleSubmit="handleSubmit"
        @handleBack="handleBack"
      />
      <CCard>
        <CCardBody>
          <div class="row">
            <CInput
              class="col-6"
              label="Nome*"
              placeholder="Nome"
              v-model="bProcessDesignLocal.name"
            />
            <CInput
              class="col-4"
              label="Etichetta"
              placeholder="Etichetta"
              v-model="bProcessDesignLocal.label"
            />
            <CInput
              class="col-2"
              label="Index"
              placeholder="index"
              v-model="bProcessDesignLocal.index"
            />
          </div>
          <div class="row mt-4">
            <CTextarea
              class="col-12"
              label="Descrizione"
              placeholder="Descrizione"
              v-model="bProcessDesignLocal.descr"
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
  name: "CBusinessProcessDesignNew",
  components: {
    CTitle
  },
  data() {
    return {    
      bProcessDesignLocal:{}
    };
  },
  computed: { 
    ...mapGetters("auth", ["isAuthenticated"]),
  },
  //emits: ["enableNewProcessDesign"],
  props: {
    bProcessStep: {
      type: Object,
      required: true,
      default: () => {},
    },
    bProcessDesign: {
      type: Object,
      required: true,
      default: () => {},
    },
  },
  methods: {
    handleSubmit() {
      this.bProcessDesign = this.bProcessDesignLocal;
      this.$emit("enableNewProcessDesign", this.bProcessDesign);
    },
    handleBack() {
      this.$emit("enableBack");
    },
  },
  created() {
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
