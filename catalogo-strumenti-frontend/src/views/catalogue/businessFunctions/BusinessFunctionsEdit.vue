<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="business">
        <CCardHeader>Modifica Business Function</CCardHeader>
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
        </CCardBody>
      </CCard>
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
          >Indietro</CButton
        >
      </CCardFooter>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
/* import { required } from "vuelidate/lib/validators"; */
export default {
  name: "BusinessFunctionsEdit",
  data() {
    return {
      businessLocal: {
        id: "",
        name: "",
        descr: "",
        label: "",
        businessProcesses: []
      }
    };
  },
  computed: {
    ...mapGetters("business", ["business"])
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
      this.$store.dispatch("business/update", this.businessLocal).then(() => {
        this.backToList();
      });
      /*   } */
    },
    setOldValues() {
      this.businessLocal.id = this.business.id;
      this.businessLocal.name = this.business.name;
      this.businessLocal.descr = this.business.descr;
      this.businessLocal.label = this.business.label;
      this.businessLocal.businessProcesses = this.business.businessProcesses;
    },
    backToList() {
      this.$router.push("/catalogue/businessfunctions");
    }
  },
  created() {
    //this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.$store
      .dispatch("business/findById", this.$route.params.id)
      .then(() => {
        this.setOldValues();
      });
    //this.$store.dispatch("tools/findAll");
    this.$store.dispatch("business/findAll");
  }
};
</script>
