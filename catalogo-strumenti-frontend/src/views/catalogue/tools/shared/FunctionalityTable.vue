<template>
  <div>
    <CCardHeader class="mt-4 no-border col-10">
      <h2 v-if="!showNewFunct">
        Funzionalità dell'implementazione
        <div class="card-header-actions">
          <button
            class="btn btn-outline-primary text-center"
            @click="showNewFunct = true"
            title="Aggiungi una nuova funzionalità"
          >
            <plus-icon title="Nuova funzionalità" />
          </button>
        </div>
      </h2>
      <h2 v-if="showNewFunct">
        Aggiungi una nuova funzionalità
        <div class="card-header-actions">
          <button
            class="btn btn-outline-primary text-center"
            @click.prevent="handleSubmitAdd"
            title="Salva"
          >
            <floppy-icon title="Salva" />
          </button>
          <button
            class="btn btn-outline-primary text-center"
            @click.prevent="showNewFunct = false"
            title="Chiudi"
          >
            <close-icon title="Chiudi" />
          </button>
        </div>
      </h2>
    </CCardHeader>
    <CCard class="col-10"
      ><CCardBody>
        <div v-if="showNewFunct || stepInstancesLocal.length > 0">
          <div v-if="showNewFunct">
            <div class="row">
              <div class="col-12">
                <div class="row">
                  <div class="col-4">
                    <div class="col-12"><span>*</span>Nome</div>
                    <CInput
                      class="col-12"
                      placeholder="Nome"
                      v-model="newStepInstance.functionality"
                    />
                  </div>
                  <div class="col-4">
                    <div class="col-12">Funzione</div>
                    <CInput
                      class="col-12"
                      placeholder="Metodo"
                      v-model="newStepInstance.method"
                    />
                  </div>
                  <div class="col-4">
                    <div class="col-12">Metodo Statistico</div>
                    <v-select
                      :options="getStatisticalMethodsOptions()"
                      label="name"
                      key="id"
                      placeholder="Metodo Statistico"
                      v-model="selectedStatMethod"
                      class="col-12"
                    ></v-select>
                  </div>
                </div>
                <div>
                  <div class="col-12">Descrizione</div>
                  <CTextarea
                    class="col-12"
                    placeholder="Descrizione"
                    v-model="newStepInstance.descr"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
        <div v-if="!showNewFunct">
          <tr>
            <th></th>
            <th>Nome</th>
            <th>Funzione</th>
            <th class="col-4">Metodo Statistico</th>
            <th class="col-4">Descrizione</th>
          </tr>

          <tr
            v-for="(stepinstance, index) of stepInstancesLocal"
            :key="stepinstance.id"
            class="mb-1"
          >
            <td>{{ index + 1 }})</td>
            <td class="pr-1">
              <CInput placeholder="Nome" v-model="stepinstance.functionality" />
            </td>
            <td class="pr-1">
              <CInput placeholder="Metodo" v-model="stepinstance.method" />
            </td>
            <td class="pr-1 col-4">
              <v-select
                :options="getStatisticalMethodsOptions()"
                label="name"
                key="id"
                placeholder="Metodo Statistico"
                v-model="stepinstance.statMethod"
                :components="{Deselect}"
              ></v-select>
            </td>
            <td class="pr-1 col-4">
              <CTextarea
                placeholder="Descrizione"
                v-model="stepinstance.descr"
              />
            </td>
            <td>
              <span
                class="btn btn-rounded"
                @click.prevent="handleSubmitUpdate(stepinstance)"
              >
                <floppy-icon title="Salva" />&nbsp;
              </span>
            </td>
            <td>
              <span
                class="btn btn-rounded"
                @click.prevent="modalOpen(stepinstance)"
              >
                <delete-icon title="Cancella" />
              </span>
            </td>
          </tr>
        </div>
      </CCardBody>
    </CCard>

    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Chiudi
        </CButton>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="deleteStepInstance"
        >
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
      /*
      Deselect: {
        render: createElement => createElement('span', '❌'),
      },
      */
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
        appService: this.appService,
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
        return this.statisticalMethodsList.map((method) => {
          return {
            id: method.id,
            name: method.name,
          };
        });
      else return [];
    },

    handleSubmitUpdate(selStepInstance) {
      let updateStepInstance = {
        id: selStepInstance.id,
        descr: selStepInstance.descr,
        method: selStepInstance.method,
        statMethod: selStepInstance.statMethod.id,
        functionality: selStepInstance.functionality,
        appService: this.appService,
      };
      this.$store
        .dispatch("stepinstance/update", updateStepInstance)
        .then(this.$emit("reLoadData", this.appService));
    },
    handleSubmitAdd() {
      this.newStepInstance.statMethod = this.selectedStatMethod.id;
      this.$store
        .dispatch("stepinstance/save", this.newStepInstance)
        .then(this.$emit("reLoadData", this.appService));
      this.showNewFunct = false;
    },
  },
  created() {
    this.stepInstancesLocal = this.stepInstances;
    this.stepInstancesLocal.statMethod = this.stepInstances.map((method) => {
      return {
        id: method.id,
        name: method.name,
      };
    });
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
