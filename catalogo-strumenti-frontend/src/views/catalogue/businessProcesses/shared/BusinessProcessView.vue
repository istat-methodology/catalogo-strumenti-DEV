<template>
  <div>
    <h2>
      Processi
    </h2>
    <div v-if="businessProcesses">
      <div
        v-for="(businessProcess, index) of businessProcesses"
        :key="businessProcess.id"
      >
        <div class="p-2">
          <h4>
            <span> {{ index + 1 }}</span>
            {{ businessProcess.name }}
          </h4>
          <div class="columns">
            <div class="row">
              <div class="description-fields col-12">
                <span v-if="businessProcess">{{ businessProcess.descr }}</span>
              </div>
              <div class="card col-md-auto">
                <span><strong>Etichetta</strong></span>
                <div class="card-slot">
                  <span v-if="businessProcess">{{
                    businessProcess.label
                  }}</span>
                </div>
              </div>
            </div>
          </div>

          <app-process-stepview
            :positionIndex="'(index + 1)'"
            :processName="businessProcess.name"
            :processSteps="businessProcess.processSteps"
          ></app-process-stepview>
        </div>
        <!--/div-->
        <!--/fieldset-->
      </div>
    </div>
  </div>

  <!--/div>
  </div-->
</template>
<script>
import ProcessStepView from "../../processSteps/shared/ProcessStepView";
export default {
  name: "BusinessProcessView",
  components: {
    "app-process-stepview": ProcessStepView
  },
  props: {
    businessProcesses: {
      type: Array,
      required: true,
      default: () => []
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
