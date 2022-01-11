<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Strumento Metodologico</CCardHeader>
        <CCardBody v-if="tool">
          <div>
            <label>Nome:</label>
            <span>{{ tool.name | dashEmpty }}</span>
          </div>
          <div>
            <label>Descrizione:</label>
            <span>{{ tool.description | dashEmpty }}</span>
          </div>
          <div>
            <label>Versione:</label>
            ><span>{{ tool.version | dashEmpty }}</span>
          </div>
          <div>
            <label>Tags:</label>
            <span>{{ tool.tags | dashEmpty }}</span>
          </div>
          <!-- <div>
            <label>Note di Compilazione:</label>
            <span>{{ tool.note | dashEmpty }}</span>
          </div>
          <div>
            <label>Standard:</label>
            <span>{{ tool.standard | dashEmpty }}</span>
          </div>
          <div>
            <label>Tipologia:</label>
            <span>{{ tool.tipologia | dashEmpty }}</span>
          </div>
          <div>
            <label>Riferimenti:</label>
            <span>{{ tool.riferimenti | dashEmpty }}</span>
          </div> -->
        </CCardBody>
        <CCardFooter>
          <CButton
            shape="square"
            size="sm"
            color="light"
            @click.prevent="backToList"
            >Back</CButton
          >
        </CCardFooter>
      </CCard>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
export default {
  name: "ToolDetails",
  data() {
    return { count: 0 };
  },
  computed: {
    ...mapGetters("tools", ["tool"])
  },
  methods: {
    /* handleSubmit() {
      this.$store.dispatch("tools/update", this.tool).then(() => {
        this.backToList();
      });
    }, */
    backToList() {
      this.$router.push("/catalogue/tools");
    }
  },
  created() {
    this.$store.dispatch("tools/findById", this.$route.params.id);
  }
};
</script>
<style scoped>
.card-header {
  font-weight: 600;
}
label {
  font-weight: bold;
  display: inline;
  padding: 15px;
}

/* label-after {
  content: ": ";
} */
</style>
