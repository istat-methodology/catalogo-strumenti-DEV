<template>
  <div class="row p-0">
    <div class="col-10 p-0 ml-0">
      <!-- 
        Aggiungi Processo dalla lista
      -->

      <CTitle
        title="Elenco dei Processi"
        buttonTitle=" Aggiungi Processo"
        functionality="AGGIUNGI PROCESS DA ELENCO"
        :authenticated="isAuthenticated"
        :buttons="['salva', 'indietro']"
        @handleSubmit="handleSubmit()"
        @handleBack="handleBack"
      />
      <div class="card">
        <div class="card-slot" v-if="bProcessList">
          <label>seleziona un processo esistente</label>
          <v-select
            label="name"
            :options="bProcessList"
            @input="selectIdFromProcessList($event)"
          ></v-select>
          <span class="help-block">Seleziona un processo</span>
          <span class="icon-link float-right" @click="handleNew"
            ><add-icon />Nuovo Processo</span
          >
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "CBusinessProcessAdd",
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
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcessList"]),
    ...mapGetters("filter", ["params"])
  },
  props: {
    pFunctionId: {
      type: Number,
      required: true,
      default: null
    },
    pFunctionName: {
      type: String,
      required: true,
      default: null
    }
  },
  methods: {
    selectIdFromProcessList(e) {
      this.lProcess.id = e.id;
    },
    handleSubmit() {
      let params = { fID: 0, pID: 0 };
      params.fID = this.pFunctionId;
      params.pID = this.lProcess.id;
      this.$store.dispatch("bFunction/addProcess", params);
      this.$emit("enableBack");
    },
    handleNew() {
      this.$emit("enableNew");
    },
    handleBack() {
      this.$emit("enableBack");
    }
  },
  created() {
    this.$store.dispatch("bProcess/filter", this.params).catch(() => {});
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
