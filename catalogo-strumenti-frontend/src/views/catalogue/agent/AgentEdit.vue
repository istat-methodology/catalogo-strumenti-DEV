<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="agent">
        <CCardHeader>Modifica Metodo Statistico</CCardHeader>
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
          <CInput label="Note" placeholder="Note" v-model="agentLocal.notes" />
          <CInput
            label="Fonti"
            placeholder="Fonti"
            v-model="agentLocal.resource"
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
          @click.prevent="$router.back()"
          >Indietro</CButton
        >
      </CCardFooter>
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
        notes: ""
      }
    };
  },
  computed: {
    ...mapGetters("agent", ["agent"])
  },

  validations: {
    agentLocal: {
      name: {
        required
      }
    }
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
    }
  },
  created() {
    //this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.$store.dispatch("agent/findById", this.$route.params.id).then(() => {
      this.setOldValues();
    });
  }
};
</script>
