<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <div class="row">
        <div class="col-8">
          <CCardHeader class="mt-4 no-border">
            <h2>
              Nuovo documento
              <div class="card-header-actions">
                <button
                  class="btn btn-outline-primary text-center"
                  @click.prevent="handleSubmit"
                  title="Salva nuovo documento"
                >
                  <floppy-icon title="Salva documento" />
                </button>
                <button
                  class="btn btn-outline-primary text-center"
                  @click.prevent="$router.back()"
                  title="Indietro"
                >
                  <close-icon title="Indietro" />
                </button>
              </div>
            </h2>
          </CCardHeader>
          <CCard>           
            <CCardBody>
              <CInput
                label="Nome*"
                placeholder="Nome"
                v-model="documentationLocal.name"
                :class="{ 'is-invalid': $v.documentationLocal.name.$error }"
              />
              <div
                class="help-block"
                :class="{ show: $v.documentationLocal.name.$error }"
              >
                Campo obbligatorio
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
                v-model="documentationLocal.documentType.name"
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
                @input="changeTool"
              >
              </v-select>
              <div>
                <label>Metodo Statistico</label>
              </div>
              <v-select
                label="name"
                :options="statisticalMethodsList"
                placeholder="Metodo Statistico"
                @input="changeMethod"
              ></v-select>
            </CCardBody>
          </CCard>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { required } from "vuelidate/lib/validators";
import { mapGetters } from "vuex";
export default {
  name: "documentationAdd",
  data() {
    return {
      documentationLocal: {
        id: 0,
        name: "",
        publisher: "",
        documentType: "",
        notes: "",
        resource: "",
        tool: "",
        method: "",
      },
    };
  },
  validations: {
    documentationLocal: {
      name: {
        required,
      },
      documentType: {
        required,
      },
    },
  },
  computed: {
    ...mapGetters("documentation", ["documentation"]),
    ...mapGetters("documentationType", ["documentationTypeList"]),
    ...mapGetters("methods", ["statisticalMethodsList"]),
    ...mapGetters("tools", ["toolscatalog"]),
  },
  methods: {
    changeTool(value) {
      this.documentationLocal.tool = value.id;
    },
    changeMethod(value) {
      this.documentationLocal.method = value.id;
    },
    changeDocumentType(value) {
      this.documentationLocal.documentType = value.id;
    },
    handleSubmit() {
      this.$v.$touch(); //validate form data
      if (!this.$v.documentationLocal.$invalid) {
        this.$store
          .dispatch("documentation/save", this.documentationLocal)
          .then(this.$router.push("/catalogue/documentazione"));
      }
    },
    goBack() {
      this.$router.push("/catalogue/documentazione");
    },
    /* onChange(event) {
      this.tipologia = event.target.value;
    } */
  },
  created() {
    //this.$store.dispatch("documentation/findAll");

    this.$store.dispatch("tools/findAll");
    this.$store.dispatch("methods/findAll");
    this.$store.dispatch("documentationType/findAll");
  },
};
</script>
