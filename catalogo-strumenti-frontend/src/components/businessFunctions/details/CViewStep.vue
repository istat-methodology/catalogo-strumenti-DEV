<template>
  <div v-if="bDesignType">
    <div v-if="stateform == FormState.STEP_EDIT">
      <CTitle
        :title="processStepLocal.name"
        buttonTitle="passo"
        functionality=""
        :authenticated="isAuthenticated"
        :buttons="['indietro']"
        @handleBack="enableBack"
      />

      <div class="row p-2">
        <div class="card col-2 p-3">
          <span class="p-2"><strong>id</strong></span>
          <div class="card-slot pl-2">
            <span>
              {{ processStepLocal.id }}
            </span>
          </div>
        </div>

        <div class="card col-5 p-3">
          <span class="p-2"><strong>Etichetta</strong></span>
          <div class="card-slot pl-2">
            <span>
              {{ processStepLocal.label }}
            </span>
          </div>
        </div>

        <div class="card col-5 p-3">
          <span class="p-2"><strong>Descrizione</strong></span>
          <div class="card-slot pl-2">
            <span>
              {{ processStepLocal.descr }}
            </span>
          </div>
        </div>
      </div>

      <CTitle
        title="Process Design"
        buttonTitle=" nuovo Process Design "
        functionality=""
        :authenticated="isAuthenticated"
      />
      <div v-if="processStepLocal.processDesigns">
        <div
          v-for="processDesign of getProcessDesign()"
          :key="processDesign.id"
        >
          <div class="card">
            <div class="card-header no-border m-0">
              <h5>
                <div class="text-info float-left">
                  {{ processDesign.id }} - {{ processDesign.descr }}
                </div>
              </h5>
            </div>
            <CDataTable
              v-if="processStepLocal"
              :items="getProcessSpecification(processDesign)"
              :items-per-page="5"
              :fields="fieldsProcessSpecification"
              hover
              pagination
              class="p-0"
            >
              <template #designType_Tipo_IO="{ item }">
                <td>
                  {{ item.designType_Tipo_IO.type }}
                </td>
              </template>
              <template #designType_Dati_IO="{ item }">
                <td>
                  {{ item.designType_Dati_IO.type }}
                </td>
              </template>
              <template #informationObjectId="{ item }">
                <td>
                  {{ item.informationObject.id }}
                </td>
              </template>
              <template #informationObjectName="{ item }">
                <td>
                  {{ item.informationObject.name }}
                </td>
              </template>
              <template #informationObjectDescription="{ item }">
                <td>
                  {{ item.informationObject.descr }}
                </td>
              </template>
            </CDataTable>
          </div>
        </div>
      </div>
      <div v-else>Non sono presenti process design</div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";

import CTitle from "@/components/CTitle.vue";
var _ = require("lodash");

export default {
  name: "CViewStep",
  components: {
    CTitle
  },

  data() {
    return {
      fieldsProcessSpecification: [
        {
          key: "id",
          label: "ID ",
          _style: "width:auto;"
        },
        {
          key: "designType_Tipo_IO",
          label: "Tipo I/O",
          _style: "width:auto;"
        },

        {
          key: "designType_Dati_IO",
          label: "Dati I/O",
          _style: "width:auto;"
        },
        {
          key: "informationObjectId",
          label: "information Object ID",
          _style: "width:auto;"
        },
        {
          key: "informationObjectName",
          label: "Information Object Name",
          _style: "width:auto;"
        },
        {
          key: "informationObjectDescription",
          label: " information Object Description",
          _style: "width:20%;"
        }
        /*,
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }*/
      ],

      processStepToSave: {
        id: 0,
        name: "",
        descr: "",
        label: "",
        businessServiceId: 0
      },
      processDesignToSave: {
        id: 0,
        descr: "",
        step: ""
      },

      designTypeLocal: {},
      designTypeSelected: {},
      selectedProcessDesign: {},
      selectedProcessSpecification: {},

      FormState: {
        STEP_EDIT: 4,
        PROCESS_DESIGN_VIEW: 10,
        PROCESS_DESIGN_NEW: 11,
        PROCESS_DESIGN_EDIT: 12,

        PROCESS_SPECIFICATION_VIEW: 20,
        PROCESS_SPECIFICATION_NEW: 21,
        PROCESS_SPECIFICATION_EDIT: 22
      },
      stateform: 4,
      warningModal: false
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("processDesign", ["processDesign"])
  },
  props: {
    bPStep: {
      type: Object,
      required: true,
      default: () => {}
    },
    bDesignType: {
      type: Array,
      required: true,
      default: () => []
    }
  },
  methods: {
    getProcessDesign: function() {
      if (this.processStepLocal && this.processStepLocal.processDesigns) {
        return this.processStepLocal.processDesigns.map(item => {
          return {
            id: item.id,
            descr: item.descr,
            processSpecification: item.processSpecification
          };
        });
      } else {
        return [];
      }
    },
    getProcessSpecification: function(processDesign) {
      return processDesign.processSpecification.map(item => {
        return {
          id: item.id,
          designType_Tipo_IO: {
            id:
              item.designType.parent == null
                ? item.designType.id
                : item.designType.parent,
            type:
              item.designType.parent == null
                ? item.designType.type
                : this.getDesignType(item.designType.parent)
          },
          designType_Dati_IO: {
            id: item.designType.parent == null ? 0 : item.designType.id,
            type: item.designType.parent == null ? "" : item.designType.type
          },
          informationObject: {
            id: item.informationObject.id,
            name: item.informationObject.name,
            descr: item.informationObject.descr,
            businessServiceId: item.informationObject.businessService.id
          }
        };
      });
    },
    getDesignType(id) {
      console.log(this.designTypeLocal);
      var dt = this.designTypeLocal[id];
      console.log(dt);
      return dt;
    },
    enableBack() {
      this.$emit("enableBack");
    }
  },
  created() {
    this.processStepLocal = this.bPStep;
    this.designTypeLocal = _.map(this.bDesignType, "type");
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
