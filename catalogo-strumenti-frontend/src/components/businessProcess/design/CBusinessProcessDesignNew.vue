<template>
  <div>
    <CTitle
      :title="
        'Process Step ' +
          pProcessStep.name +
          ' (' +
          pProcessStep.id +
          ') / ' +
          'Process Design (...)'
      "
      buttonTitle=" process design "
      functionality="nuovo process design"
      :authenticated="isAuthenticated"
      :buttons="['salva', 'indietro']"
      @handleSubmit="handleSubmit"
      @handleBack="handleBack"
    />
    <CCard>
      <CCardBody>
        <div class="col-12">
          <div class="row mt-1">
            <Label>Process Design</Label>
          </div>
          <div class="row">
            <CInput
              disabled
              class="col-2"
              label="id"
              placeholder="id"
              v-model="lProcessDesign.id"
            />
            <CInput
              class="col-10"
              label="Description"
              placeholder="Description"
              v-model="lProcessDesign.descr"
            />
          </div>
        </div>
      </CCardBody>
    </CCard>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "CBusinessProcessDesignNew",
  components: {
    CTitle
  },
  data() {
    return {
      lProcessDesign: {},
      processDesignToSave: {
        id: 0,
        descr: "",
        step: ""
      }
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"])
  },
  props: {
    pProcessStep: {
      type: Object,
      required: true,
      default: () => {}
    },
    pProcessDesign: {
      type: Object,
      required: true,
      default: () => {}
    }
  },
  methods: {
    handleSubmit() {
      this.processDesignToSave.descr = this.lProcessDesign.descr;
      this.processDesignToSave.step = this.pProcessStep.id;
      this.$store.dispatch("processDesign/save", this.processDesignToSave);
      this.handleBack();
    },
    handleBack() {
      this.$emit("enableBack");
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
