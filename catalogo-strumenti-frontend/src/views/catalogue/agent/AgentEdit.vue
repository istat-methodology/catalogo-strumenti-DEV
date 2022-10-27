<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div v-if="agent" class="col-12 pt-2">
      <div class="col-8 p-0">
        <CTitle
          :maintitle="agent.name"
          title="Referente"
          buttonTitle=" Referente"
          functionality="Modifica"
          :authenticated="isAuthenticated"
          :buttons="['salva', 'indietro']"
          @handleSubmit="handleSubmit"
          @handleBack="handleBack"
        />
      </div>
      <CCard class="col-8 pl-2 pr-2">
        <CCardBody>
          <CInput
            label="Nome*"
            placeholder="Nome"
            v-model="agentLocal.name"
            :class="{ 'is-invalid': $v.agentLocal.name.$error }"
          />
          <div class="help-block" :class="{ show: $v.agentLocal.name.$error }">
            Campo obbligatorio
          </div>
          <CInput
            label="Organizzazione"
            placeholder="Organizzazione"
            v-model="agentLocal.organization"
          />
          <CInput
            label="Contatto"
            placeholder="Contatto"
            v-model="agentLocal.contact"
          />
          <CTextarea
            label="Note"
            placeholder="Note"
            v-model="agentLocal.notes"
          />
        </CCardBody>
      </CCard>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import { required } from "vuelidate/lib/validators";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "AgentEdit",
  components: { CTitle },
  data() {
    return {
      agentLocal: {
        id: "",
        name: "",
        organization: "",
        contact: "",
        notes: "",
      },
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("agent", ["agent"]),
  },

  validations: {
    agentLocal: {
      name: {
        required,
      },
    },
  },
  methods: {
    handleSubmit() {
      this.$v.$touch();
      if (!this.$v.agentLocal.$invalid) {
        this.$store.dispatch("agent/update", this.agentLocal).then(() => {
          this.handleback();
        });
      }
    },
    setOldValues() {
      this.agentLocal.id = this.agent.id;
      this.agentLocal.name = this.agent.name;
      this.agentLocal.organization = this.agent.organization;
      this.agentLocal.contact = this.agent.contact;
      this.agentLocal.notes = this.agent.notes;
    },
    handleback() {
      this.$router.push({ name: "AgentList" });
    },
  },
  created() {
    //this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.$store.dispatch("agent/findById", this.$route.params.id).then(() => {
      this.setOldValues();
    });
  },
};
</script>
