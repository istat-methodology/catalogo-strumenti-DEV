<template>
  <div>
    <label>Passi del processo: {{ positionIndex }}. {{ processName }}</label>
    <div v-if="processSteps">
      <div v-for="(processStep, index) of processSteps" :key="processStep.id">
        <div class="p-2">
          <h5>
            <span>{{ positionIndex }}.{{ index + 1 }}</span>
            {{ processStep.name }}
          </h5>
          <div class="columns">
            <div class="row">
              <div class="description-fields col-12">
                <span v-if="processStep">{{ processStep.descr }}</span>
              </div>
              <!--div class="card col-md-auto">
                <span><strong>Etichetta</strong></span>
                <div class="card-slot">
                  <span v-if="processStep">{{ processStep.label }}</span>
                </div>
              </div-->
            </div>
          </div>

          <div class="card-body">
            <!--div class="card-body"-->
            <!-- @start Condition to show filtrable table if results are more then 5 lines-->

            <div
              v-for="processDesign in getProcessDesignes(
                processStep.processDesigns
              )"
              :key="processDesign.id"
            >
              <div class="card-slot">
                <span>{{ processDesign.descr }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "CBusinessProcessStepView",
  components: {},
  data() {
    return {
      disabled: false,
      fields: [
        {
          key: "id",
          label: "id",
        },
        {
          key: "type",
          label: "Tipo",
        },
        {
          key: "informationObjectName",
          label: "ioNome",
        },
        {
          key: "informationObjectDescr",
          label: "ioDescrizione",
        },
      ],
    };
  },
  methods: {
    getProcessDesignes: function (processDesignes) {
      if (processDesignes) {
        const list = processDesignes.map((pDesign) => {
          return {
            id: pDesign.id,
            descr: pDesign.descr,
            processSpecification: pDesign.processSpecification.map(
              (pSpecification) => {
                return {
                  type: pSpecification.designType.type,
                  informationObjectName: pSpecification.informationObject.name,
                  informationObjectDescr:
                    pSpecification.informationObject.descr,
                };
              }
            ),
          };
        });
        return list;
      }
    },
  },
  props: {
    processSteps: {
      type: Array,
      required: true,
      default: () => [],
    },
    processName: {
      type: String,
      required: true,
      default: () => "",
    },
    positionIndex: {
      type: String,
      required: true,
      default: () => "",
    },
  },
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
fieldset.scheduler-border {
  border: 1px solid #ddd !important;
  padding: 0 1.4em 1.4em 1.4em !important;
  margin: 0 0 1.5em 0 !important;
}
legend.scheduler-border {
  width: inherit; /* Or auto */
  padding: 0 10px; /* To give a bit of padding on the left and right */
  border-bottom: none;
}
</style>
