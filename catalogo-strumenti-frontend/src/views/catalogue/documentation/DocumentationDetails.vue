<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <CCard v-if="documentation" c>
      <CCardHeader>{{ documentation.name | dashEmpty }}</CCardHeader>
      <CCardBody>
        <div>
          <label>Editore:</label>
          <span>{{ documentation.publisher | dashEmpty }}</span>
        </div>
        <div>
          <label>Documento:</label>
          <span>{{ documentation.documentType.name | dashEmpty }}</span>
        </div>
        <div>
          <label>Note:</label>
          <span>{{ documentation.notes | dashEmpty }}</span>
        </div>
        <div>
          <label>Requisiti:</label>
          <span>{{ documentation.resource | dashEmpty }}</span>
        </div>

        <div>
          <label>Strumento:</label>
          <span >{{ documentation.tool.name | dashEmpty }}</span>
          <router-link
            tag="a" class="float-right"
            :to="{ name: 'ToolDetails', params: { id: documentation.tool.id } }"
          >
            <view-icon />
          </router-link>
        </div>
      </CCardBody>
      <CCardFooter>
        <CButton
          shape="square"
          size="sm"
          color="light"
          @click.prevent="backToList"
          >Indietro</CButton
        >
      </CCardFooter>
    </CCard>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
//import { Context } from "@/common";
export default {
  name: "DocumentationDetails",
  computed: {
    ...mapGetters("documentation", ["documentation"])
  },
  methods: {
    backToList() {
      this.$router.push("/catalogue/documentazione");
    }
  },
  created() {
    this.$store.dispatch("documentation/findById", this.$route.params.id);
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
