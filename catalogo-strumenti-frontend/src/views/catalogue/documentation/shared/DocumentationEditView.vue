<template>
  <div>
    <div v-if="stateform == FormState.ADD" class="col-12">
      <CCardHeader>Seleziona un documento
        <div class="card-header-actions">
          <span class="icon-link" @click.prevent="handleAddSubmit" :disabled="true">
            <floppy-icon title="Salva Associazione" />
          </span>
          &nbsp; &nbsp; &nbsp;
          <span class="icon-link" @click.prevent="stateform = FormState.LIST">
            <close-circle-icon title="Torna alla lista" />
          </span>
        </div>
      </CCardHeader>

      <div class="card-slot" v-if="documentationList">
        <v-select :options="getAllDocumentations" label="name" placeholder="Elenco documenti"
          @input="selectId($event)" />
        <span class="help-block">Seleziona una documentazione</span>
      </div>
      <div class="card-slot">
        <span class="icon-link float-right" @click="stateform = FormState.NEW">
          <add-icon />Crea Nuovo Documento
        </span>
      </div>
    </div>

    <div v-if="stateform == FormState.NEW" class="col-12">
      <CCardHeader>Aggiungi Nuovo Documento
        <div class="card-header-actions">
          <span class="icon-link" @click.prevent="handleNewSubmit">
            <floppy-icon title="Salva Nuovo documento" />
          </span>
          &nbsp; &nbsp; &nbsp;
          <span class="icon-link" @click.prevent="stateform = FormState.LIST">
            <close-circle-icon title="Torna alla lista" />
          </span>
        </div>
      </CCardHeader>
      <CCard class="col-12">
        <CCardBody>
          <CInput label="Nome*" placeholder="Nome" v-model="documentationLocal.name" />
          <CInput label="Editore" placeholder="Editore" v-model="documentationLocal.publisher" />
          <div>
            <label>Tipo Documento</label>
          </div>
          <v-select label="name" :options="documentationTypeList" placeholder="Tipo documento"
            v-model="documentationLocal.documentType"></v-select>
          <CTextarea label="Note" placeholder="Note" v-model="documentationLocal.notes" />
          <CInput label="Fonti" placeholder="Fonti" v-model="documentationLocal.resource" />
        </CCardBody>
      </CCard>
    </div>

    <div v-if="stateform == FormState.LIST">
      <div class="card-header">
        &nbsp;Elenco Documenti disponibili:
        <div class="card-header-actions">
          <span class="icon-link float-right" @click="stateform = FormState.ADD">
            <add-icon title="Aggiungi un nuovo documento" />&nbsp;Aggiungi
            Documento
          </span>
        </div>
      </div>
      <div class="columns">
        <div class="row">
          <div class="card col-3" v-for="documentation of documentations" :key="documentation.id">
            <div class="card-header">
              {{ documentation.name }}
              <div class="card-header-actions">
                <router-link tag="a" :to="{
                  name: 'DocumentationDetails',
                  params: { id: documentation.id },
                }">
                  <view-icon />
                </router-link>
                <span class="icon-link" @click="modalOpen(documentation)">
                  <delete-icon />
                </span>
              </div>
            </div>
            <div class="card-body">
              <p class="card-text">{{ documentation.documentType }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <CModal title="Warning!" :show.sync="warningModal" @close="
      () => {
        this.$emit('updateParent');
      }
    ">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton shape="square" size="sm" color="primary" @click="handleRemoveSubmit">
          Delete
        </CButton>
      </template>
      Elimina Documento '{{ selectedDoc.name }}'?
    </CModal>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
export default {
  name: "DocumentationEditView",
  data() {
    return {
      selectedDoc: {},
      selectedDocId: null,
      warningModal: false,
      FormState: {
        LIST: 0,
        ADD: 1,
        NEW: 2,
      },
      stateform: 0,
      documentationLocal: {
        name: "",
        publisher: "",
        documentType: "",
        resource: "",
        tool: this.toolId,
        method: this.methodId,
      },
    };
  },
  computed: {
    ...mapGetters("documentationType", ["documentationTypeList"]),
    ...mapGetters("documentation", ["documentationList"]),
    getAllDocumentations() {
      if (this.documentationList) {
        return this.documentationList.map((item) => {
          return {
            id: item.id,
            name:
              (item.name == null ? "" : item.name) +
              " - " +
              (item.documentType.name == null ? "" : item.documentType.name),
          };
        });
      } else {
        return [];
      }
    },
  },
  emits: ["updateParent"],

  props: {
    documentations: {
      type: Array,
      required: true,
      default: () => [],
    },
    toolId: {
      type: Number,
      required: false,
      default: null,
    },
    methodId: {
      type: Number,
      required: false,
      default: null,
    },
    parentName: {
      type: String,
      required: true,
      default: null,
    },
  },
  methods: {
    changeTool(value) {
      this.documentationLocal.tool = value.id;
    },

    changeDocumentType(value) {
      this.documentationLocal.documentType = value.id;
    },
    selectId(e) {
      this.selectedDocId = e.id;
    },
    handleAddSubmit() {
      console.log(this.selectedDocId)
      let params = { id: 0, docID: 0 };

      if (this.selectedDocId) {
        if (this.toolId) {

          params.id = this.toolId;
          params.docID = this.selectedDocId;
          this.$store
            .dispatch(
              "tools/addDocumentation",
              params
            )
            .then(this.$emit("updateParent"));
        }
        if (this.methodId) {

          params.id = this.methodId;
          params.docID = this.selectedDocId;
          this.$store
            .dispatch(
              "methods/addDocumentation",
              params
            )
            .then(this.$emit("updateParent"));
        }
      }
    },
    handleNewSubmit() {
      this.documentationLocal.tool = this.toolId;
      this.documentationLocal.method = this.methodId;
      this.documentationLocal.documentType =
        this.documentationLocal.documentType.id;

      this.$store
        .dispatch("documentation/save", this.documentationLocal)
        .then(this.$emit("updateParent"));
      this.viewNewDocument = false;
    },
    goBack() {
      this.$router.push("/catalogue/documentazione");
    },
    deleteDocumentation() {
      this.$store
        .dispatch("documentation/delete", this.selectedDoc.id)
        .then(this.$emit("updateParent"));

    },
    handleRemoveSubmit() {

      let params = { id: 0, docID: 0 };

      if (this.selectedDoc.id) {
        if (this.toolId) {

          params.id = this.toolId;
          params.docID = this.selectedDoc.id;
          this.$store
            .dispatch(
              "tools/removeDocumentation",
              params
            )
            .then(this.$emit("updateParent"));
        }
        if (this.methodId) {

          params.id = this.methodId;
          params.docID = this.selectedDoc.id;
          this.$store
            .dispatch(
              "methods/removeDocumentation",
              params
            )
            .then(this.$emit("updateParent"));
        }
      }
      this.warningModal = false;
    },
    modalOpen(app) {
      this.selectedDoc = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    },
  },
  created() {
    this.$store.dispatch("documentation/findAll");
    //this.$store.dispatch("tools/findAll");
    this.$store.dispatch("documentationType/findAll");
  },
};
</script>
<style scoped>
h5 {
  margin-bottom: 0.1rem;
}

.card-border {
  border: 1px solid #d8dbe0 !important;
  box-shadow: none !important;
}

.bg-lighter {
  background-color: #f8f8f8 !important;
}

.material-design-icon {
  margin-bottom: 0.2rem;
}

* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding in columns */
.row {
  margin: 0 -5px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  /* this adds the "card" effect */
  padding: 12px;
  text-align: left;
  background-color: #f1f1f1;
  margin-left: 5px;
}

/* Responsive columns - one column layout (vertical) on small screens */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}
</style>
