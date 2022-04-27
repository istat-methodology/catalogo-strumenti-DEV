<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Nuova Business Function</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome"
            placeholder="Nome"
            v-model="businessLocal.name"
          />
          <CInput
            label="Descrizione"
            placeholder="Descrizione"
            v-model="businessLocal.descr"
          />
          <CInput
            label="Etichetta"
            placeholder="Etichetta"
            v-model="businessLocal.label"
          />
          <CInput
            label="Codice Ordine"
            placeholder="Codie Ordine"
            v-model="businessLocal.orderCode"
          />
          <CInput
            label="Processo Padre"
            placeholder="Processso Padre"
            v-model="businessLocal.parent"
          />
        </CCardBody>
      </CCard>

      <CCardFooter>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          class="mr-2"
          @click.prevent="handleSubmit"
          >Aggiungi</CButton
        >
        <CButton shape="square" size="sm" color="light" @click.prevent="goBack"
          >Indietro</CButton
        >
      </CCardFooter>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
export default {
  name: "businessAdd",
  data() {
    return {
      businessLocal: {
        id: "0",
        name: "",
        descr: "",
        label: "",
        orderCode: "",
        parent: "",
        processSteps: []
      }
    };
  },
  computed: {
    ...mapGetters("business", ["business"])
  },
  methods: {
    handleSubmit() {
      this.$store
        .dispatch("business/save", this.businessLocal)
        .then(this.$router.push("/catalogue/businessfunctions"));
      /*   } */
    },
    goBack() {
      this.$router.push("/catalogue/businessfunctions");
    }
  },
  created() {
    this.$store.dispatch("business/findAll");
  }
};
</script>
