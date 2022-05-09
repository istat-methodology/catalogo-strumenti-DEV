<template>
  <div>
    <div>
      <div class="row">
        <h3>Implementazioni e funzionalità</h3>
<div class="card-header" v-if="stateform == FormState.LIST">
          Lista
          <div class="card-header-actions">
        <span  class="icon-link float-right" @click="stateform = FormState.NEW"
          title="Aggiungi una nuova implementazione">
          <plus-icon />
        </span>
          </div></div>  


<div class="card-header" v-if="stateform == FormState.NEW">
          Nuova implementazione
          <div class="card-header-actions">
            <span>
              <span title="Salva" class="icon-link col-1" @click.prevent="handleNewAppService">
                <success-icon />
              </span>&nbsp;

              <span class="icon-link col-1" @click="closeNew()">
                <close-circle-icon />
              </span>
            </span>
          </div>
        </div>
          <div class="card-header" v-if="stateform == FormState.EDIT">
        <div class="card-header-actions" >
          Modifica
          <span class="icon-link col-1" @click.prevent="handleSubmitAdd(selectedUpdateAppService)">
            <success-icon />
          </span>&nbsp;
          <span class="icon-link col-1" @click="modalOpen(selectedUpdateAppService)">
            <delete-icon />
          </span>
          &nbsp;
          <span class="icon-link col-1" @click="closeEdit()">
            <close-circle-icon />
          </span>
        </div>
</div>



      </div>

      <div v-if="stateform == FormState.LIST">
    

        <div class="columns">
          <div class="row">
            <div v-if="this.businessService.appServices === 0">
              <span>Nessuna implementazione definita</span>
            </div>

            <div class="card col-3" v-for="appService of this.businessService.appServices" :key="appService.id">
              <div class="card-header">
                <strong>{{ appService.name }}</strong>
                <div class="card-header-actions">
                  <span @click.prevent="handleSelectedEditAdd(appService)">
                    <edit-icon />
                  </span>
                </div>
              </div>
              <div class="card-body">
                <p class="card-text">{{ appService.descr }}</p>
                <p class="card-text"><strong>Linguaggio:</strong>{{ appService.implementationLanguage }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>


      <div v-if="stateform == FormState.NEW">
        <div class="card">
      
          <div class="card-body">

            
            <CInput class="col-6" label="Nome" placeholder="Nome" v-model="newAppService.name" />
            <CTextarea class="col-12" label="Descrizione" v-model="newAppService.descr"></CTextarea>
            <div class="row">
              <CInput class="col-6" label="Autore" placeholder="Autore" v-model="newAppService.author" />
              <CInput class="col-6" label="Contatto" placeholder="Contatto" v-model="newAppService.contact" />
            </div>
            <div class="row">
              <CInput class="col-4" label="Linguaggio" placeholder="Note"
                v-model="newAppService.implementationLanguage" />

              <CInput class="col-8" label="File Sorgente" placeholder="File Sorgente"
                v-model="newAppService.sourcePath" />
            </div>
            <CInput class="col-6" label="Licenza" placeholder="Licenza" v-model="newAppService.licence" />
          </div>
        </div>
      </div>

      <div v-if="stateform == FormState.EDIT">
     <div class="card">
      
          <div class="card-body">


          <div class="row">
            <CInput class="col-6" label="Nome" placeholder="Nome" v-model="selectedUpdateAppService.name" />


            <CTextarea class="col-12" label="Descrizione" v-model="selectedUpdateAppService.descr"></CTextarea>
            <div class="row">
              <CInput class="col-6" label="Autore" placeholder="Autore" v-model="selectedUpdateAppService.author" />
              <CInput class="col-6" label="Contatto" placeholder="Contatto"
                v-model="selectedUpdateAppService.contact" />
            </div>
            <div class="row">
              <CInput class="col-4" label="Linguaggio" placeholder="Note"
                v-model="selectedUpdateAppService.implementationLanguage" />

              <CInput class="col-8" label="File Sorgente" placeholder="File Sorgente"
                v-model="selectedUpdateAppService.sourcePath" />
            </div>
            <CInput class="col-6" label="Licenza" placeholder="Licenza" v-model="selectedUpdateAppService.licence" />
          </div>

        <fieldset>
          <legend>
            <h4>Funzionalità</h4>
          </legend>
          <app-functionality-table @reLoadData="loadBusinessService" :appService="selectedUpdateAppService.id"
            :statisticalMethodsList="statisticalMethodsList" :stepInstances="
              getStepInstancesList(selectedUpdateAppService.stepInstances)
            "></app-functionality-table>

        </fieldset>


      </div>

      </div>

      </div>



    </div>
    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton shape="square" size="sm" color="primary" @click="deleteAppService">
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


export default {
  name: "BusinessServiceEditView",
  components: {
    "app-functionality-table": FunctionalityTable
  },
  props: {
    businessServiceID: {
      type: Number,
      required: true,
      default: () => null
    }
  },
  computed: {
    ...mapGetters("businessService", {
      businessService: "businessService"
    }),
    ...mapGetters("methods", ["statisticalMethodsList"])
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
        NEW: 2
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
        businessService: 0
      },
      fields: [
        {
          key: "functionality",
          label: "Funzionalità"
        },
        {
          key: "method",
          label: "Metodo"
        },
        {
          key: "statMethodName",
          label: "Metodo Statistico"
        },
        {
          key: "descr",
          label: "Descrizione"
        }
      ]
    };
  },
  methods: {
    handleSelectedEditAdd(app) {
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
        return stepInstances.map(stepInstance => {
          return {
            id: stepInstance.id,
            functionality: stepInstance.functionality,
            method: stepInstance.method,
            descr: stepInstance.descr,
            statMethodName: stepInstance.statMethod.name,
            statMethodId: stepInstance.statMethod.id
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

    loadBusinessService: _.debounce(function () {
      if (this.businessServiceID) {
        this.$store.dispatch(
          "businessService/findById",
          this.businessServiceID
        );
      }
    }, 500)
  },
  created() {
    this.loadBusinessService();
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

  text-align: left;
  background-color: #f1f1f1;
  margin-left: 5px;
}

.descriprion-functionalities {
  padding-bottom: 20px;
  font-size: large;
  font-weight: bold;
  color: #9d9d9d;
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
