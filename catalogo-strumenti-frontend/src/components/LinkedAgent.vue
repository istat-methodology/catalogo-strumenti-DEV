<template>
  <div>
    <div>
      <label>Referente {{ agentName | dashEmpty }}</label>
    </div>
    <CCardBody>
      <CInput
        label="Organizzazione"
        placeholder="Organizzazione"
        v-model="agentOrganization"
      />
      <CInput label="Ruolo" placeholder="Ruolo" v-model="role" />
      <CInput label="Contatto" placeholder="Contatto" v-model="agentContact" />
      <CInput label="Note" placeholder="Note" v-model="agentNotes" />

      <!-- <v-select
      label="name"
      :options="agentList"
      placeholder="Referenti"
      v-model="value"
      @input="changeAgent"
    ></v-select> -->
    </CCardBody>
  </div>
</template>
<script>
//import { mapGetters } from "vuex";
export default {
  name: "LinkedAgent",
  // mixins: [progressMixin],
  data() {
    return {
      value: null,
      linkedAgentLocal: {}
    };
  },
  props: {
    id: String,
    agentId: String,
    agentName: String,
    agentOrganization: String,
    agentContact: String,
    agentNotes: String,
    role: String,
    notes: String,
    referenceDate: String,
    agentList: []
  }
  /* methods: {
    changeAgent(value) {
      this.linkedAgentLocal.agent.id = value.id;
    }
  } */
  /*  computed: {
    ...mapGetters("agent", ["agentList"])
  }, */
  /*  created() {
    this.$store.dispatch("agent/findAll");
  } */
};
</script>
