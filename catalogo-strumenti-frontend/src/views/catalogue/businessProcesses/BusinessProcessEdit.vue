<template>
  <div class="row" v-if="bProcess">
    <div class="col-8">
      <div>
        <div class="p-0">
          <div v-if="stateform == FormState.EDIT">
            <CTitle
              :title="bProcess.name"
              :buttonTitle="bProcess.name"
              functionality=""
              :authenticated="isAuthenticated"
              :buttons="['salva', 'indietro']"
              @handleSubmit="handleSubmit"
              @handleBack="handleBack"
            />
            <CBusinessProcessEdit
              :bProcess="bProcess"
              @enableEditStep="showEditStep"
              @enableNewStep="showNewStep"
            />
          </div>
          <!-- 
            Modifica Passo del Processo
          -->
          <div v-if="stateform == FormState.STEP_EDIT">
            <div v-if="selectedEditStep">
              <CBusinessProcessStepEdit
                :bPStep="selectedEditStep"
                @enableEditStep="showEditStep"
                @enableBack="stateform = FormState.EDIT"
              />
            </div>
          </div>
          <!-- 
            Nuovo Passo del Processo
          -->
          <div v-if="stateform == FormState.STEP_NEW">          
            <CBusinessProcessStepNew
              :bPStep="selectedEditStep"
              @enableNewStep="showNewStep"
              @enableBack="stateform = FormState.EDIT"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
import CBusinessProcessEdit from "@/components/businessProcess/CBusinessProcessEdit";
import CBusinessProcessStepEdit from "@/components/businessProcess/CBusinessProcessStepEdit";
import CBusinessProcessStepNew from "@/components/businessProcess/CBusinessProcessStepNew";

export default {
  components: {
    CTitle,
    CBusinessProcessEdit,
    CBusinessProcessStepEdit,
    CBusinessProcessStepNew,
  },
  name: "BusinessProcessEdit",
  data() {
    return {
      /*fields: [
        {
          key: "index",
          label: "#",
          _style: "width:1%;"
        },
        {
          key: "name",
          label: "Nome",
          _style: "width:20%;"
        },

        {
          key: "tool",
          label: "Strumento",
          _style: "width:40%;"
        },
        {
          key: "stepInstances",
          label: "Funzione",
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
      */
      FormState: {
        LIST: 0,
        EDIT: 1,
        NEW: 2,
        ADD: 3,
        STEP_EDIT: 4,
        STEP_NEW: 5,
      },
      stateform: 1,
      warningModal: false,
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcess"]),
  },
  methods: {
    /*getProcessStepsList: function() {
      if (this.bProcess && this.bProcess.processSteps) {
        return this.bProcess.processSteps.map((step, index) => {
          return {
            id: step.id,
            index: index + 1,
            name: step.name == null ? "" : step.name,
            label: step.label == null ? "" : step.label,
            tool: step.businessService == null ? "" : step.businessService.name,
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
    */
    handleSubmit() {
      this.$store.dispatch("bProcess/update", this.bProcess);
    },
    handleEditStep(step) {
      console.log(step);
      //this.$emit("enableEditStep", step);
    },
    handleNewStep() {
      //this.$emit("enableNewStep");
    },
    handleBack() {
      this.$router.back();
    },
    deleteBProcess() {
      //this.warningModal = false;
    },

    showEditStep(step) {
      this.selectedEditStep = step;
      this.stateform = this.FormState.STEP_EDIT;
    },
    showNewStep() {
      this.selectedEditStep = null;
      this.stateform = this.FormState.STEP_NEW;
    },

    modalOpen(app) {
      this.selectedBProcess = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    },
  },
  created() {
    this.$store.dispatch("bProcess/findById", this.$route.params.id);
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
</style>
