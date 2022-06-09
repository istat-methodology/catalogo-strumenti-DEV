<template>
  <div>
 
  
      
           <CCardHeader> 
Funzionalità dell'implementazione
 <div  class="card-header-actions">  
      <span class="icon-link float-right" @click="showNewFunct = true" title="Aggiungi una nuova funzionalità">
        <plus-icon title="Nuova funzionalità" />Nuova funzionalità
      </span>
 </div>
           </CCardHeader>

          <CCard><CCardBody>
          
 
   <div class="card-body">
    <div class="row" v-if="showNewFunct || stepInstancesLocal.length > 0">
    <table>
    <tr>
      <th></th>
      <th>Nome</th>
      <th>Funzione</th>
<th>Metodo Statistico</th>
<th>Descrizione</th>
<th></th>
<th></th>

    </tr>
   

    <tr  v-if="showNewFunct">
   <td> <span>*</span></td> 
    
     <td> <CInput placeholder="Nome" v-model="newStepInstance.functionality" /></td>   
     <td> <CInput placeholder="Metodo" v-model="newStepInstance.method" /></td>
    
      <td>
        <v-select :options="getStatisticalMethodsOptions()" label="name" key="id" placeholder="Metodo Statistico"
          v-model="selectedStatMethod"></v-select>
      </td>
      <td>
        <CTextarea placeholder="Descrizione" v-model="newStepInstance.descr" />
      </td>
      <td>
        <span class="icon-link" @click.prevent="handleSubmitAdd">
          <floppy-icon />&nbsp;
        </span>
      </td> <td>
        <span class="icon-link" @click.prevent="showNewFunct = false">
          <minus-icon />
        </span>
      </td>
      </tr>
 
    <tr  v-for="(stepinstance, index) of stepInstancesLocal" :key="stepinstance.id">
      <td>
        {{ index + 1 }})
      </td>
      <td>
        <CInput placeholder="Nome" v-model="stepinstance.functionality" />
      </td>
      <td>
        <CInput placeholder="Metodo" v-model="stepinstance.method" />
      </td>
      <td>
        <v-select :options="getStatisticalMethodsOptions()" label="name" key="id" placeholder="Metodo Statistico"
          v-model="stepinstance.statMethod"   ></v-select>
      </td>
      <td>
        <CTextarea placeholder="Descrizione" v-model="stepinstance.descr" />
      </td>
      <td>
        <span class="icon-link" @click.prevent="handleSubmitUpdate(stepinstance)">
          <floppy-icon title="Salva"/>&nbsp;
        </span>
      </td><td>
        <span class="icon-link" @click.prevent="modalOpen(stepinstance)">
          <delete-icon title="Cancella" />
        </span>
        </td>
      </tr>
    </table>
</div></div>
</CCardBody>
          </CCard>


    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Chiudi
        </CButton>
        <CButton shape="square" size="sm" color="primary" @click="deleteStepInstance">
          Cancella
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
        .dispatch("stepinstance/delete", this.selectedStepInstance.id)
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
