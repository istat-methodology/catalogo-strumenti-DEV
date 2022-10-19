<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Nuova Business Function</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome*"
            placeholder="Nome"
            v-model="businessFunctionLocal.name"
            :class="{ 'is-invalid': $v.businessFunctionLocal.name.$error }"
          />
          <div
            class="help-block"
            :class="{ show: $v.businessFunctionLocal.name.$error }"
          >
            Campo obbligatorio
          </div>
          <CTextarea
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
import { required } from "vuelidate/lib/validators";
import { mapGetters } from "vuex";
export default {
  name: "businessFunctionsAdd",
  data() {
    return {
      businessFunctionLocal: {
        id: "0",
        name: "",
        descr: "",
        label: "",
        businessProcesses: []
      }
    };
  },
  validations: {
    businessFunctionLocal: {
      name: {
        required
      }
    }
  },
  computed: {
    ...mapGetters("bFunction", ["bFunction"])
  },
  methods: {
    handleSubmit() {
      this.$v.$touch(); //validate form data
      if (!this.$v.businessFunctionLocal.$invalid) {
        this.$store
          .dispatch("bFunction/save", this.businessFunctionLocal)
          .then(this.$router.push("/catalogue/businessfunctions"));
      }
    },
    goBack() {
      this.$router.push("/catalogue/businessfunctions");
    }
  },
  created() {
    this.$store.dispatch("bFunction/findAll");
  }
};
</script>
