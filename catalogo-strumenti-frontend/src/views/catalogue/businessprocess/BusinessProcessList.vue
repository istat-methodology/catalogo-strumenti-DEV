<!--template>
  <div>
    <CTitle
      title="Processi"
      buttonTitle=" Processo"
      functionality="Elenco"
      :authenticated="isAuthenticated"
      :buttons="['aggiungi', 'indietro']"
      @handleNew="handleNew"
      @handleBack="handleBack"
    />
    <CCard>
      <CCardBody>
        <CDataTable
          v-if="bProcessList"
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
</template>
<script>
// const [items, setItems] = useState(usersData)
import { mapGetters } from "vuex";
import { Context } from "@/common";
import CTitle from "@/components/CTitle.vue";
import CModalDelete from "@/components/CModalDelete.vue";
import CTableLink from "@/components/CTableLink.vue";
import CTableDetails from "@/components/CTableDetails.vue";
export default {
  name: "BusinessProcessList",
  components: { CTitle, CModalDelete, CTableLink, CTableDetails },
  data() {
    return {
      fields: [
        {
          key: "id",
          label: "ID",
          _style: "width:4%;"
        },
        {
          key: "name",
          label: "Nome",
          _style: "width:30%;"
        },
        {
          key: "label",
          label: "Etichetta",
          _style: "width:10%;"
        },
        {
          key: "descr",
          label: "Descrizione",
          _style: "width:30%;"
        },
        {
          key: "orderCode",
          label: "Order",
          _style: "width:10%;"
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ],
      details: [],
      setDetails: [],
      selectedBusiness: {},
      showModal: false,
      showDetails: true,
      activeIndex: -1
    };
  },
  computed: {
    ...mapGetters("bProcess", ["bProcessList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("filter", ["params"]),
    computedItems: function() {
      if (this.bProcessList) {
        return this.bProcessList.map(item => {
          return Object.assign({}, item, {
            id: item.id,
            name: item.name == null ? "" : item.name,
            descr: item.descr == null ? "" : item.descr,
            label: item.label == null ? "" : item.label,
            order: item.orderCode == null ? "" : item.orderCode,
            businessFunctions:
              item.businessFunctions == null ? "" : item.businessFunctions
          });
        });
      } else {
        return [];
      }
    }
  },
  methods: {
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
        .dispatch("bProcess/delete", this.selectedBusiness.id)
        .catch(() => {});
      this.showModal = false;
    },
    handleNew() {
      this.$router.push({ name: "BusinessProcessAdd" });
    },
    handleBack() {
      this.$router.push({ name: "Catalogue" });
    },
    handleView(item) {
      //router.push({ name: 'user', params: { username } })
      this.$router.push({
        name: "BusinessProcessDetails",
        params: { id: item.id }
      });
    },
    handleEdit(item) {
      //router.push({ name: 'user', params: { username } })
      this.$router.push({
        name: "BusinessProcessEdit",
        params: { id: item.id }
      });
    },
    handleOpenModalDelete(app) {
      this.selectedBusiness = app;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il processo " +
        this.selectedBusiness.name +
        " selezionato?"
      );
    }
  },
  created() {
    this.$store
    .dispatch("coreui/setContext", Context.BusinessProcessSession)    
    this.$store.dispatch("bProcess/filter", this.params).catch(() => {});
    
  }
};
</script-->

<template>
  <div class="row p-0">
    <div class="col-10 p-0 ml-0">
      <!--       
        Elenco Processi      
      -->
      <div v-if="stateform == FormState.LIST">
        <div class="row p-0">
          <div class="col-12 p-0">
            <CTitle
              title="Processi"
              buttonTitle=" Processo"
              functionality=""
              :authenticated="isAuthenticated"
              :buttons="['aggiungi', 'indietro']"
              @handleNew="stateform = FormState.NEW"
              @handleBack="handleBack"
            />
            <CCard>
              <CCardBody>
                <CDataTable
                  v-if="bProcessList"
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
                v-model="bProcessLocal.name"
              />
              <CInput
                class="col-4"
                label="Etichetta"
                placeholder="Etichetta"
                v-model="bProcessLocal.label"
              />
              <CInput
                class="col-2"
                label="Ordine"
                type="number"
                placeholder="Ordine"
                v-model="bProcessLocal.orderCode"
              />
            </div>
            <div class="row mt-4">
              <CTextarea
                class="col-12"
                label="Descrizione"
                placeholder="Descrizione"
                v-model="bProcessLocal.descr"
              />
            </div>
          </CCardBody>
        </CCard>
      </div>

      <div v-if="stateform == FormState.VIEW">
        <CTitle
          :title="selectedBProcess.name"
          :buttonTitle="selectedBProcess.name"
          functionality="DETTAGLIO"
          :authenticated="isAuthenticated"
          :buttons="['indietro']"
          @handleBack="handleBack"
        />
        <CBusinessProcessView          
          :bProcess="selectedEditProcess"
          @enableEditStep="showEditStep"
          @enableNewStep="showNewStep"
        />
      </div>

      <!-- 
        Modifica Processo
      -->
      <div v-if="stateform == FormState.EDIT">
        <CTitle
          :title="selectedEditProcess.name"
          :buttonTitle="selectedEditProcess.name"
          functionality=""
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="stateform = FormState.LIST"
        />
        <CBusinessProcessEdit
          :bProcess="selectedEditProcess"
          @enableEditStep="showEditStep"
          @enableNewStep="showNewStep"
        />
      </div>
      <!-- 
        Modifica Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_EDIT">
        <CBusinessProcessStepEdit
          :bDesignType="designtypeList"
          :bPStep="selectedEditStep"
          @enableEditStep="showEditStep"
          @enableBack="stateform = FormState.EDIT"
        />
      </div>
      <!-- 
        Nuovo Passo del Processo
      -->
      <div v-if="stateform == FormState.STEP_NEW">
        <CBusinessProcessStepNew
          :bDesignType="designtypeList"
          :bPStep="selectedEditStep"
          @enableNewStep="showNewStep"
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

import CTitle from "@/components/CTitle.vue";
import CModalDelete from "@/components/CModalDelete.vue";
import CTableLink from "@/components/CTableLink.vue";
import CTableDetails from "@/components/CTableDetails.vue";

export default {
  name: "CBusinessProcessList",
  components: {
    CBusinessProcessView,
    CBusinessProcessEdit,
    CBusinessProcessStepEdit,
    CBusinessProcessStepNew,
    CTitle,
    CModalDelete,
    CTableLink,
    CTableDetails,
  },
  data() {
    return {
      selectedBProcess: {},
      selectedBProcessId: null,
      selectedEditProcess: null,
      selectedEditStep: null,
      selectedEditProcessDesign: null,
      states: [],
      FormState: {
        LIST: 0,
        EDIT: 1,
        NEW: 2,
        VIEW: 3,
        STEP_EDIT: 4,
        STEP_NEW: 5,
      },
      stateform: 0,
      warningModal: false,
      bProcessLocal: {
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
      selectedBusiness: {},
      showDetails: true,
      activeIndex: -1,
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcessList"]),
    ...mapGetters("filter", ["params"]),
    ...mapGetters("designtypes", ["designtypeList"]),

    computedItems: function () {
      if (this.bProcessList) {
        return this.bProcessList.map((item) => {
          return Object.assign({}, item, {
            id: item.id,
            name: item.name == null ? "" : item.name,
            descr: item.descr == null ? "" : item.descr,
            label: item.label == null ? "" : item.label,
            order: item.orderCode == null ? "" : item.orderCode,
            businessFunctions:
              item.businessFunctions == null ? "" : item.businessFunctions,
          });
        });
      } else {
        return [];
      }
    },
  },

  emits: ["refreshBProcess"],

  props: {
    bFunctionId: {
      type: Number,
      required: true,
      default: null,
    },
    bFunctionName: {
      type: String,
      required: true,
      default: null,
    },
    bProcesses: {
      type: Array,
      required: true,
      default: () => {},
    },
  },
  methods: {
    changeBProcess(value) {
      this.bProcessLocal.processStep = value.id;
      alert(this.bProcessLocal.processStep);
    },
    handleSubmit() {
      this.bProcessLocal.businessFunction = this.bFunctionId;
      if (this.stateform == this.FormState.NEW) {
        this.$store
          .dispatch("bProcess/save", this.bProcessLocal)
          .then(this.$emit("refreshBProcess", this.bFunctionId));
      }
      if (this.stateform == this.FormState.EDIT) {
        this.bProcessLocal = this.selectedEditProcess;
        this.$store
          .dispatch("bProcess/update", this.bProcessLocal)
          .then(this.$emit("refreshBProcess", this.bFunctionId));
      }
      this.stateform = this.FormState.LIST;
    },
    selectId(e) {
      this.bProcessLocal.id = e.id;
      this.bProcessLocal.name = e.name;
      this.bProcessLocal.descr = e.descr;
      this.bProcessLocal.label = e.label;
      this.bProcessLocal.orderCode = e.orderCode;
    },
    showEditStep(step) {
      this.selectedEditStep = step;
      this.stateform = this.FormState.STEP_EDIT;
    },
    showNewStep() {
      this.selectedEditStep = {};
      this.stateform = this.FormState.STEP_NEW;
    },
    handleEdit(process) {
      this.selectedEditProcess = process;
      this.stateform = this.FormState.EDIT;
    },
    handleView(process) {
      this.selectedEditProcess = process;
      this.stateform = this.FormState.VIEW;
    },
    handleBack() {
      //this.$router.back();
      this.$router.push({ name: "Catalogue" });
    },
    handleOpenModalDelete(app) {
      this.selectedBusiness = app;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il processo " +
        this.selectedBusiness.name +
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
        .dispatch("bProcess/delete", this.selectedBusiness.id)
        .catch(() => {});
      this.showModal = false;
    },
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.BusinessProcessSession);
    //this.$store.dispatch("bProcess/filter", this.params).catch(() => {});

    this.$store.dispatch("bProcess/findAll");
    this.$store.dispatch("designtypes/findAll");
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

