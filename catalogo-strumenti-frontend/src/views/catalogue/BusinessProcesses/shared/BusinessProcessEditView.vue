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
              v-model="bProcessLocal.name"
            />
            <CInput
              label="Descrizione"
              placeholder="Descrizione"
              v-model="bProcessLocal.descr"
            />
            <CInput
              label="Etichetta"
              placeholder="Etichetta"
              v-model="bProcessLocal.label"
            />
            <CInput
              label="Codice Ordine"
              placeholder="Codice Ordine"
              v-model="bProcessLocal.orderCode"
            />
            <CInput
              label="Genitore"
              placeholder="Genitore"
              v-model="bProcessLocal.parent"
            />
            <div>
              <label>Passi di Processo</label>
            </div>
            <v-select
              label="Process Step"
              :options="procStepList"
              placeholder="Process Step"
              v-model="bProcessLocal.processStep"
            ></v-select>
          </CCardBody>
        </CCard>
      </div>

      <!-- <div v-if="documentations.length === 0">
        <span>Nessuna documentazione associata</span>
      </div> -->
    </div>
    <div class="row">
      <div class="card col-3" v-for="bProcess of bProcesses" :key="bProcess.id">
        <div class="card-header">
          <strong>{{ bProcess.name }}</strong>
          <div class="card-header-actions">
            <router-link
              tag="a"
              :to="{
                name: 'BProcessDetails',
                params: { id: bProcess.id }
              }"
            >
              <view-icon />
            </router-link>
            <span class="icon-link" @click="modalOpen(bProcess)"
              ><delete-icon />
            </span>
          </div>
        </div>
        <!-- <div class="card-body">
          <p class="card-text">{{ bFuntion.documentType }}</p>
        </div> -->
      </div>
    </div>
    <CModal
      title="Warning!"
      :show.sync="warningModal"
      @close="
        () => {
          this.$emit('refreshBProcess');
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
          @click="deleteBProcess"
        >
          Delete
        </CButton>
      </template>
      Elimina Business Process '{{ selectedBProcess.name }}'?
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
        descr: "",
        label: "",
        orderCode: "",
        parent: "",
        processStep: ""
      }
    };
  },
  computed: {
    ...mapGetters("procStep", ["procStepList"])
  },
  emits: ["refreshBProcess"],

  props: {
    bProcesses: {
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
    changeBProcess(value) {
      this.bProcessLocal.processStep = value.id;
    },
    handleSubmit() {
      console.log(this.bProcessLocal);
      this.$store
        .dispatch("procStep/save", this.bProcessLocal)
        .then(this.$emit("refreshTool"));
      this.viewNewBProcess = false;
    },
    goBack() {
      this.$router.push("/catalogue/businessFunctions");
    },
    deleteDocumentation() {
      this.$store
        .dispatch("procStep/delete", this.selectedBProcess.id)
        .then(this.$emit("refreshTool"));
      this.warningModal = false;
    },

    modalOpen(app) {
      this.selectedBProcess = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    }
  },
  created() {
    //this.$store.dispatch("documentation/findAll");
    //this.$store.dispatch("tools/findAll");
    this.$store.dispatch("procStep/findAll");
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
