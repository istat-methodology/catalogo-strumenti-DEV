<template>
  <div>
    
    <li>
      {{ name | dashEmpty }}
    </li>
    <ul id="example-1">
      <li v-for="item in processSteps" :key="item.message">
        {{ item.name }}
      </li>
    </ul>
  </div>
</template>
<script>
//import { mapGetters } from "vuex";
export default {
  name: "CBusinessProcess",
  // mixins: [progressMixin],
  data() {
    return {
      /* value: null,
      businessProcessLocal: {} */
    };
  },
  props: {
    id: String,
    name: String,
    descr: String,
    label: String,
    orderCode: String,
    parent: String,
    processSteps: []
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
