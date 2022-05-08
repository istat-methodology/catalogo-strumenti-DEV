<template>
  <div v-if="statisticalMethodsList">
    <b-button variant="success" @click="showNewFunct = true">+ Nuova funzionalità</b-button>
    <div v-if="showNewFunct">
      <CCard>
        <CCardHeader>Nuova funzionalità</CCardHeader>
        <CCardBody>
          <div class="row">
            <div class="col-2"> <span><strong>Nome</strong></span></div>
            <div class="col-3"> <span><strong>Metodo </strong></span></div>
            <div class="col-3"> <span><strong>Metodo statistico</strong></span></div>
            <div class="col-4"> <span><strong>Descrizione</strong></span></div>

          </div>
          <div class="row">
            <div class="col-2">
              <CInput placeholder="Nome" v-model="newStepInstance.functionality" />
            </div>
            <div class="col-3">
              <CInput placeholder="Metodo" v-model="newStepInstance.method" />
            </div>
            <div class="col-3">
          
              <v-select  :options="getStatisticalMethodsOptions()" label="text" key="value" 
                placeholder="Metodo Statistico" v-model="selectedStatMethod"></v-select>
            </div>
            <div class="col-4">
              <CTextarea placeholder="Descrizione" v-model="newStepInstance.descr" />
            </div>

          </div>
          <CInput label="Nome" placeholder="Nome" v-model="newStepInstance.functionality" />
          <CInput label="Metodo" placeholder="Metodo" v-model="newStepInstance.method" />

          <v-select label="text" key="value"  :options="getStatisticalMethodsOptions()"
            placeholder="Metodo Statistico" v-model="selectedStatMethod"   ></v-select>
          <CTextarea label="Descrizione" placeholder="Descrizione" v-model="newStepInstance.descr" />
        </CCardBody>

        <CCardFooter>
          <CButton shape="square" size="sm" color="primary" class="mr-2" @click.prevent="handleSubmitAdd">Salva
          </CButton>
          <CButton shape="square" size="sm" color="light" @click.prevent="$router.back()">Chiudi</CButton>
        </CCardFooter>
      </CCard>
    </div>
    <div class="table-responsive">
      <b-editable-table disableDefaultEdi :rowUpdate="rowUpdate" :editMode="'row'" bordered class="editable-table"
        v-model="stepInstancesLocal" :fields="fields">
        <template #cell(isActive)="data">
          <span v-if="data.value">Yes</span>
          <span v-else>No</span>
        </template>
        <template #cell(edit)="data">
          <div v-if="data.isEdit">
            <BIconX class="edit-icon" @click="handleSubmit(data, false)"></BIconX>
            <BIconCheck class="edit-icon" @click="handleSubmit(data, true)"></BIconCheck>
          </div>
          <BIconPencil v-else class="edit-icon" @click="handleEdit(data, true)"></BIconPencil>
        </template>
        <template #cell(delete)="data">
          <BIconTrash class="remove-icon" @click="handleDelete(data)"></BIconTrash>
        </template>
      </b-editable-table>
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
import BEditableTable from "bootstrap-vue-editable-table";

import {
  BIconTrash,
  BIconPencil,
  BIconX,
  BIconCheck,
  BButton,
} from "bootstrap-vue";
export default {
  name: "FunctionalityTable",
  components: {
    BEditableTable,
    BIconX,
    BIconTrash,
    BIconPencil,
    BIconCheck,
    BButton,
  },
  emits: ["reLoadData"],
  props: {
    appService: {
      type: Number,
      required: true,
      default: () => null,
    },
    stepInstances: {
      type: Array,
      required: true,
      default: () => [],
    },
    statisticalMethodsList: {
      type: Array,
      required: true,
      default: () => [],
    },
  },
  data() {
    return {
      showNewFunct: false,
      stepInstancesLocal: [],
      selectedStepInstance:{},
      selectedStatMethod:{},
      warningModal : false,
      newStepInstance: {
        descr: "",
        method: "",
        statMethod: 0,
        functionality: "",
        appService: this.appService,
      },

      fields: [
        {
          key: "functionality",
          label: "Funzionalità",
          type: "text",
          editable: true,
          placeholder: "Nome funzionalità...",
          class: "name-col",
          validate: this.validateName,
        },
        {
          key: "method",
          label: "Metodo",
          type: "text",
          editable: true,
          placeholder: "Nome metodo...",
          class: "name-col",
          validate: this.validateName,
        },
        {
          key: "statMethodName",
          label: "MetodoStatistico",
          type: "select",
          editable: true,
          class: "department-col",
          options: this.getStatisticalMethodsOptions(),
        },
        {
          key: "descr",
          label: "Descrizione",
          type: "text",
          editable: true,
          placeholder: "Descrizione...",
          class: "name-col",
          validate: this.validateName,
        },

        { key: "edit", label: "" },
        { key: "delete", label: "" },
      ],
      rowUpdate: {},
      enabledButtonAddFuncts: true,
    };
  },
  methods: {
      deleteStepInstance() {
      this.$store.dispatch("appservice/delete", this.selectedStepInstance.id).then(this.$emit("reLoadData"));
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
        return this.statisticalMethodsList.map((method) => {
          return {
            value: method.id,
            text: method.name,
           
     
          };
        });
      else return [];
    },

    handleSubmit(data, update) {

      this.rowUpdate = {
        edit: false,
        id: data.id,
        action: update ? "update" : "cancel",
      };
      console.log(data);
      alert(this.stepInstancesLocal.length);

      let updateStepInstance = {
        id: data.item.id,
        descr: data.item.descr,
        method: data.item.method,
        statMethod: data.item.statMethod,
        functionality: data.item.functionality,
        appService: this.appService,
      }
      this.$store.dispatch("stepinstance/update", updateStepInstance).then(this.$emit("reLoadData"));



    },
    handleSubmitAdd() {
      this.newStepInstance.statMethod=this.selectedStatMethod.value;
      this.$store.dispatch("stepinstance/save", this.newStepInstance).then(this.$emit("reLoadData"));

    },
    handleEdit(data) {

      this.rowUpdate = { edit: true, id: data.id };
    },
    handleDelete(data) {
      this.rowUpdate = { id: data.id, action: "delete" };
    },
    validateName(value) {
      if (value === "") {
        return {
          valid: false,
          errorMessage: "Please enter name",
        };
      }
      return { valid: true };
    },
  },
  created() {
    this.stepInstancesLocal = this.stepInstances;
  },
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