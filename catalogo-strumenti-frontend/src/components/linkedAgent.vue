<template>
  <CCard v-if="agentList">
    <CCardHeader>Elenco Referenti</CCardHeader>
    <CCardBody>
      <div>
        <div>
          <label>Referente</label>
        </div>

        <v-select
          label="name"
          :options="agentList"
          placeholder="Referenti"
          v-model="value"
          @input="changeTool"
        ></v-select>
      </div>
    </CCardBody>
  </CCard>
</template>
<script>
import { mapGetters } from "vuex";
export default {
  name: "LinkedAgent",
  // mixins: [progressMixin],
  data() {
    return {
      value: null
    };
  },
  methods: {},
  computed: {
    ...mapGetters("agent", ["agentList"])
  },
  created() {
    this.$store.dispatch("agent/findAll");
  }
};
</script>
