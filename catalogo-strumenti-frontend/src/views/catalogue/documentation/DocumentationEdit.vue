<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="documentation">
        <CCardHeader>Modifica Documentazione</CCardHeader>
        <CCardBody>
          <div class="form-group">
            <CInput
              label="Nome*"
              placeholder="Nome"
              v-model="documentationLocal.name"
              :class="{ 'is-invalid': $v.documentationLocal.name.$error }"
            />
            <span
              class="help-block"
              :class="{ show: $v.documentationLocal.name.$error }"
              >Inserire nome della documentazione.</span
            >
          </div>
          <CInput
            label="Editore"
            placeholder="Editore"
            v-model="documentationLocal.publisher"
          />
       
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
          <CTextarea
            label="Note"
            placeholder="Note"
            v-model="documentationLocal.notes"
          />
          <CInput
            label="Fonti"
            placeholder="Fonti"
            v-model="documentationLocal.resource"
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
          :disabled="disabled"
          >Salva</CButton
        >
        <CButton
          shape="square"
          size="sm"
          color="light"
          @click.prevent="$router.back()"
          >Indietro</CButton
        >
      </CCardFooter>
    </div>
  </div>
</template>
<script>
import _ from "lodash";
import { mapGetters } from "vuex";
import { required } from "vuelidate/lib/validators";
export default {
  name: "DocumentationEdit",
  data() {
    return {
      disabled: false,
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

  validations: {
    documentationLocal: {
      name: {
        required
      },
      documentType: {
            required
        } 
    }
  },
  methods: {
    changeTool(value) {
      this.documentationLocal.tool = value.id;
    },
    changeDocumentType(value) {
      this.documentationLocal.documentType = value.id;
    },
    handleSubmit() {
      this.$v.$touch(); //validate form data
      if (!this.$v.$invalid) {
        this.disabled = true; //disable buttons
        this.$store
          .dispatch("documentation/update", this.documentationLocal)
          .then(() => {
            this.reloadMethod();
          });
      }
    },
    setOldValues() {
      this.documentationLocal.id = this.documentation.id;
      this.documentationLocal.name = this.documentation.name;
      this.documentationLocal.publisher = this.documentation.publisher;
      this.documentationLocal.documentType = this.documentation.documentType.id;
      this.documentationLocal.notes = this.documentation.notes;
      this.documentationLocal.resource = this.documentation.resource;
    
    },
    backToList() {
      this.$router.push("/catalogue/documentazione");
    },
     
    reloadMethod: _.debounce(function() {
       this.$store
      .dispatch("documentation/findById", this.documentationLocal.id)
      .then(() => {
        this.setOldValues();
      });
    }, 500)
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
