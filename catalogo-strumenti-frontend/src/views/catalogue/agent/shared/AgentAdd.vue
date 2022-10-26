<template>
  <!-- wait until service is loaded -->
  <div>
    <CCardHeader class="col-12 no-border p-0 pr-1">
      <h2 class="text-info">
        Nuovo Referente
        <div class="card-header-actions">
          <button
            class="btn btn-outline-info"
            @click.prevent="handleSubmit"
            title="Salva"
          >
            <floppy-icon title="Salva" />
          </button>
          <button
            class="btn btn-outline-info"
            @click.prevent="goBack(false)"
            title="Chiudi"
          >
            <close-icon title="Chiudi" />
          </button>
        </div>
      </h2>
    </CCardHeader>

    <CCard class="col-12">
      <CCardBody>
        <CInput
          label="Nome"
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
        <CTextarea label="Note" placeholder="Note" v-model="agentLocal.notes" />
      </CCardBody>
    </CCard>
  </div>
</template>
<script>
import { required } from "vuelidate/lib/validators";
//import { mapGetters } from "vuex";
export default {
  name: "AgentAdd",
  data() {
    return {
      agentLocal: {
        id: 0,
        name: "",
        organization: "",
        contact: "",
        notes: "",
      },
    };
  },
  emits: ["appClose"],
  props: {
    goBackClose: {
      type: Boolean,
      required: false,
      default: () => false,
    },
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
      this.$v.$touch(); //validate form data
      if (!this.$v.agentLocal.$invalid) {
        this.$store
          .dispatch("agent/save", this.agentLocal)
          .then(this.$store.dispatch("agent/findAll"))
          .then(this.goBack(true));
      }
    },
    goBack(saved) {
      if (this.goBackClose) this.$emit("appClose", saved);
      else this.$router.push("/catalogue/referenti");
    },
    onChange(event) {
      this.tipologia = event.target.value;
    },
  },
  created() {
    this.$store.dispatch("agent/findAll");
  },
};
</script>

