<template>
  <div  v-if="statisticalMethodsList">
    <b-button variant="success" @click="handleAdd()">Nuova funzionalità</b-button>
         <div
                  class="table-responsive"
                
                >
    <b-editable-table
      disableDefaultEdit
      :rowUpdate="rowUpdate"
      :editMode="'row'"
      bordered
      class="editable-table"
      v-model="stepInstancesLocal"
      :fields="fields"
    >
      <template #cell(isActive)="data">
        <span v-if="data.value">Yes</span>
        <span v-else>No</span>
      </template>
      <template #cell(edit)="data">
        <div v-if="data.isEdit">
          <BIconX class="edit-icon" @click="handleSubmit(data, false)"></BIconX>
          <BIconCheck
            class="edit-icon"
            @click="handleSubmit(data, true)"
          ></BIconCheck>
        </div>
        <BIconPencil
          v-else
          class="edit-icon"
          @click="handleEdit(data, true)"
        ></BIconPencil>
      </template>
      <template #cell(delete)="data">
        <BIconTrash
          class="remove-icon"
          @click="handleDelete(data)"
        ></BIconTrash>
      </template>
    </b-editable-table>
  </div>   
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

  props: {
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
        stepInstancesLocal:[],
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
    };
  },
  methods: {
    getStatisticalMethodsOptions: function () {
      console.log(this.statisticalMethodsList);
      if (this.statisticalMethodsList)
        return this.statisticalMethodsList.map((method) => {
          return {
            value: method.id,
            text: method.name,
          };
        });
      else return [];
    },
    handleAdd() {
      const newId = Date.now();
      this.rowUpdate = {
        edit: true,
        id: newId,
        action: "add",
        data: {
          id: newId,
          functionality: "",
          method: "",
          statMethodName: -1,
          descr: "",
         
        },
      };
    },
    handleSubmit(data, update) {
      this.rowUpdate = {
        edit: false,
        id: data.id,
        action: update ? "update" : "cancel",
      };
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
 this.stepInstancesLocal=this.stepInstances;
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