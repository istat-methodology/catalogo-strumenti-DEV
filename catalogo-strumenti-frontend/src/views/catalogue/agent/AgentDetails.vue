<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="agent">
        <CCardHeader>{{ agent.name | dashEmpty }}</CCardHeader>
        <CCardBody>
          <div>
            <label>Organizzazione:</label>
            <span>{{ agent.organization | dashEmpty }}</span>
          </div>
          <div>
            <label>Contatto:</label>
            <span>{{ agent.contact | dashEmpty }}</span>
          </div>
          <div>
            <label>Note:</label>
            <span>{{ agent.notes | dashEmpty }}</span>
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
  name: "AgentDetails",
  computed: {
    ...mapGetters("agent", ["agent"])
  },
  methods: {
    backToList() {
      this.$router.push("/catalogue/referenti");
    }
  },
  created() {
    this.$store.dispatch("agent/findById", this.$route.params.id);
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
</style>
