<template>
  <div class="row p-0">
    <div class="col-10 p-0 ml-0">
      <!--       
        Elenco Processi      
      -->
      <div v-if="stateform == FormState.LIST">
        <div v-if="bProcessList" class="row p-0">
          <div class="col-12 p-0">
            <CTitle
              title="Processi"
              buttonTitle=" Processo"
              functionality="Elenco"
              :authenticated="isAuthenticated"
              :buttons="['aggiungi', 'indietro']"
              @handleNew="stateform = FormState.NEW"
              @handleBack="handleBack"
            />
            <CCard>
              <CCardBody>
                <CDataTable                  
                  :items="bProcessList"
                  :fields="fields"
                  column-filter
                  :items-per-page="10"
                  sorter
                  hover
                  pagination
                >
                  <template #show_details="{ item, index }">
                    <CTableLink
                      :authenticated="isAuthenticated"
                      :showDetails="showDetails"
                      :isItem="isItem(item)"
                      @handleView="handleView(item)"
                      @handleEdit="handleEdit(item)"
                      @handleDelete="handleOpenModalDelete(item)"
                      @handleDetails="handleDetails(index)"
                    />
                  </template>
                  <template #details="{ item, index }">
                    <CTableDetails
                      title="...processo collegato alle Business Functions"
                      :items="item.businessFunctions"
                      :activeIndex="activeIndex"
                      :index="index"
                    />
                  </template>
                </CDataTable>
              </CCardBody>
            </CCard>
            <CModalDelete
              :message="getMessage()"
              :showModal="showModal"
              @closeModal="closeModal"
              @handleDelete="handleDelete"
            />
          </div>
        </div>
      </div>
      <!-- 
        Crea nuovo Processo
      -->
      <div v-if="stateform == FormState.NEW">
        <CTitle
          title="Nuovo Processo"
          buttonTitle=" Nuovo Processo"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="stateform = FormState.LIST"
        />
        <CCard>
          <CCardBody>
            <div class="row">
              <CInput
                class="col-6"
                label="Nome*"
                placeholder="Nome"
                v-model="lProcess.name"
              />
              <CInput
                class="col-4"
                label="Etichetta"
                placeholder="Etichetta"
                v-model="lProcess.label"
              />
              <CInput
                class="col-2"
                label="Ordine"
                type="number"
                placeholder="Ordine"
                v-model="lProcess.orderCode"
              />
            </div>
            <div class="row mt-4">
              <CTextarea
                class="col-12"
                label="Descrizione"
                placeholder="Descrizione"
                v-model="lProcess.descr"
              />
            </div>
          </CCardBody>
        </CCard>
      </div>
      <div v-if="stateform == FormState.VIEW">
        <CTitle
          :title="selectedProcess.name"
          :buttonTitle="selectedProcess.name"
          functionality="DETTAGLIO"
          :authenticated="isAuthenticated"
          :buttons="['indietro']"
          @handleBack="handleBack"
        />
        <CBusinessProcessView
          :pProcess="selectedProcess"
          @enableShowStep="showViewStep"
        />
      </div>
      <!-- 
        Modifica Processo
      -->
      <div v-if="stateform == FormState.EDIT">
        <CTitle
          :title="selectedProcess.name"
          :buttonTitle="selectedProcess.name"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"          
          @handleBack="stateform = FormState.LIST"
        />
        <CBusinessProcessEdit
          :pProcess="selectedProcess"
          @enableEditStep="showEditStep"
          @enableNewStep="showNewStep"
        />
      </div>
      <!-- 
        Visualizza Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_VIEW">
        <CBusinessProcessStepView
          :pPStep="selectedProcessStep"
          :pDesignType="designtypeList"          
          @enableBack="stateform = FormState.VIEW"
        />
      </div>

      <!-- 
        Modifica Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_EDIT">
        <CBusinessProcessStepEdit
          :pPStep="selectedProcessStep"
          :pDesignType="designtypeList"
          @enableBack="stateform = FormState.EDIT"
        />
      </div>
      <!-- 
        Nuovo Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_NEW">
        <CBusinessProcessStepNew
          :pPStep="selectedProcessStep"
          :pDesignType="designtypeList"
          @enableBack="stateform = FormState.EDIT"
        />
      </div>
    </div>
    <CModalDelete
      :message="getMessage()"
      :showModal="showModal"
      @closeModal="closeModal"
      @handleDelete="handleDelete"
    />
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
import CBusinessProcessEdit from "@/components/businessProcess/CBusinessProcessEdit";
import CBusinessProcessView from "@/components/businessProcess/CBusinessProcessView";
import CBusinessProcessStepEdit from "@/components/businessProcess/CBusinessProcessStepEdit";
import CBusinessProcessStepNew from "@/components/businessProcess/CBusinessProcessStepNew";
import CBusinessProcessStepView from "@/components/businessProcess/CBusinessProcessStepView";

import CTitle from "@/components/CTitle.vue";
import CModalDelete from "@/components/CModalDelete.vue";
import CTableLink from "@/components/CTableLink.vue";
import CTableDetails from "@/components/CTableDetails.vue";
import _ from "lodash";

export default {
  name: "BusinessProcessList",
  components: {
    CBusinessProcessView,
    CBusinessProcessEdit,
    CBusinessProcessStepEdit,
    CBusinessProcessStepNew,
    CBusinessProcessStepView,
    CTitle,
    CModalDelete,
    CTableLink,
    CTableDetails,
  },
  data() {
    return {
      selectedProcessId: null,
      selectedProcess: {},
      selectedProcessStep: {},
      selectedProcessDesign: {},
      states: [],
      FormState: {
        LIST: 0,
        EDIT: 1,
        NEW: 2,
        VIEW: 3,
        STEP_EDIT: 4,
        STEP_NEW: 5,
        STEP_VIEW: 6,
      },
      stateform: 0,
      warningModal: false,
      lProcess: {
        id: "",
        name: "",
        descr: "",
        label: "",
        orderCode: "",
        businessFunction: "",
      },
      showModal: false,
      fields: [
        {
          key: "id",
          label: "ID",
          _style: "width:4%;",
        },
        {
          key: "name",
          label: "Nome",
          _style: "width:30%;",
        },
        {
          key: "label",
          label: "Etichetta",
          _style: "width:10%;",
        },
        {
          key: "descr",
          label: "Descrizione",
          _style: "width:30%;",
        },
        {
          key: "orderCode",
          label: "Order",
          _style: "width:10%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      details: [],
      setDetails: [],
      showDetails: true,
      activeIndex: -1,
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcess", "bProcessList"]),
    ...mapGetters("designtypes", ["designtypeList"]),
  },

  methods: {
    changeProcess(value) {
      this.lProcess.processStep = value.id;
      alert(this.lProcess.processStep);
    },
    handleSubmit() {
      if (this.stateform == this.FormState.NEW) {
        this.$store.dispatch("bProcess/save", this.lProcess).then(() => {
          this.loadProcess();
        });
      }
      if (this.stateform == this.FormState.EDIT) {
        this.lProcess = this.selectedProcess;
        this.$store.dispatch("bProcess/update", this.lProcess).then(() => {
          this.loadProcess();
        });
      }

      this.stateform = this.FormState.LIST;
    },
    selectId(e) {
      this.lProcess.id = e.id;
      this.lProcess.name = e.name;
      this.lProcess.descr = e.descr;
      this.lProcess.label = e.label;
      this.lProcess.orderCode = e.orderCode;
    },

    showViewStep(step) {
      this.selectedProcessStep = step;
      this.stateform = this.FormState.STEP_VIEW;
    },

    showEditStep(step) {
      this.selectedProcessStep = step;
      this.stateform = this.FormState.STEP_EDIT;
    },
    showNewStep() {
      this.selectedProcessStep = {};
      this.stateform = this.FormState.STEP_NEW;
    },
    handleEdit(process) {
      this.$store.dispatch("bProcess/findById", process.id);
      this.selectedProcess = this.bProcess;
      this.stateform = this.FormState.EDIT;
    },
    handleView(process) {
      this.$store.dispatch("bProcess/findById", process.id);
      this.selectedProcess = this.bProcess;
      this.stateform = this.FormState.VIEW;
    },
    handleBack() {
      this.$router.back();
      //this.$router.push({ name: "Catalogue" });
    },
    handleOpenModalDelete(app) {
      this.selectedProcess = app;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il processo " +
        this.selectedProcess.name +
        " selezionato?"
      );
    },
    isItem(item) {
      return item.businessFunctions.length > 0 ? true : false;
    },
    handleDetails(index) {
      this.activeIndex !== index
        ? (this.activeIndex = index)
        : (this.activeIndex = -1);
    },
    handleDelete() {
      this.$store
        .dispatch("bProcess/delete", this.selectedProcess.id)
        .then(() => {
          this.reloadProcess();
        });

      this.showModal = false;
    },
    loadProcess: _.debounce(function () {
      this.$store.dispatch("bProcess/findAll");
    }, 500),
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.BusinessProcessSession);
    this.$store.dispatch("designtypes/findAll");
    this.loadProcess();
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

