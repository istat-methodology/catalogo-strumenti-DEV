<template>
  <!-- wait until service is loaded -->
  <div class="row" v-if="agent">
    <div class="col-12">
      <h2 class="pt-4">
        {{ agent.name | dashEmpty
        }}<span class="float-right">
          <router-link v-if="isAuthenticated"
            tag="a"
            :to="{
              name: 'AgentEdit',
              params: { id: agent.id }
            }"
            class="icon-prop"
          >
            <edit-icon />
          </router-link>
        </span>
      </h2>
      <div class="row" >
        <div class="card col-md-auto p-2">
          <span><strong>Nome</strong></span>
          <div class="card-slot  p-2">
            <span>{{ agent.name | dashEmpty }}</span>
          </div>
        </div>
        <div class="card col-md-auto p-2">
          <span><strong>Organizzazione</strong></span>
          <div class="card-slot  p-2">
            <span>{{ agent.organization | dashEmpty }}</span>
          </div>
        </div>

        <div class="card col-md-auto p-2">
          <span><strong>Contatto</strong></span>
          <div class="card-slot  p-2">
            <span>{{ agent.contact | dashEmpty }}</span>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="card col-md-auto p-2">
          <span><strong>Note</strong></span>
          <div class="card-slot  p-2">
            <span>{{ agent.notes | dashEmpty }}</span>
          </div>
        </div>
      </div>

      <!-- <CButton
        shape="square"
        size="sm"
        color="light"
        @click.prevent="$router.back()"
        >Indietro</CButton
      > -->
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
