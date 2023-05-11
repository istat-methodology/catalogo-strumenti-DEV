<template>
  <div>
    <div v-if="stateform == FormState.LIST">
      <div class="">
        <div class="row">
          <div class="col-12 p-0">
            <CTitle
              title="Documenti"
              buttonTitle=" associazione documento"
              functionality=""
              :authenticated="isAuthenticated"
              :buttons="['salva', 'indietro']"
              @handleSubmit="handleAddSubmit"
              @handleBack="handleBack"
            />
          </div>
        </div>
        <CCard class="col-12 mr-4">
          <div class="row">
            <CCardBody class="col-8">
              <div v-if="this.documentations">
                <table class="table no-border">
                  <thead>
                    <tr>
                      <th>Nome</th>
                      <th>Tipo documento</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody class="col-6">
                    <tr
                      class="list-group-item-action"
                      v-for="documentation of documentations"
                      :key="documentation.id"
                    >
                      <td class="no-border">{{ documentation.name }}</td>
                      <td class="no-border">
                        {{ documentation.documentType }}
                      </td>
                      <td class="float-right no-border">
                        <span class="btn btn-rounded" href="#" role="button">
                          <router-link
                            tag="a"
                            :to="{
                              name: 'DocumentationDetails',
                              params: { id: documentation.id }
                            }"
                            title="Visualizza dettagli documento"
                          >
                            <view-icon title="Visualizza dettagli documento" />
                          </router-link>
                        </span>
                        <span
                          class="btn btn-rounded"
                          href="#"
                          role="button"
                          title="Cancella documento dallo strumento"
                          @click="modalOpen(documentation)"
                        >
                          <delete-icon
                            title="Cancella documento dallo strumento"
                          />
                        </span>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div v-if="this.documentations.length == 0">
                <table>
                  <tr>
                    <td class="list-group-item-action no-border">
                      Nessun documento inserito
                    </td>
                  </tr>
                </table>
              </div>
            </CCardBody>
            <CCardBody class="col-4">
              <table class="table no-border">
                <thead>
                  <tr>
                    <th>Elenco dei documenti disponibili da associare</th>
                  </tr>
                </thead>
                <tr>
                  <td class="no-border">
                    <div v-if="documentationList">
                      <v-select
                        :options="getAllDocumentations"
                        label="name"
                        placeholder="Elenco documenti"
                        @input="selectId($event)"
                      />
                    </div>
                  </td>
                </tr>
                <tr>
                  <td class="no-border">
                    <span
                      class="btn btn-rounded float-right"
                      @click="stateform = FormState.NEW"
                      title="Crea nuovo documento"
                    >
                      <add-icon title="Crea nuovo documento" />Nuovo
                      documento</span
                    >
                  </td>
                </tr>
              </table>
            </CCardBody>
          </div>
        </CCard>
      </div>
      <CModal
        title="Warning!"
        :show.sync="warningModal"
        @close="
          () => {
            this.$emit('updateParent');
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
            color="info"
            @click="handleRemoveSubmit"
          >
            Delete
          </CButton>
        </template>
        Elimina Documento '{{ selectedDoc.name }}'?
      </CModal>
    </div>
    <div v-if="stateform == FormState.NEW" class="col-12 p-0">
      <div class="col-12 p-0">
        <CTitle
          title="Aggiungi nuovo documento"
          buttonTitle=" nuovo documento"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleNewSubmit"
          @handleBack="stateform = FormState.LIST"
        />
      </div>
      <CCard class="col-12 p-0">
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
            <label>Tipo Documento*</label>
          </div>
          <v-select
            label="name"
            :options="documentationTypeList"
            placeholder="Tipo documento"
            v-model="documentationLocal.documentType"
            :class="{
              'is-invalid': $v.documentationLocal.documentType.$error
            }"
          ></v-select>
          <div
            class="help-block"
            :class="{ show: $v.documentationLocal.documentType.$error }"
          >
            Campo obbligatorio
          </div>
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
import { required } from "vuelidate/lib/validators";
import { mapGetters } from "vuex";
//import AgentAdd from "../../agent/AgentAdd.vue";
import CTitle from "@/components/CTitle.vue";
export default {
  components: {
    /*AgentAdd*/
    CTitle
  },
  name: "CDocumentationEditView",
  data() {
    return {
      selectedDoc: {},
      selectedDocId: null,
      warningModal: false,
      FormState: {
        LIST: 0,
        ADD: 1,
        NEW: 2
      },
      stateform: 0,
      documentationLocal: {
        name: "",
        publisher: "",
        documentType: "",
        resource: "",
        tool: this.toolId,
        method: this.methodId
      }
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("documentationType", ["documentationTypeList"]),
    ...mapGetters("documentation", ["documentationList"]),
    getAllDocumentations() {
      if (this.documentationList) {
        return this.documentationList.map(item => {
          return {
            id: item.id,
            name:
              (item.name == null ? "" : item.name) +
              " - " +
              (item.documentType.name == null ? "" : item.documentType.name)
          };
        });
      } else {
        return [];
      }
    }
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
  emits: ["updateParent"],

  props: {
    documentations: {
      type: Array,
      required: true,
      default: () => []
    },
    toolId: {
      type: Number,
      required: false,
      default: null
    },
    methodId: {
      type: Number,
      required: false,
      default: null
    },
    parentName: {
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
    selectId(e) {
      this.selectedDocId = e.id;
    },
    handleAddSubmit() {
      //this.$v.$touch();
      //if (!this.$v.documentationLocal.$invalid) {
      console.log(this.selectedDocId);
      let params = { id: 0, docID: 0 };

      if (this.selectedDocId) {
        if (this.toolId) {
          params.id = this.toolId;
          params.docID = this.selectedDocId;
          this.$store
            .dispatch("tools/addDocumentation", params)
            .then(this.$emit("updateParent"));
          this.stateform = this.FormState.LIST;
        }

        if (this.methodId) {
          params.id = this.methodId;
          params.docID = this.selectedDocId;
          this.$store
            .dispatch("methods/addDocumentation", params)
            .then(this.$emit("updateParent"));
          this.stateform = this.FormState.LIST;
        }
      }
      //}
    },
    handleNewSubmit() {
      this.$v.$touch();
      if (!this.$v.documentationLocal.$invalid) {
        this.documentationLocal.tool = this.toolId;
        this.documentationLocal.method = this.methodId;
        this.documentationLocal.documentType = this.documentationLocal.documentType.id;

        this.$store
          .dispatch("documentation/save", this.documentationLocal)
          .then(this.$emit("updateParent"));
        this.stateform = this.FormState.LIST;
        //this.viewNewDocument = false;
      }
    },

    handleBack() {
      this.$router.back();
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
            .dispatch("tools/removeDocumentation", params)
            .then(this.$emit("updateParent"));
        }
        if (this.methodId) {
          params.id = this.methodId;
          params.docID = this.selectedDoc.id;
          this.$store
            .dispatch("methods/removeDocumentation", params)
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
    }
  },
  created() {
    this.$store.dispatch("documentation/findAll");
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
