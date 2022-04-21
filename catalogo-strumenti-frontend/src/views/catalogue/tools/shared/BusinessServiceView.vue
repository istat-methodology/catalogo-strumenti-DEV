<template>
  <div class="card w-100">
    <div class="card-header">
      <h5>Funzionalità</h5>
    </div>
    <div class="card-body">
      <div
        v-for="appService of businessServiceService.appServices"
        :key="appService.id"
      >
        <!-- appservices -->
        <div class="card card-border bg-lighter">
          <div class="card-body">
            <CRow
              class="
                row
                row-cols-xs-2
                row-cols-sm-2
                row-cols-md-2
                row-cols-lg-2
                row-cols-2
              "
            >
              <CCol>
                <div class="card-group">
                  <span><strong>Nome:</strong></span>
                  <div class="card-slot">
                    {{ appService.name }}
                  </div>
                </div>
                <div class="card-group">
                  <span><strong>Descrizione:</strong></span>
                  <div class="card-slot">
                    <span v-if="appService">{{ appService.descr }}</span>
                  </div>
                </div>

                <div class="card-group">
                  <span><strong>Linguaggio di implementazione:</strong></span>
                  <div class="card-slot">
                    <span v-if="appService">{{
                      appService.implementationLanguage
                    }}</span>
                  </div>
                </div>
                <div class="card-group">
                  <span><strong>File/Package:</strong></span>
                  <div class="card-slot">
                    <span v-if="appService">{{ appService.sourcePath }}</span>
                  </div>
                </div>
              </CCol>
              <CCol>
                <div class="card-group">
                  <span><strong>Autore:</strong></span>
                  <div class="card-slot">
                    <span v-if="appService">{{ appService.author }}</span>
                  </div>
                  <table
                    class="table table-hover"
                    v-if="appService && appService.stepInstances.length < 20"
                  >
                    <thead>
                      <tr>
                        <th scope="col">functionality</th>
                        <th scope="col">method</th>
                        <th scope="col">statMethod</th>
                        <th scope="col">descr</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr
                        v-for="item in getStepInstancesList(
                          appService.stepInstances
                        )"
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
                    No data available
                  </h5>
                  ======= >>>>>>> 8d4013880b786b022c352fda14de3c393e3dfce2
                </div>
                <div class="card-group">
                  <span><strong>Contatto:</strong></span>
                  <div class="card-slot">
                    <span v-if="appService">{{ appService.contact }}</span>
                  </div>
                </div>

                <div class="card-group">
                  <span><strong>Licenza:</strong></span>
                  <div class="card-slot">
                    <span v-if="appService.licence">{{
                      appService.licence
                    }}</span>
                    <span v-else class="default-value">no value</span>
                  </div>
                </div>
              </CCol>
            </CRow>
          </div>

          <div class="card-body">
            <!-- @start Condition to show filtrable table if results are more then 5 lines-->
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
                  <th scope="col">Funzionalità</th>
                  <th scope="col">Metodo</th>
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
              No data available
            </h5>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "BusinessServiceView",
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
</style>
