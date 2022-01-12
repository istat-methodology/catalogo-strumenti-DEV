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
            <span>{{ tool.version | dashEmpty }}</span>
          </div>
          <div>
            <label>Tags:</label>
            <span>{{ tool.tags | dashEmpty }}</span>
          </div>
          <div>
            <label>Servizio:</label>
            <span>{{ tool.service | dashEmpty }}</span>
          </div>
          <div>
            <label>Ultima Modifica:</label>
            <span>{{ tool.lastUpdate | dashEmpty }}</span>
          </div>
          <div>
            <label>Requisiti:</label>
            <span>{{ tool.requirements | dashEmpty }}</span>
          </div>
          <div>
            <label>Tipo:</label>
            <span>{{ tool.toolType.name | dashEmpty }}</span>
          </div>
        </CCardBody>
      </CCard>
      <CCard v-if="tool.toolType.id == 2">
        <CCardHeader>Altri dettagli</CCardHeader>
        <CCardBody>
          <div>
            <label>Download:</label>
            <span>{{ tool.download | dashEmpty }}</span>
          </div>
          <div>
            <label>licenza:</label>
            <span>{{ tool.licence | dashEmpty }}</span>
          </div>
          <div>
            <label>Linguaggio:</label>
            <span>{{ tool.language | dashEmpty }}</span>
          </div>
          <div>
            <label>Pacchetto:</label>
            <span>{{ tool.pacchetto | dashEmpty }}</span>
          </div>
          <div>
            <label>Sistema Operativo:</label>
            <span>{{ tool.operativeSystem | dashEmpty }}</span>
          </div>
          <div>
            <label>Prerequisiti:</label>
            <span>{{ tool.technicalRequirements | dashEmpty }}</span>
          </div>
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
      <CCard v-if="tool.toolType.id == 1">
        <CCardHeader>Altri dettagli</CCardHeader>
        <CCardBody>
          <div>
            <label>Download:</label>
            <span>{{ tool.protocol | dashEmpty }}</span>
          </div>
          <div>
            <label>Url:</label>
            <span>{{ tool.url | dashEmpty }}</span>
          </div>
          <div>
            <label>Contributi:</label>
            <span>{{ tool.outcomes | dashEmpty }}</span>
          </div>
          <div>
            <label>Dipendenze:</label>
            <span>{{ tool.serviceDependencies | dashEmpty }}</span>
          </div>
          <div>
            <label>Restrizioni:</label>
            <span>{{ tool.restrictions | dashEmpty }}</span>
          </div>
          <div>
            <label>Classificazione Gsbpm:</label>
            <span>{{ tool.gsbpm | dashEmpty }}</span>
          </div>
          <div>
            <label>Funzione operativa:</label>
            <span>{{ tool.businessFunction | dashEmpty }}</span>
          </div>
          <div>
            <label>Design di processo:</label>
            <span>{{ tool.processDesign | dashEmpty }}</span>
          </div>
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
