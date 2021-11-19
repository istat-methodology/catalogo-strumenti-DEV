<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Tool</CCardHeader>
        <CCardBody>
          <CInput label="Nome" placeholder="Nome" v-model="toolLocal.nome" />
          <!--  <div class="help-block" :class="{ show: $v.dug.name.$error }">
            This field is required
          </div> -->
          <CInput
            label="Descrizione"
            placeholder="Descrizione"
            v-model="toolLocal.descrizione"
          />
          <CInput
            label="Metodo Statistico"
            placeholder="Metoo Statistico"
            v-model="toolLocal.metodoStatistico"
          />
          <CInput
            label="Note di Compilazione"
            placeholder="Note di Compilazione"
            v-model="toolLocal.note"
          />
          <CInput
            label="Standard"
            placeholder="Standard"
            v-model="toolLocal.standard"
          />
          <CInput label="Tags" placeholder="Tags" v-model="toolLocal.tags" />
          <CInput
            label="Versione"
            placeholder="Versione"
            v-model="toolLocal.versione"
          />
          <CInput
            label="Tipologia"
            placeholder="Tipologia"
            v-model="toolLocal.tipologia"
          />
          <CInput
            label="Riferimenti"
            placeholder="Riferimenti"
            v-model="toolLocal.riferimenti"
          />
        </CCardBody>
        <CCardFooter>
          <CButton
            shape="square"
            size="sm"
            color="primary"
            class="mr-2"
            @click.prevent="handleSubmit"
            >Update</CButton
          >
          <CButton
            shape="square"
            size="sm"
            color="light"
            @click.prevent="backToList"
            >Back</CButton
          >
        </CCardFooter>
      </CCard>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
/* import { required } from "vuelidate/lib/validators"; */
export default {
  name: "ToolEdit",
  data() {
    return {
      toolLocal: {
        id: "",
        data: "",
        descrizione: "",
        metodoStatistico: "",
        nome: "",
        note: "",
        standard: "",
        tags: "",
        versione: "",
        tipologia: "",
        riferimenti: ""
      }
    };
  },
  computed: {
    ...mapGetters("tools", ["tool"])
  },
  /* validations: {
    dug: {
      name: {
        required
      }
    }
  }, */
  methods: {
    handleSubmit() {
      /*  this.$v.$touch(); //validate form data
      if (!this.$v.dug.$invalid) { */
      this.$store.dispatch("tools/update", this.toolLocal).then(() => {
        this.backToList();
      });
      /*   } */
    },
    setOldValues() {
      this.toolLocal.id = this.tool.id;
      this.toolLocal.data = this.tool.data;
      this.toolLocal.descrizione = this.tool.descrizione;
      this.toolLocal.metodoStatistico = this.tool.metodoStatistico;
      this.toolLocal.nome = this.tool.nome;
      this.toolLocal.note = this.tool.note;
      this.toolLocal.standard = this.tool.standard;
      this.toolLocal.tags = this.tool.tags;
      this.toolLocal.versione = this.tool.versione;
      this.toolLocal.tipologia = this.tool.tipologia;
      this.toolLocal.riferimenti = this.tool.riferimenti;
    },
    backToList() {
      this.$router.push("/catalogue/tools");
    }
  },
  created() {
    this.$store.dispatch("tools/findById", this.$route.params.id);
    this.$store.dispatch("tools/findById", this.$route.params.id).then(() => {
      this.setOldValues();
    });
  }
};
</script>
