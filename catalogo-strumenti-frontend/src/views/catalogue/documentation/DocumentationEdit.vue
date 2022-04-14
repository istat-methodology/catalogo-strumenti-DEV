<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="documentation">
        <CCardHeader>Modifica Documentazione</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome"
            placeholder="Nome"
            v-model="documentationLocal.name"
          />
          <CInput
            label="Editore"
            placeholder="Editore"
            v-model="documentationLocal.publisher"
          />
          <!-- <CInput
            label="Tipo Documento"
            placeholder="Tipo Documento"
            v-model="documentationLocal.documentType.name"
          /> -->
          <div>
            <label>Tipo Documento</label>
          </div>
          <v-select
            label="name"
            :options="documentationTypeList"
            placeholder="Strumento Statistico"
            v-model="documentation.documentType.name"
            @input="changeDocumentType"
          ></v-select>
          <CInput
            label="Note"
            placeholder="Note"
            v-model="documentationLocal.notes"
          />
          <CInput
            label="Fonti"
            placeholder="Fonti"
            v-model="documentationLocal.resource"
          />
          <div>
            <label>Strumento Statistico</label>
          </div>

          <v-select
            label="name"
            :options="toolscatalog"
            placeholder="Strumento Statistico"
            v-model="documentation.tool.name"
            @input="changeTool"
          ></v-select>
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
  name: "DocumentationEdit",
  data() {
    return {
      documentationLocal: {
        id: "",
        name: "",
        publisher: "",
        documentType: "",
        notes: "",
        resource: "",
        tool: ""
      }
    };
  },
  computed: {
    ...mapGetters("documentation", ["documentation"]),
    ...mapGetters("documentationType", ["documentationTypeList"]),
    ...mapGetters("tools", ["toolscatalog"])
  },

  /* validations: {
    dug: {
      name: {
        required
      }
    }
  }, */
  methods: {
    changeTool(value) {
      this.documentationLocal.tool = value.id;
    },
    changeDocumentType(value) {
      this.documentationLocal.documentType = value.id;
    },
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
      this.documentationLocal.documentType = this.documentation.documentType.id;
      this.documentationLocal.notes = this.documentation.notes;
      this.documentationLocal.resource = this.documentation.resource;
      this.documentationLocal.tool = this.documentation.tool.id;
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
    this.$store.dispatch("tools/findAll");
    this.$store.dispatch("documentationType/findAll");
  }
};
</script>
