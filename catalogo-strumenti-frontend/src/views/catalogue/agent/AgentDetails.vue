<template>
  <!-- wait until service is loaded -->
  <div class="row" v-if="agent">
    <div class="col-6">
      <CTitle
        :title="agent.name"
        :buttonTitle="agent.name"
        functionality="Dettaglio"
        :authenticated="isAuthenticated"
        :buttons="['modifica', 'indietro']"
        @handleEdit="handleEdit(agent)"
      />
      <div class="row p-3">
        <div class="card col p-4">
          <span><strong>Nome</strong></span>
          <div class="card-slot p-2">
            <span>{{ agent.name | dashEmpty }}</span>
          </div>
        </div>
      </div>

      <div class="row p-3">
        <div class="card col">
          <span><strong>Organizzazione</strong></span>
          <div class="card-slot p-2">
            <span>{{ agent.organization | dashEmpty }}</span>
          </div>
        </div>
        <div class="card col">
          <span><strong>Contatto</strong></span>
          <div class="card-slot p-2">
            <span>{{ agent.contact | dashEmpty }}</span>
          </div>
        </div>
      </div>
      <div class="row p-3">
        <div class="card col">
          <span><strong>Note</strong></span>
          <div class="card-slot p-2">
            <span>{{ agent.notes | dashEmpty }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
//import { Context } from "@/common";
import CTitle from "../../../components/CTitle.vue";

export default {
  name: "AgentDetails",
  components: {
    CTitle,
  },
  computed: {
    ...mapGetters("agent", ["agent"]),
    ...mapGetters("auth", ["isAuthenticated"]),
  },
  methods: {
    backToList() {
      this.$router.push("/catalogue/referenti");
    },
    handleEdit(item) {
      this.$router.push({ name: "AgentEdit", params: { id: item.id } });
    },
  },
  created() {
    this.$store.dispatch("agent/findById", this.$route.params.id);
    //this.$store.dispatch("coreui/setContext", Context.ToolDetail);
  },
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
