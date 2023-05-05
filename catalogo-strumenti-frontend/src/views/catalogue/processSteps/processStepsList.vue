<template>
  <div>
    <div v-if="stateform == FormState.STEP_LIST">
      <CTitle
        title="Passi"
        buttonTitle=" Passso"
        functionality="Elenco"
        :authenticated="isAuthenticated"
        :buttons="['aggiungi', 'indietro']"
        @handleNew="handleNew"
        @handleBack="handleBack"
      />
      <CCard>
        <CCardBody>
          <CDataTable
            v-if="procStepsList"
            :items="procStepsList"
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
            <!--template #details="{ item, index }">
            <CTableDetails
              title="...step collegato ai Business Process"
              :items="item.businessFunctions"
              :activeIndex="activeIndex"
              :index="index"
            />
          </template-->
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
    <div v-if="stateform == FormState.STEP_VIEW">
      <CBusinessProcessStepView
        :pDesignType="designtypeList"
        :pPStep="selectedProcessStep"
        @enableBack="enableBack"
      />
    </div>
  </div>
</template>
<script>
// const [items, setItems] = useState(usersData)
import { mapGetters } from "vuex";
import { Context } from "@/common";
import CBusinessProcessStepView from "@/components/businessProcess/CBusinessProcessStepView";
import CTitle from "@/components/CTitle.vue";
import CModalDelete from "@/components/CModalDelete.vue";
import CTableLink from "@/components/CTableLink.vue";

//import CTableDetails from "@/components/CTableDetails.vue";
export default {
  name: "ProcessStepsList",
  //components: { CTitle, CModalDelete, CTableLink, CTableDetails },
  components: {
    CBusinessProcessStepView,
    CTitle,
    CModalDelete,
    CTableLink,
  },
  data() {
    return {
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
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      details: [],
      setDetails: [],
      selectedProcessStep: {},
      showModal: false,
      showDetails: true,
      activeIndex: -1,


      FormState: {
        STEP_LIST: 4,
        STEP_EDIT: 5,
        STEP_NEW: 6,
        STEP_VIEW: 7,
      },
      stateform:4
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("procSteps", ["procStepsList"]),
    ...mapGetters("designtypes", ["designtypeList"])
  },
  methods: {
    isItem(item) {
      //return item.businessFunctions.length > 0 ? true : false;
      console.log(item);
      return false;
    },
    handleDetails(index) {
      this.activeIndex !== index
        ? (this.activeIndex = index)
        : (this.activeIndex = -1);
    },
    handleDelete() {
      this.$store
        .dispatch("procSteps/delete", this.selectedProcessStep.id)
        .catch(() => {});
      this.showModal = false;
    },
    handleNew() {
      this.$router.push({ name: "ProcessStepsAdd" });
    },
    enableBack(){
      this.stateform = this.FormState.STEP_LIST;
    },
    handleBack() {
      this.$router.push({ name: "Catalogue" });
    },
    handleView(processStep) {
      this.selectedProcessStep = processStep;
      this.stateform = this.FormState.STEP_VIEW;
    },
    handleEdit(item) {
      this.$router.push({
        name: "ProcessStepsEdit",
        params: { item: item },
      });
    },
    handleOpenModalDelete(app) {
      this.selectedProcessStep = app;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il passo " +
        this.selectedProcessStep.name +
        " selezionato?"
      );
    },
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.BusinessProcessSession);
    this.$store.dispatch("procSteps/findAll").catch(() => {});
    this.$store.dispatch("designtypes/findAll");
  },
};
</script>
