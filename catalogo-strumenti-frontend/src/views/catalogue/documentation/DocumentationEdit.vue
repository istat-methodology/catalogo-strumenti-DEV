<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="documentation">
        <CCardHeader>Modifica Metodo Statistico</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome"
            placeholder="Name"
            v-model="documentation.name"
          />
          <CInput
            label="Editore"
            placeholder="Editore"
            v-model="documentation.publisher"
          />
          <CInput
            label="Documento"
            placeholder="Documento"
            v-model="documentation.documentType"
          />
          <CInput
            label="Note"
            placeholder="Note"
            v-model="documentation.notes"
          />
          <CInput
            label="Fonti"
            placeholder="Fonti"
            v-model="documentation.resource"
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
          >Back</CButton
        >
      </CCardFooter>
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
      documentationLocal: {
        id: "",
        name: "",
        publisher: "",
        documentType: "",
        notes: "",
        resource: ""
      }
    };
  },
  computed: {
    ...mapGetters("documentation", ["documentation"])
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
        .dispatch("documentation/update", this.documentationLocal)
        .then(() => {
          this.backToList();
        });
      /*   } */
    },
    setOldValues() {
      this.documentationLocal.id = this.documentation.id;
      this.documentationLocal.name = this.documentation.name;
      this.documentationLocal.publisher = this.documentation.publisher;
      this.documentationLocal.documentType = this.documentation.documentType;
      this.documentationLocal.notes = this.documentation.notes;
      this.documentationLocal.resource = this.documentation.resource;
    },
    backToList() {
      this.$router.push("/catalogue/documentazione");
    }
  },
  created() {
    //this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.$store
      .dispatch("documentation/findById", this.$route.params.id)
      .then(() => {
        this.setOldValues();
      });
  }
};
</script>
