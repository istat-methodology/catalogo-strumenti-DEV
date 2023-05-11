<template>
  <div>
    <CTitle
      :title="lProcess.name"
      :buttonTitle="lProcess.name"
      functionality="DETTAGLIO PROCESSO"
      :authenticated="isAuthenticated"
      :buttons="['indietro']"
      @handleBack="handleBack"
    />
    <div v-if="lProcess">
      <div class="row p-2">
        <div class="card col p-3">
          <span class="p-2"><strong>Etichetta</strong></span>
          <div class="card-slot pl-2">
            <span>
              {{ lProcess.label }}
            </span>
          </div>
        </div>
        <div class="card col-1 p-3">
          <span class="p-2"><strong>Ordine</strong></span>
          <div class="card-slot pl-2">
            <span>
              {{ lProcess.orderCode }}
            </span>
          </div>
        </div>
        <div class="card col-8 p-3">
          <span class="p-2"><strong>Descrizione</strong></span>
          <div class="card-slot pl-2 pb-2">
            <span>
              {{ lProcess.descr }}
            </span>
          </div>
        </div>
      </div>

      <CTitle
        title="Passi"
        buttonTitle=" Passo"
        functionality=""
        :authenticated="isAuthenticated"
      />
      <CCard>
        <CCardBody>
          <span
            v-if="lProcess.processSteps && lProcess.processSteps.length > 0"
          >
            <CDataTable
              v-if="lProcess"
              :items="getProcessStepsList()"
              :fields="fields"
              :items-per-page="10"
              hover
              pagination
            >
              <template #show_details="{ item }">
                <td>
                  <span class="icon-link" @click="handleShowStep(item)"
                    ><view-icon title="view"
                  /></span>
                </td>
              </template>
            </CDataTable>
          </span>
          <span v-else>Non sono presenti passi</span>
        </CCardBody>
      </CCard>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "CBusinessProcessView",
  components: {
    CTitle
  },
  data() {
    return {
      fields: [
        {
          key: "name",
          label: "Nome",
          _style: "width:20%;"
        },
        {
          key: "label",
          label: "etichetta",
          _style: "width:40%;"
        },
        {
          key: "descr",
          label: "Descrizione",
          _style: "width:40%;"
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ],
      lProcess: {},
      states: [],
      FormState: {},
      stateform: 0,
      warningModal: false
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"])
  },
  props: {
    pProcess: {
      type: Object,
      required: true,
      default: () => {}
    }
  },
  methods: {
    getProcessStepsList: function() {
      if (this.lProcess && this.lProcess.processSteps) {
        return this.lProcess.processSteps.map(step => {
          return {
            id: step.id,
            name: step.name == null ? "" : step.name,
            label: step.label == null ? "" : step.label,
            descr: step.descr == null ? "" : step.descr,
            //tool: step.businessService == null ? "" : step.businessService.name,
            stepInstances:
              step.stepInstances == null
                ? ""
                : step.stepInstances
                    .map(instance => {
                      return (
                        instance.functionality + " (" + instance.method + ")"
                      );
                    })
                    .join(", "),
            processDesigns: step.processDesigns
          };
        });
      } else {
        return [];
      }
    },
    handleBack() {
      this.$emit("enableBack");
    },

    handleShowStep(step) {
      this.$emit("enableShowStep", step);
    }
  },

  created() {
    this.lProcess = this.pProcess;
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
