<template>
  <div>
    <!-- <div>
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
    </CCardBody> -->
    <h2>{{ name | dashEmpty }}</h2>
    <CCard>
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
          <label>Fonte:</label>
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
    </CCard>
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
