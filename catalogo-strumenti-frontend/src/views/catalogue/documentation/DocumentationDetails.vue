<template>
  <!-- wait until service is loaded -->
  <div class="row" v-if="documentation">
    <div class="col-8">
      <CTitle
        :title="documentation.name"
        :buttonTitle="documentation.name"
        functionality="Dettaglio"
        :authenticated="isAuthenticated"
        :buttons="['modifica', 'indietro']"
        @handleEdit="handleEdit(documentation)"
        @handleBack="handleBack" />
      <div class="row">
        <div class="col-12">
          <div class="card col-md-auto p-4">
            <span><strong>Editore</strong></span>
            <div class="card-slot">
              <span>{{ documentation.publisher | dashEmpty }}</span>
            </div>
          </div>
          <div class="card col-md-auto p-4">
            <span><strong>Tipo Documento</strong></span>

            <div class="card-slot">
              <span>{{ documentation.documentType.name | dashEmpty }}</span>
            </div>
          </div>
          <div class="card col-md-auto p-4">
            <span><strong>Riferimenti</strong></span>
            <div class="card-slot">
              <span>{{ documentation.resource | dashEmpty }}</span>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12 pb-5">
          <div class="card col-md-auto p-4">
            <span><strong>Note</strong></span>
            <div class="card-slot">
              <span>{{ documentation.notes | dashEmpty }}</span>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12 pb-5">
          <CToolsView
            indexLabel=""
            descriptionLabel="Strumenti metodologici associati al documento"
            :tools="toolsByDocumentation" />
        </div>
      </div>
      <div class="row">
        <div class="col-12 pb-5">
          <CStatisticalMethodView
            indexLabel=""
            descriptionLabel="Metodi statistici associati al documento"
            :statisticalMethods="methodsByDocumentation" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
// import { required } from "vuelidate/lib/validators";
//import Documentation from "../documentation/shared/Documentation";
import CToolsView from "@/components/tools/CToolsView.vue"
import CStatisticalMethodView from "@/components/statisticalMethod/CStatisticalMethodView.vue"

import { mapGetters } from "vuex"
//import { Context } from "@/common";
import CTitle from "@/components/CTitle.vue"

export default {
  name: "DocumentationDetails",
  components: {
    // "app-documentation": Documentation,
    CToolsView,
    CStatisticalMethodView,
    CTitle
  },
  data() {
    return {
      activeIndex: -1
    }
  },
  computed: {
    ...mapGetters("documentation", ["documentation"]),
    ...mapGetters("tools", ["toolsByDocumentation"]),
    ...mapGetters("methods", ["methodsByDocumentation"]),
    ...mapGetters("auth", ["isAuthenticated"])
  },

  methods: {
    setActiveItemList(selector, bool) {
      document.querySelector(selector).className = bool
        ? "list-item-hover"
        : "list-item"
    },
    setActiveCard(selector, bool) {
      document.querySelector(selector).className = bool ? "card-hover" : "card"
    },
    setActiveIndex(index) {
      this.activeIndex !== index
        ? (this.activeIndex = index)
        : (this.activeIndex = -1)
    },

    handleEdit(item) {
      this.$router.push({ name: "DocumentationEdit", params: { id: item.id } })
    },
    handleBack() {
      //this.$router.push("/catalogue/referenti");
      this.$router.back()
    }
  },
  created() {
    this.$store
      .dispatch("documentation/findById", this.$route.params.id)
      .then(() => {
        this.$store.dispatch(
          "tools/findToolsByDocumentation",
          this.documentation.id
        )
        this.$store.dispatch(
          "methods/findMethodsByDocumentation",
          this.documentation.id
        )
      })
  }
}
</script>
<style>
.icon-prop {
  display: inline;
  padding-left: 6px;
}

.list-group-item {
  border: none !important;
}
* Clear floats after the columns */ .row:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* this adds the "card" effect */
  padding: 12px;
  text-align: left;
  background-color: #f1f1f1;
  margin-left: 5px;
}

/* Responsive columns - one column layout (vertical) on small screens */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}
fieldset.scheduler-border {
  border: 1px solid #ddd !important;
  padding: 0 1.4em 1.4em 1.4em !important;
  margin: 0 0 1.5em 0 !important;
}
legend.scheduler-border {
  width: inherit; /* Or auto */
  padding: 0 10px; /* To give a bit of padding on the left and right */
  border-bottom: none;
}
.max-col {
  max-width: 5%;
}
</style>
