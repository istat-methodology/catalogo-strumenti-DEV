<template>
  <div>
    <!-- <div>
      <label>Referente {{ agentName | dashEmpty }}</label>
    </div> -->
    <!-- <CCardBody>
      <CInput
        label="Organizzazione"
        placeholder="Organizzazione"
        v-model="agentOrganization"
      />
      <CInput label="Ruolo" placeholder="Ruolo" v-model="role" />
      <CInput label="Contatto" placeholder="Contatto" v-model="agentContact" />
      <CInput label="Note" placeholder="Note" v-model="agentNotes" />
    </CCardBody> -->
    <CCard>
      <CCardHeader>{{ agentName | dashEmpty }}</CCardHeader>
      <CCardBody>
        <div>
          <label>Organizzazione:</label>
          <span>{{ agentOrganization | dashEmpty }}</span>
        </div>
        <div>
          <label>Ruolo:</label>
          <span>{{ role | dashEmpty }}</span>
        </div>
        <div>
          <label>Contatto:</label>
          <span>{{ agentContact | dashEmpty }}</span>
        </div>
        <div>
          <label>Note:</label>
          <span>{{ agentNotes | dashEmpty }}</span>
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
  name: "LinkedAgent",
  // mixins: [progressMixin],
  data() {
    return {
      /* value: null,
      linkedAgentLocal: {} */
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
