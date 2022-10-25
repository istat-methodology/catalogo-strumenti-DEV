<template>
  <!-- wait until service is loaded -->
  <div class="row" v-if="statisticalMethod">
    <div class="col-10">
      <div id="id-main" />
      <div
        @mouseover="setActiveItemList('#id-link-main', true)"
        @mouseleave="setActiveItemList('#id-link-main', false)"
      >
        <div class="p-2">
          <CTitle 
            :title="statisticalMethod.name"
            :buttonTitle="statisticalMethod.name"
            functionality="Dettaglio"
            :authenticated="isAuthenticated"
            :buttons="['modifica', 'indietro']"
            @handleEdit="handleEdit(statisticalMethod)"
          />
          <div class="pl-2">
            <div class="columns">
              <div class="row">
                <div class="description-fields col-12">
                  {{ statisticalMethod.description | dashEmpty }}
                </div>

                <div class="card col-md-auto p-2">
                  <span><strong>Fasi GSBPM</strong></span>
                  <div class="card-slot p-2">
                    {{
                      statisticalMethod.gsbpmProcesses
                        .map((gsbpmProcess) => {
                          return gsbpmProcess.code + " " + gsbpmProcess.name;
                        })
                        .join(", ") | dashEmpty
                    }}
                  </div>
                </div>

                <div class="card col-md-auto p-2">
                  <span><strong>Requisiti/Ipotesi</strong></span>
                  <div class="card-slot p-2">
                    <span>{{
                      statisticalMethod.requirements | dashEmpty
                    }}</span>
                  </div>
                </div>

                <!-- <div class="card col-md-auto p-2">
                  <span><strong>Presupposti</strong></span>
                  <div class="card-slot p-2">
                    <span>{{ statisticalMethod.assumption | dashEmpty }}</span>
                  </div>
                </div> -->

                <div class="card col-md-auto p-2">
                  <span><strong>Limitazioni/Vincoli</strong></span>
                  <div class="card-slot p-2">
                    <span>{{ statisticalMethod.constraints | dashEmpty }}</span>
                  </div>
                </div>

                <div class="card col-md-auto p-2">
                  <span><strong>Versione</strong></span>
                  <div class="card-slot p-2">
                    <span>{{ statisticalMethod.version | dashEmpty }}</span>
                  </div>
                </div>

                <div class="card col-md-auto p-2">
                  <span><strong>Data di Pubblicazione</strong></span>
                  <div class="card-slot p-2">
                    <span>{{
                      this.formatDate(statisticalMethod.releaseDate) | dashEmpty
                    }}</span>
                  </div>
                </div>
                <div class="card col-md-auto p-2">
                  <span><strong>Tags</strong></span>
                  <div class="card-slot p-2">
                    <span>{{ statisticalMethod.tags | dashEmpty }}</span>
                  </div>
                </div>

                <div class="card col-md-auto p-2">
                  <span><strong>Note</strong></span>
                  <div class="card-slot p-2">
                    <span>{{ statisticalMethod.notes | dashEmpty }}</span>
                  </div>
                </div>
                <div class="card col-md-auto p-2">
                  <span><strong>Standard Istat</strong></span>
                  <div class="card-slot p-2">
                    <span v-if="statisticalMethod.standardIstat && statisticalMethod.standardIstat==1">Sì</span>
                     <span v-else>No</span>
                  </div>
                </div>
                <div class="card col-md-auto p-2">
                  <span><strong>Ultima Modifica</strong></span>
                  <div class="card-slot p-2">
                    <span>{{
                      this.formatDate(statisticalMethod.lastUpdate) | dashEmpty
                    }}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="id-tools" />
      <div
        @mouseover="setActiveItemList('#id-link-tools', true)"
        @mouseleave="setActiveItemList('#id-link-tools', false)"
      >
        <div class="p-2">
          <app-tools-function
            :index="'1.'"
            :descriptionLabel="'Elenco degli strumenti che implementano il metodo'"
            :tools="statisticalMethod.catalogTools"
          ></app-tools-function>
        </div>
      </div>

      <div id="id-documentations" />
      <div
        @mouseover="setActiveItemList('#id-link-documentations', true)"
        @mouseleave="setActiveItemList('#id-link-documentations', false)"
      >
        <div class="p-2">
          <app-documentations
            :index="'2.'"
            :descriptionLabel="'Elenco della documentazione relativa al metodo'"
            :documentations="getDocumentationList()"
          ></app-documentations>
        </div>
      </div>
    </div>
    <!--aside class="container-rigth col-3">
      <section class="menu">
        <header>
          <h2 class="menu-heading"><b>Contenuto:</b></h2>
        </header>
        <ul class="menu-list">
          <li class="list-item" id="id-link-main">
            <a class="item-link" href="#id-main">{{ statisticalMethod.name | dashEmpty
            }}</a>
          </li>
          <li class="list-item" id="id-link-tools">
            <a href="#id-tools" class="item-link">1. Strumenti metodologici</a>
          </li>
          <li class="list-item" id="id-link-documentations">
            <a href="#id-documentations" class="item-link">2. Documentazione</a>
          </li>
        </ul>
      </section>
    </aside-->
  </div>
</template>
<script>
import ToolsView from "../tools/shared/ToolsView";
import DocumentationView from "../documentation/shared/DocumentationView";
import { mapGetters } from "vuex";
import CTitle from "../../../components/CTitle.vue";
//import { Context } from "@/common";
export default {
  name: "MethodsDetails",
  components: {
    "app-documentations": DocumentationView,
    "app-tools-function": ToolsView,
    CTitle
  },
  computed: {
    ...mapGetters("methods", ["statisticalMethod"]),
    ...mapGetters("auth", ["isAuthenticated"])
  },
  methods: {
    backToList() {
      this.$router.push("/catalogue/metodi");
    },

    getDocumentationList: function () {
      if(this.statisticalMethod.documentations)
      return this.statisticalMethod.documentations.map((doc) => {
        return {
          id: doc.id,
          name: doc.name,
          publisher: doc.publisher,
          documentType: doc.documentType.name,
          resource: doc.resource,
        };
      });
      else return [];
    },
    formatDate(dt) {
      dt = new Date(dt);
      return dt.toLocaleDateString("it");
    },
    setActiveItemList(selector, bool) {
      document.querySelector(selector).className = bool
        ? "list-item-hover"
        : "list-item";
    },
    setActiveIndex(index) {
      this.activeIndex !== index
        ? (this.activeIndex = index)
        : (this.activeIndex = -1);
    },
    handleEdit(item) {      
      this.$router.push({ name: 'MethodEdit', params: { id: item.id } });
    }
  },
  created() {
    this.$store.dispatch("methods/findById", this.$route.params.id);
    //this.$store.dispatch("coreui/setContext", Context.ToolDetail);
  },
};
</script>

<style scoped>
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