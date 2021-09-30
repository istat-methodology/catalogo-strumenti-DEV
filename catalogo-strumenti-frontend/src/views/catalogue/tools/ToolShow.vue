<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Tool</CCardHeader>
        <CCardBody>
          <CInput label="Nome" placeholder="Nome" v-model="tool.nome" />
          <!--  <div class="help-block" :class="{ show: $v.dug.name.$error }">
            This field is required
          </div> -->
          <CInput
            label="Descrizione"
            placeholder="Descrizione"
            v-model="tool.descrizione"
          />
          <CInput label="Autore" placeholder="Autore" v-model="tool.autore" />
          <CInput
            label="Documentazione"
            placeholder="Documentazione"
            v-model="tool.documentazione"
          />
          <CInput
            label="Metodo Statistico"
            placeholder="Metoo Statistico"
            v-model="tool.metodoStatistico"
          />
          <CInput
            label="Note di Compilazione"
            placeholder="Note di Compilazione"
            v-model="tool.note"
          />
          <CInput
            label="Standard"
            placeholder="Standard"
            v-model="tool.standard"
          />
          <CInput label="Tags" placeholder="Tags" v-model="tool.tags" />
          <CInput
            label="Versione"
            placeholder="Versione"
            v-model="tool.versione"
          />
          <CInput
            label="Tipologia"
            placeholder="Tipologia"
            v-model="tool.tipologia"
          />
          <CInput
            label="Riferimenti"
            placeholder="Riferimenti"
            v-model="tool.riferimenti"
          />
        </CCardBody>
        <CCardFooter>
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
  name: "ToolShow",
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
    backToList() {
      this.$router.push("/catalogue/tools");
    }
  },
  created() {
    this.$store.dispatch("tools/findById", this.$route.params.id);
  }
};
</script>
