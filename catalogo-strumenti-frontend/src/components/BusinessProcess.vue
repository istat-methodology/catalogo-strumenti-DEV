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
    <CCard>
      <CCardHeader
        >{{ name | dashEmpty }}
        <CButton
          shape="square"
          size="sm"
          color="light"
          class="s-flex justify-content-end"
          @click.prevent="deleteProcess"
          >Delete</CButton
        >
      </CCardHeader>
      <CCardBody>
        <div>
          <label>Descrizione:</label>
          <span>{{ descr | dashEmpty }}</span>
        </div>
        <div>
          <label>Etichetta:</label>
          <span>{{ label | dashEmpty }}</span>
        </div>
        <div>
          <label>Codice Ordine:</label>
          <span>{{ orderCode | dashEmpty }}</span>
        </div>
      </CCardBody>
      <!--  <CCardFooter> </CCardFooter> -->
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
