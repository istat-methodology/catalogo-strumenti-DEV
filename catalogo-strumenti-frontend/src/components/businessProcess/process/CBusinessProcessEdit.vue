<template>
  <div>
    <div v-if="lProcess">
      <CTitle
        :title="lProcess.name"
        :buttonTitle="lProcess.name"
        functionality="modifica processo"
        :authenticated="isAuthenticated"
        :buttons="['salva', 'indietro']"
        @handleSubmit="handleSubmit"
        @handleBack="handleBack"
      />
      <CCard>
        <CCardBody>
          <div class="row">
            <CInput
              disabled
              class="col-1"
              label="id"
              placeholder="id"
              v-model="lProcess.id"
            />
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
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";

export default {
  name: "CBusinessProcessEdit",
  components: {
    CTitle
  },
  data() {
    return {
      lProcess: {
        id: "",
        name: "",
        descr: "",
        label: "",
        orderCode: "",
        businessFunction: ""
      }
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"])
  },
  props: {
    pFunctionId: {
      type: Number,
      required: false,
      default: null
    },
    pFunctionName: {
      type: String,
      required: false,
      default: null
    },
    pProcess: {
      type: Object,
      required: true,
      default: () => {}
    }
  },
  methods: {
    handleBack() {
      this.$emit("enableBack");
    },
    handleSubmit() {
      if (this.pFunctionId != null) {
        this.lProcess.businessFunction = this.pFunctionId;
      }
      this.$store.dispatch("bProcess/update", this.lProcess);      
      this.$emit("enableBack");
    },
  },
  created() {
    this.lProcess = this.pProcess;
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
