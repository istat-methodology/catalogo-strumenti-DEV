<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="bFunction">
        <CCardHeader>Modifica Business Function</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome"
            placeholder="Nome"
            v-model="businessFunctionLocal.name"
          />
          <CInput
            label="Descrizione"
            placeholder="Descrizione"
            v-model="businessFunctionLocal.descr"
          />
          <CInput
            label="Etichetta"
            placeholder="Etichetta"
            v-model="businessFunctionLocal.label"
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
      businessFunctionLocal: {
        id: "",
        name: "",
        descr: "",
        label: "",
        businessProcesses: []
      }
    };
  },
  computed: {
    ...mapGetters("bFunction", ["bFunction"])
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
      this.$store
        .dispatch("bFunction/update", this.businessFunctionLocal)
        .then(() => {
          this.backToList();
        });
      /*   } */
    },
    setOldValues() {
      this.businessFunctionLocal.id = this.bFunction.id;
      this.businessFunctionLocal.name = this.bFunction.name;
      this.businessFunctionLocal.descr = this.bFunction.descr;
      this.businessFunctionLocal.label = this.bFunction.label;
      this.businesFunctionLocal.businessProcesses = this.bFunction.businessProcesses;
    },
    backToList() {
      this.$router.push("/catalogue/businessfunctions");
    }
  },
  created() {
    //this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.$store
      .dispatch("bFunction/findById", this.$route.params.id)
      .then(() => {
        this.setOldValues();
      });
    //this.$store.dispatch("tools/findAll");
    this.$store.dispatch("bFunction/findAll");
  }
};
</script>
