<template>
  <div>
    <div v-if="lProcess">
      <CTitle
        title="Passi"
        buttonTitle=" Passo"
        functionality=""
        :authenticated="isAuthenticated"
        :buttons="['aggiungi']"
        @handleNew="handleAdd"
      />
      <CCard>
        <CCardBody>
          <span v-if="bProcess.processSteps || lProcess.processSteps">
            <CDataTable
              :items="
                bProcess.processSteps == null
                  ? pProcess.processSteps
                  : bProcess.processSteps
              "
              :fields="fields"
              :items-per-page="10"
              hover
              pagination
              ><template #show_details="{ item }">
                <CTableLink
                  :authenticated="isAuthenticated"
                  @handleView="handleView(item)"
                  @handleEdit="handleEdit(item)"
                  @handleDelete="handleOpenModalDelete(item)"
                />
              </template>
            </CDataTable>
          </span>
          <span v-else>Non sono presenti passi</span>
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
</template>

<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
import CTableLink from "@/components/CTableLink.vue";
import CModalDelete from "@/components/CModalDelete.vue";

export default {
  name: "CBusinessProcessList",
  components: {
    CTitle,
    CTableLink,
    CModalDelete,
  },
  data() {
    return {
      fields: [
        {
          key: "id",
          label: "id",
          _style: "width:2%;",
        },
        {
          key: "name",
          label: "Nome",
          _style: "width:10%;",
        },
        {
          key: "label",
          label: "etichetta",
          _style: "width:10%;",
        },
        {
          key: "descr",
          label: "Descrizione",
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
      lProcess: {
        id: "",
        name: "",
        descr: "",
        label: "",
        orderCode: "",
        businessFunction: "",
      },
      selectedProcessStep: {},
      showModal: false,
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcess"]),
  },
  props: {
    pFunctionId: {
      type: Number,
      required: false,
      default: null,
    },
    pFunctionName: {
      type: String,
      required: false,
      default: null,
    },
    pProcess: {
      type: Object,
      required: true,
      default: () => {},
    },
  },
  methods: {
    handleEdit(step) {
      this.$emit("enableEditStep", step);
    },
    handleView(step) {
      this.$emit("enableViewStep", step);
    },
    handleAdd() {
      this.$emit("enableAddStep");
    },
    handleBack() {
      this.$emit("enableBack");
    },
    handleOpenModalDelete(app) {
      this.selectedProcessStep = app;
      this.showModal = true;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare dal processo " +
        this.pProcess.name +
        " id: " +
        this.pProcess.id +
        " il passo " +
        this.selectedProcessStep.name +
        " id: " +
        this.selectedProcessStep.id +
        " selezionato?"
      );
    },
    handleDelete() {
      let params = { idProcess: 0, idStep: 0 };
      params.idProcess = this.pProcess.id;
      params.idStep = this.selectedProcessStep.id;
      this.$store.dispatch("bProcess/removeStep", params);  
      this.loadProcess;
      this.showModal = false;
      
      
    },
    loadProcess(){
      this.$store.dispatch("bProcess/findById", this.pProcess.id);
    },
    closeModal() {
      this.showModal = false;
    },
  },
  created() {    
    this.$store.dispatch("bProcess/findById", this.pProcess.id).then(() => {      
    
    });
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
