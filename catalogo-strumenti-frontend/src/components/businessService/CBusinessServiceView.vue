<template>
  <div>
    <h2><span>3.</span> Moduli implementati</h2>
    <div class="description-fields col-12">
      Elenco dei moduli dello strumento
    </div>
    <div v-if="businessServiceService.appServices">
      <div
        v-for="(appService, index) of businessServiceService.appServices"
        :key="appService.id"
      >
        <div class="p-2">
          <h4>
            <span>3.{{ index + 1 }}</span> {{ appService.name }}
          </h4>
          <div class="columns">
            <div class="row">
              <div class="description-fields col-12">
                <span v-if="appService">{{ appService.descr }}</span>
              </div>
              <div class="card col-md-auto">
                <span><strong>Linguaggio di implementazione</strong></span>
                <div class="card-slot">
                  <span v-if="appService">{{
                    appService.implementationLanguage
                  }}</span>
                </div>
              </div>
              <div class="card col-md-auto">
                <span><strong>File/Package</strong></span>
                <div class="card-slot">
                  <span v-if="appService">{{ appService.sourcePath }}</span>
                </div>
              </div>
              <div class="card col-md-auto">
                <span><strong>Licenza</strong></span>
                <div class="card-slot">
                  <span v-if="appService.licence">{{
                    appService.licence
                  }}</span>
                  <span v-else class="default-value">no value</span>
                </div>
              </div>
            </div>
          </div>

          <!--div class="card-body"-->
          <!-- @start Condition to show filtrable table if results are more then 5 lines-->
          <h4>
            <span>3.{{ index + 1 }}.1 </span>Funzionalità
          </h4>
          <div
            class="table-responsive"
            v-if="appService.stepInstances.length > 20"
          >
            <CDataTable
              :items="getStepInstancesList(appService.stepInstances)"
              :fields="fields"
              column-filter
              table-filter
              items-per-page-select
              :items-per-page="5"
              hover
              sorter
              pagination
            >
            </CDataTable>
          </div>
          <!-- @end Condition to show filtrable table if results are more then 5 lines-->
          <table
            class="table table-hover"
            v-if="appService && appService.stepInstances.length < 20"
          >
            <thead>
              <tr>
                <th scope="col">Nome</th>
                <th scope="col">Funzione</th>
                <th scope="col">Metodo Statistico</th>
                <th scope="col">Descrizione</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="item in getStepInstancesList(appService.stepInstances)"
                :key="item.id"
              >
                <td>{{ item.functionality }}</td>
                <td>{{ item.method }}</td>
                <td>{{ item.statMethodName }}</td>
                <td>{{ item.descr }}</td>
              </tr>
            </tbody>
          </table>
          <h5
            v-if="!appService.stepInstances.length"
            class="default-value card-body"
          >
            Nessun dato disponibile
          </h5>
        </div>
        <!--/div-->
        <!--/fieldset-->
      </div>
    </div>

    <div v-else>
      <div class="card w-100">
        <div class="card-body">Nessuna funzionalità definita</div>
      </div>
    </div>
  </div>

  <!--/div>
  </div-->
</template>
<script>
export default {
  name: "CBusinessServiceView",
  props: {
    businessServiceService: {
      type: Object,
      required: true,
      default: () => []
    }
  },
  data() {
    return {
      disabled: false,
      fields: [
        {
          key: "functionality",
          label: "Funzionalità"
        },
        {
          key: "method",
          label: "Metodo"
        },
        {
          key: "statMethodName",
          label: "Metodo Statistico"
        },
        {
          key: "descr",
          label: "Descrizione"
        }
      ]
    };
  },
  methods: {
    getStepInstancesList: function(stepInstances) {
      return stepInstances.map(stepInstance => {
        return {
          id: stepInstance.id,
          functionality: stepInstance.functionality,
          method: stepInstance.method,
          descr: stepInstance.descr,
          statMethodName: stepInstance.statMethod.name,
          statMethodId: stepInstance.statMethod.id
        };
      });
    }
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
