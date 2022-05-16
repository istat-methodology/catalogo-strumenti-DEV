<template>
  <div>
    <div class="row">
      <span class="icon-link float-right" @click="$emit('refreshTool')"
        ><success-icon title="Aggiungi un nuovo Business Process"
      /></span>

      <div>
        <span v-if="!viewNewBProcess">Nuovo Processo</span>
        <span
          class="icon-link float-right"
          @click="viewNewBProcess = !viewNewBProcess"
          ><plus-icon
            title="Aggiungi un nuovo d un referente"
            v-if="!viewNewBProcess"/><undo-icon
            title="Annulla"
            v-if="viewNewBProcess"
        /></span>
      </div>

      <div v-if="viewNewBProcess" class="row">
        <CCard>
          <CCardHeader
            >Nuovo Processo
            <div class="card-header-actions">
              <span @click="handleSubmit()">
                <span class="icon-link"><success-icon /></span>
                <span class="icon-link"><delete-icon /></span>
              </span>
            </div>
          </CCardHeader>
          <CCardBody>
            <CInput
              label="Nome"
              placeholder="Nome"
              v-model="b.ProcessLocal.name"
            />
            <CInput
              label="Editore"
              placeholder="Editore"
              v-model="bProcessLocal.publisher"
            />
            <div>
              <label>Istanza o modulo</label>
            </div>
            <v-select
              label="Istanza o Modulo"
              :options="bProcessStepIstances"
              placeholder="Istanza o Modulo"
              v-model="bProcessLocal.bProcessStepIstance"
            ></v-select>
            <CInput
              label="Note"
              placeholder="Note"
              v-model="bProcessLocal.notes"
            />
            <CInput
              label="Fonti"
              placeholder="Fonti"
              v-model="bProcessLocal.resource"
            />
          </CCardBody>
        </CCard>
      </div>

      <!-- <div v-if="documentations.length === 0">
        <span>Nessuna documentazione associata</span>
      </div> -->
    </div>
    <div class="row">
      <div
        class="card col-3"
        v-for="bFunction of bFunctions"
        :key="bFunction.id"
      >
        <div class="card-header">
          <strong>{{ bFunction.name }}</strong>
          <div class="card-header-actions">
            <router-link
              tag="a"
              :to="{
                name: 'DocumentationDetails',
                params: { id: bFunction.id }
              }"
            >
              <view-icon />
            </router-link>
            <span class="icon-link" @click="modalOpen(bFunction)"
              ><delete-icon />
            </span>
          </div>
        </div>
        <div class="card-body">
          <p class="card-text">{{ bFuntion.documentType }}</p>
        </div>
      </div>
    </div>
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
      viewAddBProcess: true,
      viewNewBProcess: false,
      selectedBProcess: {},
      warningModal: false,
      bProcessLocal: {
        name: "",
        publisher: "",
        documentType: "",
        resource: "",
        tool: this.toolId
      }
    };
  },
  computed: {
    ...mapGetters("procStep", ["procStep"])
  },
  emits: ["refreshTool"],

  props: {
    bFunctions: {
      type: Array,
      required: true,
      default: () => []
    },
    proessId: {
      type: Number,
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
