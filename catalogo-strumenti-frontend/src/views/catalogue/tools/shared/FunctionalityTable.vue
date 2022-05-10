<template>
  <div>
    <div class="row ">
      <h3> Funzionalità</h3>

      <span class="icon-link float-right" @click="showNewFunct = true" title="Aggiungi una nuova funzionalità">
        <plus-icon />
      </span>

    </div>

    <div class="row" v-if="showNewFunct || stepInstancesLocal.length > 0">
      <div class="col-1">

      </div>
      <div class="col-2">
        <span><strong>Nome</strong></span>
      </div>
      <div class="col-2">
        <span><strong>Metodo </strong></span>
      </div>
      <div class="col-3">
        <span><strong>Metodo statistico</strong></span>
      </div>
      <div class="col-3">
        <span><strong>Descrizione</strong></span>
      </div>
      <div class="col-1"></div>
    </div>
    <div class="row" v-if="showNewFunct">
      <div class="col-1">
        <span>*</span>
      </div>
      <div class="col-2">
        <CInput placeholder="Nome" v-model="newStepInstance.functionality" />
      </div>
      <div class="col-2">
        <CInput placeholder="Metodo" v-model="newStepInstance.method" />
      </div>
      <div class="col-3">
        <v-select :options="getStatisticalMethodsOptions()" label="name" key="id" placeholder="Metodo Statistico"
          v-model="selectedStatMethod"></v-select>
      </div>
      <div class="col-3">
        <CTextarea placeholder="Descrizione" v-model="newStepInstance.descr" />
      </div>
      <div class="col-1">
        <span class="icon-link" @click.prevent="handleSubmitAdd">
          <success-icon />&nbsp;
        </span>
        <span class="icon-link" @click.prevent="showNewFunct = false">
          <minus-icon />
        </span>
      </div>
    </div>
{{ stepInstancesLocal }}
    <div class="row" v-for="(stepinstance, index) of stepInstancesLocal" :key="stepinstance.id">
      <div class="col-1">
        {{ index + 1 }})
      </div>
      <div class="col-2">
        <CInput placeholder="Nome" v-model="stepinstance.functionality" />
      </div>
      <div class="col-2">
        <CInput placeholder="Metodo" v-model="stepinstance.method" />
      </div>
      <div class="col-3">
        <v-select :options="getStatisticalMethodsOptions()" label="name" key="id" placeholder="Metodo Statistico"
          v-model="stepinstance.statMethod"   ></v-select>
      </div>
      <div class="col-3">
        <CTextarea placeholder="Descrizione" v-model="stepinstance.descr" />
      </div>
      <div class="col-1">
        <span class="icon-link" @click.prevent="handleSubmitUpdate(stepinstance)">
          <success-icon />&nbsp;
        </span>
        <span class="icon-link" @click.prevent="modalOpen(stepinstance)">
          <delete-icon />
        </span>
      </div>
    </div>

    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton shape="square" size="sm" color="primary" @click="deleteStepInstance">
          Delete
        </CButton>
      </template>
      Elimina funzionalità '{{ selectedStepInstance.functionality }}'?
    </CModal>
  </div>
</template>

<script>
export default {
  name: "FunctionalityTable",

  emits: ["reLoadData"],
  props: {
    appService: {
      type: Number,
      required: true,
      default: () => null
    },
    stepInstances: {
      type: Array,
      required: true,
      default: () => []
    },
    statisticalMethodsList: {
      type: Array,
      required: true,
      default: () => []
    }
  },
  data() {
    return {
      showNewFunct: false,
      stepInstancesLocal: [],
      selectedStepInstance: {},
      selectedStatMethod: {},
      warningModal: false,
      newStepInstance: {
        descr: "",
        method: "",
        statMethod: 0,
        functionality: "",
        appService: this.appService
      },

     
    };
  },
  methods: {
    deleteStepInstance() {
      this.$store
        .dispatch("appservice/delete", this.selectedStepInstance.id)
        .then(this.$emit("reLoadData", this.appService));
      this.warningModal = false;
    },
    modalOpen(app) {
      this.selectedStepInstance = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    },
    getStatisticalMethodsOptions: function () {
      if (this.statisticalMethodsList)
        return this.statisticalMethodsList.map(method => {
          return {
            id: method.id,
            name: method.name
          };
        });
      else return [];
    },

    handleSubmitUpdate(selStepInstance) {
      let updateStepInstance= {
        id: selStepInstance.id,
        descr: selStepInstance.descr,
        method: selStepInstance.method,
        statMethod:selStepInstance.statMethod.id,
        functionality:selStepInstance.functionality,
        appService: this.appService
      };
      this.$store
        .dispatch("stepinstance/update", updateStepInstance)
        .then(this.$emit("reLoadData", this.appService));
    },
    handleSubmitAdd() {
      this.newStepInstance.statMethod=this.selectedStatMethod.id;
      this.$store
        .dispatch("stepinstance/save", this.newStepInstance)
        .then(this.$emit("reLoadData", this.appService));
      this.showNewFunct = false;
    },

  },
  created() {
    this.stepInstancesLocal = this.stepInstances; 
     this.stepInstancesLocal.statMethod =  this.stepInstances.map(method => {
          return {
            id: method.id,
            name: method.name
          };
        });  
  }
};
</script>

<style>
.table-container {
  margin: 10px;
}

table.editable-table {
  margin-top: 10px;
}

table.editable-table td {
  vertical-align: middle;
}

.editable-table .data-cell {
  padding: 8px;
  vertical-align: middle;
}

.editable-table .custom-checkbox {
  width: 50px;
}

.remove-icon {
  color: red;
  cursor: pointer;
  font-size: 20px;
}

.edit-icon {
  color: rgb(4, 83, 158);
  cursor: pointer;
  font-size: 20px;
}

.name-col {
  width: 120px;
}

.department-col {
  width: 150px;
}

.age-col {
  width: 100px;
}

.date-col {
  width: 200px;
}

.is-active-col {
  width: 100px;
}
</style>
