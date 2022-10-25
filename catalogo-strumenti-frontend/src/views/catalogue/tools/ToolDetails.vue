<template>
  <!-- wait until service is loaded -->
  <div class="row" v-if="tool">
    <div class="col-10">
      <CTitle
        :title="tool.name"
        :buttonTitle="tool.name"
        functionality="Dettaglio"
        :authenticated="isAuthenticated"
        :buttons="['modifica', 'indietro']"
        @handleEdit="handleEdit(tool)"
      />
      <div>
        <div class="columns">
          <div class="row">
            <div class="description-fields col-12">
              {{ tool.description | dashEmpty }}
            </div>
          </div>
          <div class="row p-3">
            <div class="card col-md-auto">
              <span><strong>Fasi GSBPM</strong></span>
              <div class="card-slot p-2">
                {{
                  tool.gsbpmProcesses
                    .map((gsbpmProcess) => {
                      return gsbpmProcess.code + " " + gsbpmProcess.name;
                    })
                    .join(", ") | dashEmpty
                }}
              </div>
            </div>
            <div class="card col-md-auto p-2">
              <span><strong>Versione</strong></span>
              <div class="card-slot p-2">
                <span>{{ tool.version | dashEmpty }}</span>
              </div>
            </div>
            <div class="card col-md-5 p-2">
              <span><strong>Tags</strong></span>
              <div class="card-slot p-2">
                <span>{{ tool.tags | dashEmpty }}</span>
              </div>
            </div>
            <div class="card col-md-auto p-2">
              <span><strong>Data di rilascio</strong></span>
              <div class="card-slot p-2">
                <span>{{ this.formatDate(tool.releaseDate) | dashEmpty }}</span>
              </div>
            </div>
            <div class="card col-md-auto p-2">
              <span><strong>Ultima Modifica</strong></span>
              <div class="card-slot p-2">
                <span>{{ this.formatDate(tool.lastUpdate) | dashEmpty }}</span>
              </div>
            </div>
            <div class="card col-md-auto p-2">
              <span><strong>Standard Istat</strong></span>
              <div class="card-slot p-2">
                <span v-if="tool.standardIstat && tool.standardIstat == 1"
                  >Sì</span
                >
                <span v-else>No</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div>
        <div class="row p-3">
          <h2><span>1.</span> {{ tool.toolType.name | dashEmpty }}</h2>
        </div>

        <div v-if="tool.toolType.id == 3">
          <div class="columns">
            <div class="row p-3">
              <div class="card col-md-auto p-2">
                <span><strong>Codice</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.code | dashEmpty }}</span>
                </div>
              </div>

              <div class="card col-md-auto p-2">
                <span><strong>Download</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.download | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Flusso di lavoro</strong></span>

                <div class="card-slot p-2">
                  <span>{{ tool.workflow | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Linguaggio</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.language | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Dipendenze</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.dependencies | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Requisiti tecnici</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.technicalRequirements | dashEmpty }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div v-if="tool.toolType.id == 2">
          <div class="columns">
            <div class="row p-3">
              <div class="card col-md-auto p-2">
                <span><strong>Download</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.download | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>licenza</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.licence | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Linguaggio</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.language | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Pacchetto</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.packageApplication | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Sistema Operativo</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.operativeSystem | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Versione</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.version | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Requisiti tecnici</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.technicalRequirements | dashEmpty }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div v-if="tool.toolType.id == 1">
          <div class="columns">
            <div class="row p-3">
              <div class="card col-md-auto p-2">
                <span><strong>Protocollo</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.protocol | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Url</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.url | dashEmpty }}</span>
                </div>
              </div>

              <div class="card col-md-auto p-2">
                <span><strong>Dipendenze</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.serviceDependencies | dashEmpty }}</span>
                </div>
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Restrizioni</strong></span>
                <div class="card-slot p-2">
                  <span>{{ tool.restrictions | dashEmpty }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="p-2">
        <app-methods
          :indexLabel="'2.'"
          :descriptionLabel="'Metodi statistici implementati nello strumento'"
          :statisticalMethods="tool.statisticalMethods"
        />
      </div>
      <div v-if="businessServiceService" class="p-2">
        <app-business-service
          :businessServiceService="businessServiceService"
        />
      </div>
      <div v-if="bFunctionToolsList" class="p-2">
        <app-business-functions :businessFunctions="bFunctionToolsList" />
      </div>
      <div class="p-2">
        <app-documentations
          :index="'5.'"
          :documentations="getDocumentationList"
          :descriptionLabel="'Documentazione'"
        />
      </div>
      <div class="p-2">
        <app-linkedAgents :linkedAgents="getLinkedAgentList" />
      </div>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import StatisticalMethodView from "../statisticalMethods/shared/StatisticalMethodView";
import BusinessFunctionsView from "../businessFunctions/shared/BusinessFunctionsView";
import DocumentationView from "../documentation/shared/DocumentationView";
import LinkedAgentView from "../agent/shared/LinkedAgentView";
import BusinessServiceView from "./shared/BusinessServiceView";
import { mapGetters } from "vuex";
import { Context } from "@/common";
import CTitle from "../../../components/CTitle.vue";

export default {
  name: "ToolDetails",
  components: {
    "app-documentations": DocumentationView,
    "app-methods": StatisticalMethodView,
    "app-linkedAgents": LinkedAgentView,
    "app-business-service": BusinessServiceView,
    "app-business-functions": BusinessFunctionsView,
    CTitle,
  },
  data() {
    return {
      index: 1,
      subIndex: 0,

      activeIndex: -1,
      fields: [
        {
          key: "name",
          label: "Nome",
          _style: "width:80%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      fieldsAgent: [
        {
          key: "agentName",
          label: "Nome",
          _style: "width:60%;",
        },
        {
          key: "agentRole",
          label: "Ruolo",
          _style: "width:39%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      fieldsGsbpm: [
        {
          key: "label",
          label: "Nome",
          _style: "width:20%;",
        },
        {
          key: "code",
          label: "Codice",
          _style: "width:20%;",
        },
        {
          key: "active",
          label: "Attivo",
          _style: "width:20%;",
        },
      ],
      fieldsDocumentation: [
        {
          key: "name",
          label: "Nome",
          _style: "width:90%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      fieldsFunctions: [
        {
          key: "name",
          label: "name",
        },
        {
          key: "descr",
          label: "descr",
        },
        {
          key: "processDesigns",
          label: "processDesigns",
        },
        {
          key: "stepInstances",
          label: "stepInstances",
        },
        {
          key: "substep",
          label: "substep",
        },
      ],
      processDesigns: [
        {
          key: "id",
          label: "id",
        },
        {
          key: "name",
          label: "name",
        },
        {
          key: "descr",
          label: "descr",
        },
        {
          key: "step",
          label: "step",
        },
        {
          key: "designType",
          label: "designType",
        },
        {
          key: "informationObject",
          label: "informationObject",
        },
      ],
      designType: [
        {
          key: "id",
          label: "id",
        },
        {
          key: "type",
          label: "type",
        },
      ],
      informationObject: [
        {
          key: "businessService",
          label: "businessService",
        },
        {
          key: "csmAppRoleId",
          label: "csmAppRoleId",
        },
        {
          key: "name",
          label: "name",
        },
        {
          key: "descr",
          label: "descr",
        },
        {
          key: "processDesign",
          label: "processDesign",
        },
      ],
    };
  },
  computed: {
    ...mapGetters("tools", ["tool"]),
    ...mapGetters("businessService", {
      businessServiceService: "businessService",
    }),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bFunction", ["bFunctionToolsList"]),
    getLinkedAgentList: function () {
      return this.tool.linkAgentsTools.map((agentTool) => {
        return {
          id: agentTool.id,
          agentId: agentTool.agent.id,
          agentName: agentTool.agent.name,
          agentOrganization: agentTool.agent.organization,
          agentContact: agentTool.agent.contact,
          agentNotes: agentTool.agent.notes,
          agentRole: agentTool.role,
          notes: agentTool.notes,
          referenceDate: agentTool.referenceDate,
        };
      });
    },
    getGsbpmList: function () {
      return this.tool.gsbpmProcesses.map((gsbpm) => {
        return {
          // ...gsbpm,
          id: gsbpm.id,
          code: gsbpm.code,
          label: gsbpm.name,
          active: gsbpm.active,
        };
      });
    },

    getDocumentationList: function () {
      return this.tool.documentations.map((doc) => {
        return {
          id: doc.id,
          name: doc.name,
          publisher: doc.publisher,
          documentType: doc.documentType.name,
          resource: doc.resource,
        };
      });
    },
    isActiveIndex() {
      return this.activeIndex;
    },
  },
  methods: {
    /* handleSubmit() {
      this.$store.dispatch("tools/update", this.tool).then(() => {
        this.backToList();
      });
    }, */
    setActiveItemList(selector, bool) {
      document.querySelector(selector).className = bool
        ? "list-item-hover"
        : "list-item";
    },
    setActiveCard(selector, bool) {
      document.querySelector(selector).className = bool ? "card-hover" : "card";
    },
    setActiveIndex(index) {
      this.activeIndex !== index
        ? (this.activeIndex = index)
        : (this.activeIndex = -1);
    },
    backToList() {
      this.$router.push("/catalogue/tools");
    },
    formatDate(dt) {
      dt = new Date(dt);
      return dt.toLocaleDateString("it");
    },
    handleEdit(item) {
      //router.push({ name: 'user', params: { username } })
      this.$router.push({ name: "ToolEdit", params: { id: item.id } });
    },
  },
  created() {
    this.$store
      .dispatch("tools/findById", this.$route.params.id)
      .then((tool) => {
        if (tool && tool.businessService) {
          this.$store.dispatch(
            "businessService/findById",
            tool.businessService.id
          );
          this.$store.dispatch(
            "bFunction/findBFunctionsByBService",
            tool.businessService.id
          );
        }
      });
    this.$store.dispatch("coreui/setContext", Context.ToolDetail);
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
