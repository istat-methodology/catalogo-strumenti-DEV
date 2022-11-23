<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div v-if="documentation" class="col-12 pt-2">
      <div class="col-8 p-0">
        <CTitle
          :maintitle="documentation.name"
          title="Documento"
          buttonTitle=" Documento"
          functionality="Modifica"
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="handleBack"
        />
      </div>
      <CCard class="col-8 p-0 pl-1 pr-1">
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
    </div>
  </div>
</template>
<script>
import _ from "lodash";
import { mapGetters } from "vuex";
import { required } from "vuelidate/lib/validators";
import CTitle from "@/components/CTitle.vue";

export default {
  name: "DocumentationEdit",
  components: { CTitle },
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
    ...mapGetters("auth", ["isAuthenticated"]),
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
    handleBack() {
      //this.$router.push("/catalogue/documentazione");
      this.$router.back();
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
