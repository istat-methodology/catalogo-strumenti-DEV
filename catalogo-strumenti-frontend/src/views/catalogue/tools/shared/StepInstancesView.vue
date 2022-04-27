<template>
  <div>
    <h2>Funzioni e processi</h2>
    <div class="card w-100">
      <div class="card-body">
        <div class="card w-100">
          <header class="card-header">
            <h5>{{ businessServiceService.name }}</h5>
          </header>
          <div class="card-body">
            <p class="card-text">{{ businessServiceService.descr }}</p>

            <div
              class="card card-border bg-lighter"
              v-for="appService of businessServiceService.appServices"
              :key="appService.id"
            >
              <!-- appservices -->
              <div class="card w-100">
                <header class="card-header">
                  <h5>Implementazione</h5>
                </header>
                <div class="card-body">
                  <div class="card card-border">
                    <div class="card-body">
                      <div class="card-group">
                        <span><strong>Name:</strong></span>
                        <div class="card-slot">
                          {{ appService.name }}
                        </div>
                      </div>
                      <div class="card-group">
                        <span><strong>Description:</strong></span>
                        <div class="card-slot">
                          <span v-if="appService">{{ appService.descr }}</span>
                        </div>
                      </div>

                      <div class="card-group">
                        <span><strong>Implementation language:</strong></span>
                        <div class="card-slot">
                          <span v-if="appService">{{
                            appService.implementationLanguage
                          }}</span>
                        </div>
                      </div>

                      <div class="card-group">
                        <span><strong>author:</strong></span>
                        <div class="card-slot">
                          <span v-if="appService">{{ appService.author }}</span>
                        </div>
                      </div>

                      <div class="card-group">
                        <span><strong>licence:</strong></span>
                        <div class="card-slot">
                          <span v-if="appService.licence">{{
                            appService.licence
                          }}</span>
                          <span v-else class="default-value">no value</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Variable representation stepInstances-->
                  <div class="card w-100">
                    <div class="card-header">Funzionalità</div>
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
                  </div>
                </div>
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
  name: "StepInstancesView",
  props: {
    businessServiceService: {
      type: Object,
      required: true,
      default: () => [],
    },
  },
  data() {
    return {
      disabled: false,
      fields: [
        {
          key: "functionality",
          label: "functionality",
        },
        {
          key: "method",
          label: "method",
        },
        {
          key: "statMethodName",
          label: "statMethod",
        },
        {
          key: "descr",
          label: "descr",
        },
      ],
    };
  },
  methods: {
    getStepInstancesList: function (stepInstances) {
      return stepInstances.map((stepInstance) => {
        return {
          id: stepInstance.id,
          functionality: stepInstance.functionality,
          method: stepInstance.method,
          descr: stepInstance.descr,
          statMethodName: stepInstance.statMethod.name,
          statMethodId: stepInstance.statMethod.id,
        };
      });
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
</style>
