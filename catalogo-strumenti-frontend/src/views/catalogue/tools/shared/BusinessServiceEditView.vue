<template>
  <div>
    <div>
      <div v-if="stateform == FormState.LIST">
        <div class="col-12 p-0">
          <CTitle
            title="Moduli Implementati"
            buttonTitle=" Moduli Implementati"
            functionality=""
            :authenticated="isAuthenticated"
            :buttons="['aggiungi', 'indietro']"
            @handleNew="stateform = FormState.NEW"
            @handleBack="handleBack"
          />
        </div>

        <CCard class="col-12">
          <CCardHeader class="no-border">Elenco moduli implementati</CCardHeader>
          <CCardBody>
            <div v-if="this.businessService">
              <table class="table no-border">
                <thead>
                  <tr>
                    <th>Nome</th>
                    <th>Descrizione</th>
                    <th>Linguaggio</th>
                    <th>Funzionalità</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    class="list-group-item-action no-border"
                    v-for="appService of this.businessService.appServices"
                    :key="appService.id"
                  >
                    <td class="no-border">{{ appService.name }}</td>
                    <td class="no-border">{{ appService.descr }}</td>
                    <td class="no-border">
                      {{ appService.implementationLanguage }}
                    </td>
                    <td class="no-border">
                      {{ appService.stepInstances.length }}
                    </td>
                    <td class="float-right no-border">
                      <span
                        class="btn btn-rounded"
                        href="#"
                        role="button"
                        @click.prevent="handleSelectedEdit(appService)"
                        title="Modifica"
                        ><edit-icon title="Modifica" />
                      </span>
                      <span
                        class="btn btn-rounded"
                        href="#"
                        role="button"
                        v-if="appService.stepInstances.length == 0"
                        @click.prevent="modalOpen(appService)"
                        title="Cancella"
                      >
                        <delete-icon title="Cancella" />
                      </span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div v-if="this.businessService.appServices.length == 0">
              <table>
                <tr>
                  <td class="list-group-item no-border">
                    Nessun modulo implementato
                  </td>
                </tr>
              </table>
            </div>
          </CCardBody>
        </CCard>
      </div>

      <div v-if="stateform == FormState.NEW">
        <div class="col-12 p-0">
          <CTitle
            title="Nuovo Modulo Implementato"
            buttonTitle=" Nuova Modulo Implementato"
            functionality=""
            :authenticated="isAuthenticated"
            :buttons="['salva', 'indietro']"
            @handleSubmit="handleNewAppService"
            @handleBack="closeNew"
          />
        </div>
        <CCard class="col-12">
          <CCardBody>
            <div class="row">
              <CInput
                class="col-6"
                label="Nome"
                placeholder="Nome"
                v-model="newAppService.name"
                required
              />
              <CInput
                class="col-6"
                label="Linguaggio"
                placeholder="Linguaggi"
                v-model="newAppService.implementationLanguage"
              />
            </div>
            <div class="row">
              <CTextarea
                class="col-12"
                label="Descrizione"
                v-model="newAppService.descr"
              ></CTextarea>
            </div>
            <div class="row">
              <CInput
                class="col-6"
                label="Autore"
                placeholder="Autore"
                v-model="newAppService.author"
              />
              <CInput
                class="col-6"
                label="Contatto"
                placeholder="Contatto"
                v-model="newAppService.contact"
              />
            </div>
            <div class="row">
              <CInput
                class="col-6"
                label="File Sorgente"
                placeholder="File Sorgente"
                v-model="newAppService.sourcePath"
              />
              <CInput
                class="col-6"
                label="Licenza"
                placeholder="Licenza"
                v-model="newAppService.licence"
              />
            </div>
          </CCardBody>
        </CCard>
      </div>

      <div v-if="stateform == FormState.EDIT && selectedUpdateAppService">
        <div class="col-12 p-0">
          <CTitle
            title=" Moduli Implementati"
            buttonTitle="  Moduli Implementati"
            functionality=""
            :authenticated="isAuthenticated"
            :buttons="['salva', 'indietro']"
            @handleSubmit="handleUpdateAppService"
            @handleBack="closeEdit"
          />
        </div>
        <CCard class="col-12">
          <CCardBody>
            <div class="row">
              <CInput
                class="col-6"
                label="Nome"
                placeholder="Nome"
                v-model="selectedUpdateAppService.name"
              />

              <CInput
                class="col-6"
                label="Linguaggio"
                placeholder="Note"
                v-model="selectedUpdateAppService.implementationLanguage"
              />
            </div>
            <div class="row">
              <CTextarea
                class="col-12"
                label="Descrizione"
                v-model="selectedUpdateAppService.descr"
              ></CTextarea>
            </div>
            <div class="row">
              <CInput
                class="col-6"
                label="Autore"
                placeholder="Autore"
                v-model="selectedUpdateAppService.author"
              />
              <CInput
                class="col-6"
                label="Contatto"
                placeholder="Contatto"
                v-model="selectedUpdateAppService.contact"
              />
            </div>
            <div class="row">
              <CInput
                class="col-6"
                label="File Sorgente"
                placeholder="File Sorgente"
                v-model="selectedUpdateAppService.sourcePath"
              />
              <CInput
                class="col-6"
                label="Licenza"
                placeholder="Licenza"
                v-model="selectedUpdateAppService.licence"
              />
            </div>
          </CCardBody>
        </CCard>
        <app-functionality-table
          v-if="businessService"
          @reLoadData="reLoadBusinessService"
          :appService="selectedUpdateAppService.id"
          :statisticalMethodsList="statisticalMethodsList"
          :stepInstances="
            getStepInstancesList(selectedUpdateAppService.stepInstances)
          "
        ></app-functionality-table>
      </div>
    </div>
    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton
          shape="square"
          size="sm"
          color="info"
          @click="deleteAppService"
        >
          Delete
        </CButton>
      </template>
      Elimina implementazione '{{ selectedAppService.name }}'?
    </CModal>
  </div>
  <!--/div>
  </div-->
</template>
<script>
import FunctionalityTable from "./FunctionalityTable.vue";
import { mapGetters } from "vuex";
import _ from "lodash";
import CTitle from "@/components/CTitle.vue";

export default {
  name: "BusinessServiceEditView",
  components: {
    "app-functionality-table": FunctionalityTable,
    CTitle,
  },
  props: {
    businessServiceID: {
      type: Number,
      required: true,
      default: () => null,
    },
    toolName: {
      type: String,
      required: true,
      default: () => null,
    },
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("businessService", {
      businessService: "businessService",
    }),
    ...mapGetters("methods", ["statisticalMethodsList"]),
  },
  data() {
    return {
      disabled: false,
      selectedAppService: {},
      selectedUpdateAppService: {},
      warningModal: false,
      FormState: {
        LIST: 0,
        EDIT: 1,
        NEW: 2,
      },
      stateform: 0,
      newAppService: {
        name: "",
        descr: "",
        author: "",
        contact: "",
        implementationLanguage: "",
        sourcePath: "",
        licence: "",
        businessService: 0,
      },
      fields: [
        {
          key: "functionality",
          label: "Funzionalità",
        },
        {
          key: "method",
          label: "Metodo",
        },
        {
          key: "statMethodName",
          label: "Metodo Statistico",
        },
        {
          key: "descr",
          label: "Descrizione",
        },
      ],
    };
  },
  methods: {
    handleBack() {
      this.$router.push({ name: "ToolList" });
    },
    handleSelectedEdit(app) {
      this.selectedUpdateAppService = app;
      this.stateform = this.FormState.EDIT;
    },
    closeEdit() {
      this.stateform = this.FormState.LIST;
    },
    closeNew() {
      this.stateform = this.FormState.LIST;
    },

    deleteAppService() {
      this.$store
        .dispatch("appservice/delete", this.selectedAppService.id)
        .then(this.loadBusinessService());
      this.warningModal = false;
    },
    modalOpen(appservice) {
      this.selectedAppService = appservice;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    },
    getStepInstancesList: function (stepInstances) {
      if (stepInstances)
        return stepInstances.map((stepInstance) => {
          return {
            id: stepInstance.id,
            functionality: stepInstance.functionality,
            method: stepInstance.method,
            descr: stepInstance.descr,
            statMethod: {
              id: stepInstance.statMethod.id,
              name: stepInstance.statMethod.name,
            },
          };
        });
      else return [];
    },

    handleNewAppService: function () {
      this.newAppService.businessService = this.businessServiceID;
      this.$store
        .dispatch("appservice/save", this.newAppService)
        .then(this.loadBusinessService());

      this.stateform = this.FormState.LIST;
    },
    handleUpdateAppService: function () {
      this.businessService = null;
      this.selectedUpdateAppService.businessService = this.businessServiceID;
      this.$store
        .dispatch("appservice/update", this.selectedUpdateAppService)
        .then(this.reLoadBusinessService(this.selectedUpdateAppService.id));
    },
    reLoadBusinessService: _.debounce(function (idAppService) {
      this.selectedUpdateAppService = null;
      if (this.businessServiceID) {
        this.$store
          .dispatch("businessService/findById", this.businessServiceID)
          .then(() => {
            this.selectedUpdateAppService =
              this.businessService.appServices.find(
                (x) => x.id === idAppService
              );
          });
      }
    }, 500),
    loadBusinessService: _.debounce(function () {
      if (this.businessServiceID) {
        this.$store.dispatch(
          "businessService/findById",
          this.businessServiceID
        );
      }
    }, 500),
  },
  created() {
    this.loadBusinessService();
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
