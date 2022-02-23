<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="tool">
        <CCardHeader>{{ tool.name | dashEmpty }}</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome"
            placeholder="Name"
            v-model="statisticalMethodLocal.name"
          />
          <CInput
            label="Descrizione"
            placeholder="Descrizione"
            v-model="statisticalMethodLocal.description"
          />
          <CInput
            label="Requisiti"
            placeholder="Requisiti"
            v-model="statisticalMethodLocal.requirements"
          />
          <CInput
            label="Presupposti"
            placeholder="Presupposti"
            v-model="statisticalMethodLocal.assumptions"
          />
          <CInput
            label="Vincoli"
            placeholder="Vincoli"
            v-model="statisticalMethodLocal.constraints"
          />
          <CInput
            label="Note"
            placeholder="Note"
            v-model="statisticalMethodLocal.notes"
          />
        </CCardBody>
      </CCard>
      <CCardFooter>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          class="mr-2"
          @click.prevent="handleSubmit"
          >Update</CButton
        >
        <CButton
          shape="square"
          size="sm"
          color="light"
          @click.prevent="backToList"
          >Back</CButton
        >
      </CCardFooter>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
/* import { required } from "vuelidate/lib/validators"; */
export default {
  name: "ToolEdit",
  data() {
    return {
      statisticalMethodLocal: {
        id: "",
        name: "",
        description: "",
        requirements: "",
        assumptions: "",
        constraints: "",
        notes: ""
      }
    };
  },
  computed: {
    ...mapGetters("methods", ["statisticalMethod"])
  },

  /* validations: {
    dug: {
      name: {
        required
      }
    }
  }, */
  methods: {
    handleSubmit() {
      /*  this.$v.$touch(); //validate form data
      if (!this.$v.dug.$invalid) { */
      this.$store.dispatch("tools/update", this.toolLocal).then(() => {
        this.backToList();
      });
      /*   } */
    },
    setOldValues() {
      this.statisticalMethodLocal.id = this.statisticalMethod.id;
      this.statisticalMethodLocal.name = this.statisticalMethod.name;
      this.statisticalMethodLocal.description = this.statisticalMethod.description;
      this.statisticalMethodLocal.requirements = this.statisticalMethod.requirements;
      this.statisticalMethodLocal.assumptions = this.statisticalMethod.assumptions;
      this.statisticalMethodLocal.constraints = this.statisticalMethod.constraints;
       this.statisticalMethodLocal.notes = this.statisticalMethod.notes;
    },
    backToList() {
      this.$router.push("/catalogue/methods");
    }
  },
  created() {
    //this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.$store.dispatch("methods/findById", this.$route.params.id).then(() => {
      this.setOldValues();
    });
  }
};
</script>
