<template>
  <div>
    <h2>Processi</h2>
    <!--div class="columns"-->
      <div class="row">
        <div
          class="card col-md-5 mr-5"
          v-for="bProcess of businessProcess"
          :key="bProcess.id"
        >
          <div class="card-header">
            {{ "(" +  bProcess.label  + ") " + bProcess.name   }}
            <div class="card-header-actions">
              <span>
                <!--span class="icon-link" @click="handleEditBProcess(bProcess)"
                  ><edit-icon title="Edit" /></span
                -->&nbsp;
              </span>
            </div>
          </div>

          <div class="card-body">
            <span v-if="businessProcess">
              <ol>
                <strong>
                  <li>{{ bProcess.descr }}</li></strong
                >
              </ol>
            </span>

            <span
              v-if="bProcess.processSteps && bProcess.processSteps.length > 0"
            >
              <ol>
                <strong>Passi:</strong>
                <li
                  v-for="processStep of bProcess.processSteps"
                  :key="processStep.id"
                >
                  {{ processStep.name }}
                </li>
              </ol>
            </span>
            <span v-else>Non sono presenti passi</span>
          </div>
        </div>
      </div>
    <!--/div-->
  </div>
</template>
<script>
import { mapGetters } from "vuex";
//import CBusinessProcessStepView from "@/components/businessProcess/CBusinessProcessStepView";
export default {
  name: "CBusinessProcessView",
  components: {
    //CBusinessProcessStepView,
  },
  computed: {
    ...mapGetters("designtypes", ["designtypeList"]),
  },
  props: {
    businessProcess: {
      type: Object,
      required: true,
      default: () => {},
    },
  },
  created() {
    this.$store.dispatch("designtypes/findAll");
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
