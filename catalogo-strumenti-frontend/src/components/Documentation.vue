<template>
  <div>

    <div class="card w-100">
            <CCardHeader>{{ name | dashEmpty }}</CCardHeader>
      <CCardBody>
        <div>
          <label>Pubblicazione:</label>
          <span>{{ publisher | dashEmpty }}</span>
        </div>
        <div>
          <label>Tipo Documento:</label>
          <span>{{ documentType | dashEmpty }}</span>
        </div>
        <div>
          <label>Riferimenti:</label>
          <span>{{ resource | dashEmpty }}</span>
        </div>
        <div>
          <label>Note:</label>
          <span>{{ notes | dashEmpty }}</span>
        </div>
      </CCardBody>
      <CCardFooter>
        <CButton
          shape="square"
          size="sm"
          color="light"
          @click.prevent="deleteAgent"
          >Delete</CButton
        >
      </CCardFooter>
    </div>
  </div>
</template>
<script>
//import { mapGetters } from "vuex";
export default {
  name: "Documentation",
  // mixins: [progressMixin],
  data() {
    return {
      /* value: null,
      documentationLocal: {} */
    };
  },
  props: {
    id: String,
    name: String,
    publisher: String,
    resource: String,
    notes: String,
    documentType: String,
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
