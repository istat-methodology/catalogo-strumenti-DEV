<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="statisticalMethod">
        <CCardHeader>{{ statisticalMethod.name | dashEmpty }}</CCardHeader>
        <CCardBody>
          <div>
            <label>Descrizione:</label>
            <span>{{ statisticalMethod.description | dashEmpty }}</span>
          </div>
          <div>
            <label>Requisiti:</label>
            <span>{{ statisticalMethod.requirements | dashEmpty }}</span>
          </div>
          <div>
            <label>Presupposti:</label>
            <span>{{ statisticalMethod.assumption | dashEmpty }}</span>
          </div>
          <!--div>
            <label>Servizio:</label>
            <span>{{ tool.service | dashEmpty }}</span>
          </div-->
          <div>
            <label>Vincoli:</label>
            <span>{{ statisticalMethod.constraints | dashEmpty }}</span>
          </div>
          <div>
            <label>Note:</label>
            <span>{{ statisticalMethod.notes | dashEmpty }}</span>
          </div>
        </CCardBody>
        <CCardFooter>
          <CButton
            shape="square"
            size="sm"
            color="light"
            @click.prevent="backToList"
            >Back</CButton
          >
        </CCardFooter>
      </CCard>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
//import { Context } from "@/common";
export default {
  name: "ToolDetails",
  computed: {
    ...mapGetters("methods", ["statisticalMethod"])
  },
  methods: {
    /* handleSubmit() {
      this.$store.dispatch("tools/update", this.tool).then(() => {
        this.backToList();
      });
    }, */
    backToList() {
      this.$router.push("/catalogue/metodi");
    }
  },
  created() {
    this.$store.dispatch("methods/findById", this.$route.params.id);
    //this.$store.dispatch("coreui/setContext", Context.ToolDetail);
  }
};
</script>
<style scoped>
.card-header {
  font-weight: 600;
}
label {
  font-weight: bold;
  display: inline;
  padding: 15px;
}

/* label-after {
  content: ": ";
} */
</style>
