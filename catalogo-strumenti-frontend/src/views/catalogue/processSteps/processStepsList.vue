<template>
  <div>
    <div v-if="stateform == FormState.LIST">
      <CTitle
        title="Passi"
        buttonTitle=" Passo"
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
              title="...processo collegato alle Business Functions"
              :items="item.businessFunctions"
              :activeIndex="activeIndex"
              :index="index"
            />
          </template-->
          </CDataTable>
        </CCardBody>
      </CCard>
    </div>
    <!-- 
        Modifica Passo del Processo
      -->
    <div v-if="stateform == FormState.STEP_EDIT">
      <div v-if="selectedEditStep">
        <CBusinessProcessStepEdit
          :bDesignType="designtypeList"
          :bPStep="selectedEditStep"
          @enableEditStep="showEditStep"
          @enableBack="stateform = FormState.EDIT"
        />
      </div>
    </div>
    <!-- 
        Nuovo Passo del Processo
      -->
    <div v-if="stateform == FormState.STEP_NEW">
      <!--div v-if="selectedEditProcess"-->
      <CBusinessProcessStepNew
        :bDesignType="designtypeList"
        :bPStep="selectedEditStep"
        @enableNewStep="showNewStep"
        @enableBack="stateform = FormState.EDIT"
      />
      <!--/div-->
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
// const [items, setItems] = useState(usersData)
import { mapGetters } from "vuex";
import { Context } from "@/common";
import CTitle from "@/components/CTitle.vue";
import CModalDelete from "@/components/CModalDelete.vue";
import CTableLink from "@/components/CTableLink.vue";

import CBusinessProcessStepEdit from "@/components/businessProcess/CBusinessProcessStepEdit";
import CBusinessProcessStepNew from "@/components/businessProcess/CBusinessProcessStepNew";

//import CTableDetails from "@/components/CTableDetails.vue";
export default {
  name: "ProcessStepsList",
  //components: { CTableDetails },
  components: {
    CTitle,
    CModalDelete,
    CTableLink,
    CBusinessProcessStepEdit,
    CBusinessProcessStepNew,
  },
  data() {
    return {
      fields: [
        {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;",
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
      states: [],
      FormState: {
        LIST: 0,
        STEP_EDIT: 4,
        STEP_NEW: 5,
      },
      stateform: 0,
    };
  },
  computed: {
    ...mapGetters("procSteps", ["procStepsList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
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
      //this.$router.push({ name: "ProcessStepsAdd" });
      this.selectedEditStep = {};
      this.stateform = this.FormState.STEP_NEW;

      
    },
    handleBack() {
      this.$router.push({ name: "Catalogue" });
    },
    
    handleView(item) {
      //router.push({ name: 'user', params: { username } })
      this.$router.push({
        name: "ProcessStepsDetails",
        params: { id: item.id },
      });
    },


    
    
    


    handleEdit(step) {
      this.selectedEditStep = step;
      this.stateform = this.FormState.STEP_EDIT;

      //router.push({ name: 'user', params: { username } })
      /*
      this.$router.push({
        name: "ProcessStepsEdit",
        params: { id: item.id },
      });
      */
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
        "Sei sicuro di eliminare il processo " +
        this.selectedProcessStep.name +
        " selezionato?"
      );
    },
  },
  created() {
    this.$store
      .dispatch("coreui/setContext", Context.BusinessProcessSession)
      .catch(() => {});
    // if (this.params) {

    this.$store.dispatch("procSteps/findAll");
    // }
  },
};
</script>
