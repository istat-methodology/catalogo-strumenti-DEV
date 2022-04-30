<template>
  <!-- wait until service is loaded -->
  <div>
    <div class="columns">
      <CInput label="Nome" placeholder="Nome" v-model="agentLocal.name" />
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

      <div class="card-footer">
        <CButton
          shape="square"
          size="sm"
          color="primary"
          class="mr-2"
          @click.prevent="handleSubmit"
          >Aggiungi</CButton
        >
        <CButton shape="square" size="sm" color="light" @click.prevent="goBack"
          >Indietro</CButton
        >
      </div>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
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

  methods: {
    handleSubmit() {
      this.$store
        .dispatch("agent/save", this.agentLocal)
        .then(this.$store.dispatch("agent/findAll"))
        .then(this.goBack());
      /*   } */
    },
    goBack() {
      if (this.goBackClose) this.$emit("appClose", true);
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


