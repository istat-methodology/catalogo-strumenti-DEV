<template>
  <div class="row p-0">
    <div class="col-10 p-0 ml-0">
          <CBusinessProcessStepNew
            :bDesignType="designtypeList"
            :bPStep="selectedStep"            
            @enableBack="handleBack"/>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CBusinessProcessStepNew from "@/components/businessProcess/CBusinessProcessStepNew";
export default {
  name: "ProcessStepsAdd",
  components: {
    CBusinessProcessStepNew
  },
  data() {
    return {
      selectedStep: null
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"])
  },
  emits: ["refreshBProcess"],

  props: {
    bProcesses: {
      type: Array,
      required: true,
      default: () => [],
    },
    functionId: {
      type: Number,
      required: true,
      default: null,
    },
    bFunctionName: {
      type: String,
      required: true,
      default: null,
    },
  },
  methods: {
    handleBack() {
      this.$router.push({ name: "ProcessStepsList" });
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
</style>
