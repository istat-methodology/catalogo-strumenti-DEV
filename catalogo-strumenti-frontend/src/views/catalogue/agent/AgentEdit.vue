<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div v-if="agent" class="col-12 pt-2">   
      <div class="row">
        <div class="col-md-8">
          <h1 class="pl-2 uppercase">
            <h4>Modifica</h4>
            {{ agent.name | dashEmpty }}
          </h1>
        </div>
      </div>   
      <CCardHeader class="no-border col-8">
        <h2>
          Referente
          <div class="card-header-actions">
            <button
              class="btn btn-outline-primary text-center"
              @click.prevent="handleSubmit"
              title="Aggiorna"
            >
              <floppy-icon title="Aggiorna" />
            </button>
            <button
              class="btn btn-outline-primary text-center"
              @click.prevent="$router.back()"
              title="Indietro"
            >
              <close-icon title="Indietro" />
            </button>
          </div>
        </h2>
      </CCardHeader>
      <CCard class="col-8">
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
export default {
  name: "DocumentationEdit",
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
          this.backToList();
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
    backToList() {
      this.$router.push("/catalogue/referenti");
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
