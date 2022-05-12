<template>
  <div>
    <CCardHeader
      ><i>{{ this.toolName | dashEmpty }}</i> > Documentazione
      <div v-if="!viewNewDocument" class="card-header-actions">
        <span class="icon-link float-right" @click="viewNewDocument = true"
          ><add-icon title="Aggiungi un nuovo documento" />&nbsp;Nuovo
          Documento</span
        >
      </div>
    </CCardHeader>

    <div v-if="viewNewDocument" class="col-12">
      <CCard class="col-12">
        <CCardHeader
          >Nuovo Documento
          <div class="card-header-actions">
            <span class="icon-link float-right" @click.prevent="handleSubmit"
              ><floppy-icon title="Salva" />
            </span>
            &nbsp;
            <span
              class="icon-link float-right"
              @click.prevent="viewNewDocument = false"
              ><circle-close-icon title="Chiudi" />
            </span>
          </div>
        </CCardHeader>
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
          <div>
            <label>Tipo Documento</label>
          </div>
          <v-select
            label="name"
            :options="documentationTypeList"
            placeholder="Tipo documento"
            v-model="documentationLocal.documentType"
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

        <CButton
          shape="square"
          size="sm"
          color="primary"
          class="mr-2"
          @click.prevent="handleSubmit"
          >Salva</CButton
        >
        <CButton
          shape="square"
          size="sm"
          color="light"
          @click.prevent="viewNewDocument = false"
          >Chiudi</CButton
        >
      </CCard>
    </div>
    <CCardBody>
      <div class="row">
        <div v-if="documentations.length === 0">
          <span>Nessuna documentazione associata</span>
        </div>
        <div v-else>
          <p class="card-text">Elenco documenti disponibili:</p>
        </div>
      </div>

      <div class="row">
        <div
          class="card col-3"
          v-for="documentation of documentations"
          :key="documentation.id"
        >
          <div class="card-header">
            {{ documentation.name }}
            <div class="card-header-actions">
              <router-link
                tag="a"
                :to="{
                  name: 'DocumentationDetails',
                  params: { id: documentation.id },
                }"
              >
                <view-icon />
              </router-link>
              <span class="icon-link" @click="modalOpen(documentation)"
                ><delete-icon />
              </span>
            </div>
          </div>
          <div class="card-body">
            <p class="card-text">{{ documentation.documentType }}</p>
          </div>
        </div>
      </div>
    </CCardBody>
    <CModal
      title="Warning!"
      :show.sync="warningModal"
      @close="
        () => {
          this.$emit('refreshTool');
        }
      "
    >
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="deleteDocumentation"
        >
          Delete
        </CButton>
      </template>
      Elimina referente '{{ selectedDoc.name }}'?
    </CModal>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
export default {
  name: "DocumentationView",
  data() {
    return {
      viewAddDocument: true,
      viewNewDocument: false,
      selectedDoc: {},
      warningModal: false,
      documentationLocal: {
        name: "",
        publisher: "",
        documentType: "",
        resource: "",
        tool: this.toolId
      }
    };
  },
  computed: {
    ...mapGetters("documentationType", ["documentationTypeList"])
  },
  emits: ["refreshTool"],

  props: {
    documentations: {
      type: Array,
      required: true,
      default: () => []
    },
    toolId: {
      type: Number,
      required: true,
      default: null
    },
    toolName: {
      type: String,
      required: true,
      default: null
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
      this.documentationLocal.tool = this.toolId;
      this.documentationLocal.documentType = this.documentationLocal.documentType.id;
      console.log(this.documentationLocal);
      this.$store
        .dispatch("documentation/save", this.documentationLocal)
        .then(this.$emit("refreshTool"));
      this.viewNewDocument = false;
    },
    goBack() {
      this.$router.push("/catalogue/documentazione");
    },
    deleteDocumentation() {
      this.$store
        .dispatch("documentation/delete", this.selectedDoc.id)
        .then(this.$emit("refreshTool"));
      this.warningModal = false;
    },

    modalOpen(app) {
      this.selectedDoc = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    }
  },
  created() {
    //this.$store.dispatch("documentation/findAll");
    //this.$store.dispatch("tools/findAll");
    this.$store.dispatch("documentationType/findAll");
  }
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
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* this adds the "card" effect */
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
