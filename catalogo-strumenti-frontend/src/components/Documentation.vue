<template>
  <div>
    <div>
      <label>Documento {{ name | dashEmpty }} </label>
    </div>
    <CCardBody>
      <CInput
        label="Pubblicazione"
        placeholder="Pubblicazione"
        v-model="publisher"
      />
      <CInput
        label="Tipo Documento"
        placeholder="Tipo Documento"
        v-model="documentType"
      />
      <CInput label="Fonte" placeholder="Fonte" v-model="resource" />
      <CInput label="Note" placeholder="Note" v-model="notes" />
    </CCardBody>
  </div>
</template>
<script>
//import { mapGetters } from "vuex";
export default {
  name: "Documentation",
  // mixins: [progressMixin],
  data() {
    return {
      value: null,
      linkedAgentLocal: {}
    };
  },
  props: {
    id: String,
    name: String,
    publisher: String,
    resource: String,
    notes: String,
    toolList: []
  }
  /*  methods: {
    changeAgent(value) {
      this.linkedAgentLocal.agent.id = value.id;
    }
  },
  computed: {
    ...mapGetters("agent", ["agentList"])
  },
  created() {
    this.$store.dispatch("agent/findAll");
  } */
};
</script>
