<template>
  <div v-if="agentList">
    <div>
      <label>Referente</label>
    </div>

    <v-select
      label="name"
      :options="agentList"
      placeholder="Referenti"
      v-model="value"
      @input="changeAgent"
    ></v-select>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
export default {
  name: "LinkedAgent",
  // mixins: [progressMixin],
  data() {
    return {
      value: null,
      linkedAgentLocal: {
        id: "",
        agent: {
          id: "",
          name: "",
          organization: "",
          contact: "",
          notes: ""
        },
        role: "",
        notes: "",
        referenceDate: ""
      }
    };
  },
  methods: {
    changeAgent(value) {
      this.linkedAgentLocal.agent.id = value.id;
    }
  },
  computed: {
    ...mapGetters("agent", ["agentList"])
  },
  created() {
    this.$store.dispatch("agent/findAll");
  }
};
</script>
