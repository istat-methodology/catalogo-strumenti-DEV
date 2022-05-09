<template>
  <div v-if="statisticalMethodsList">
    <div class="row">
      <span
        @click="$emit('reLoadData')"
        title="Refresh"
        class="icon-link float-right"
      >
        <text-icon /> refresh
      </span>
      <span
        @click="showNewFunct = true"
        title="Nuova"
        class="icon-link float-right"
      >
        <block-icon /> Nuova funzionalità
      </span>
    </div>
    <div class="row" v-if="showNewFunct || stepInstancesLocal.length > 0">
      <div class="col-2">
        <span><strong>Nome</strong></span>
      </div>
      <div class="col-3">
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
      <div class="col-2">
        <CInput placeholder="Nome" v-model="newStepInstance.functionality" />
      </div>
      <div class="col-3">
        <CInput placeholder="Metodo" v-model="newStepInstance.method" />
      </div>
      <div class="col-3">
        <v-select
          :options="getStatisticalMethodsOptions()"
          label="name"
          key="id"
          placeholder="Metodo Statistico"
          v-model="selectedStatMethod"
        ></v-select>
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

    <div
      class="row"
      v-for="stepinstance of stepInstancesLocal"
      :key="stepinstance.id"
    >
      <div class="col-2">
        <CInput placeholder="Nome" v-model="stepinstance.functionality" />
      </div>
      <div class="col-3">
        <CInput placeholder="Metodo" v-model="stepinstance.method" />
      </div>
      <div class="col-3">
        <v-select
          :options="getStatisticalMethodsOptions()"
          label="name"
          key="id"
          placeholder="Metodo Statistico"
          v-model="stepinstance.statMethod"
        ></v-select>
      </div>
      <div class="col-3">
        <CTextarea placeholder="Descrizione" v-model="stepinstance.descr" />
      </div>
      <div class="col-1">
        <span class="icon-link" @click.prevent="handleSubmitAdd(stepinstance)">
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
        <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="deleteStepInstance"
        >
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

      fields: [
        {
          key: "functionality",
          label: "Funzionalità",
          type: "text",
          editable: true,
          placeholder: "Nome funzionalità...",
          class: "name-col",
          validate: this.validateName
        },
        {
          key: "method",
          label: "Metodo",
          type: "text",
          editable: true,
          placeholder: "Nome metodo...",
          class: "name-col",
          validate: this.validateName
        },
        {
          key: "statMethodName",
          label: "MetodoStatistico",
          type: "select",
          editable: true,
          class: "department-col",
          options: this.getStatisticalMethodsOptions()
        },
        {
          key: "descr",
          label: "Descrizione",
          type: "text",
          editable: true,
          placeholder: "Descrizione...",
          class: "name-col",
          validate: this.validateName
        },

        { key: "edit", label: "" },
        { key: "delete", label: "" }
      ],
      rowUpdate: {},
      enabledButtonAddFuncts: true
    };
  },
  methods: {
    deleteStepInstance() {
      this.$store
        .dispatch("appservice/delete", this.selectedStepInstance.id)
        .then(this.$emit("reLoadData"));
      this.warningModal = false;
    },
    modalOpen(app) {
      this.selectedStepInstance = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    },
    getStatisticalMethodsOptions: function() {
      if (this.statisticalMethodsList)
        return this.statisticalMethodsList.map(method => {
          return {
            id: method.id,
            name: method.name
          };
        });
      else return [];
    },

    handleSubmit(data, update) {
      this.rowUpdate = {
        edit: false,
        id: data.id,
        action: update ? "update" : "cancel"
      };

      let updateStepInstance = {
        id: data.item.id,
        descr: data.item.descr,
        method: data.item.method,
        statMethod: data.item.statMethodId,
        functionality: data.item.functionality,
        appService: this.appService
      };
      console.log(updateStepInstance);
      console.log(this.stepInstancesLocal);
      this.$store
        .dispatch("stepinstance/update", updateStepInstance)
        .then(this.$emit("reLoadData"));
    },
    handleSubmitAdd() {
      this.newStepInstance.statMethod = this.selectedStatMethod.value;
      this.$store
        .dispatch("stepinstance/save", this.newStepInstance)
        .then(this.$emit("reLoadData"));
      this.showNewFunct = false;
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
          errorMessage: "Please enter name"
        };
      }
      return { valid: true };
    }
  },
  created() {
    this.stepInstancesLocal = this.stepInstances;
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
