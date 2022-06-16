<template>
  <!-- wait until service is loaded -->
  <div class="row" v-if="tool">
    <div class="col-8">
      <div id="id-main" />
      <div
        @mouseover="setActiveItemList('#id-link-main', true)"
        @mouseleave="setActiveItemList('#id-link-main', false)"
      >
        <div class="p-2">
          <h2 class="pt-4">
            {{ tool.name | dashEmpty
            }}<span class="float-right">
              <router-link
                v-if="isAuthenticated"
                tag="a"
                :to="{
                  name: 'ToolEdit',
                  params: { id: tool.id },
                }"
                class="icon-prop"
              >
                <edit-icon />
              </router-link>
            </span>
          </h2>
          <div class="pl-2">
            <div class="columns">
              <div class="row">
                <div class="description-fields col-12">
                  {{ tool.description | dashEmpty }}
                </div>
                <div class="card col-md-auto p-2">
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
                  <span><strong>Ultima Modifica</strong></span>
                  <div class="card-slot p-2">
                    <span>{{
                      this.formatDate(tool.lastUpdate) | dashEmpty
                    }}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="id-tooltype" />
      <div
        @mouseover="setActiveItemList('#id-link-tooltype', true)"
        @mouseleave="setActiveItemList('#id-link-tooltype', false)"
      >
        <div class="p-2">
          <h2><span>1.</span> {{ tool.toolType.name | dashEmpty }}</h2>
          <div class="pl-2">
            <div v-if="tool.toolType.id == 3">
              <div class="columns">
                <div class="row">
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
                    <span><strong>Prerequisiti</strong></span>
                    <div class="card-slot p-2">
                      <span>{{ tool.technicalRequirements | dashEmpty }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div v-if="tool.toolType.id == 2">
              <div class="columns">
                <div class="row">
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
                    <span><strong>Prerequisiti</strong></span>
                    <div class="card-slot p-2">
                      <span>{{ tool.technicalRequirements | dashEmpty }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div v-if="tool.toolType.id == 1">
              <div class="columns">
                <div class="row">
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
        </div>
      </div>

      <div id="id-statistical-methods" />
      <div
        @mouseover="setActiveItemList('#id-link-statistical-methods', true)"
        @mouseleave="setActiveItemList('#id-link-statistical-methods', false)"
      >
        <div class="p-2">
          <app-methods
            :indexLabel="'2.'"
            :descriptionLabel="'Metodi statistici implementati nello strumento'"
            :statisticalMethods="tool.statisticalMethods"
          ></app-methods>
        </div>
      </div>

      <div id="id-functionalities" />
      <div
        v-if="businessServiceService"
        @mouseover="setActiveItemList('#id-link-functionalities', true)"
        @mouseleave="setActiveItemList('#id-link-functionalities', false)"
      >
        <div class="p-2">
          <app-business-service
            :businessServiceService="businessServiceService"
          ></app-business-service>
        </div>
      </div>

      <div id="id-process" />
      <div
        v-if="bFunctionToolsList"
        @mouseover="setActiveItemList('#id-link-process', true)"
        @mouseleave="setActiveItemList('#id-link-process', false)"
      >
        <div class="p-2">
          <app-business-functions
            :businessFunctions="bFunctionToolsList"
          ></app-business-functions>
        </div>
      </div>

      <div id="id-documentations" />
      <div
        @mouseover="setActiveItemList('#id-link-documentations', true)"
        @mouseleave="setActiveItemList('#id-link-documentations', false)"
      >
        <div class="p-2">
          <app-documentations
            :index="'5.'"
            :documentations="getDocumentationList"
            :descriptionLabel="Documentazione"
          ></app-documentations>
        </div>
      </div>

      <div id="id-link-agents-tools" />
      <div
        @mouseover="setActiveItemList('#id-link-link-agents-tools', true)"
        @mouseleave="setActiveItemList('#id-link-link-agents-tools', false)"
      >
        <div class="p-2">
          <app-linkedAgents
            :linkedAgents="getLinkedAgentList"
          ></app-linkedAgents>
        </div>
      </div>
    </div>

    <aside class="container-rigth col-3">
      <section class="menu">
        <header>
          <h2 class="menu-heading"><b>Contenuto:</b></h2>
        </header>
        <ul class="menu-list">
          <li class="list-item" id="id-link-main">
            <a class="item-link" href="#id-main">{{ tool.name | dashEmpty }}</a>
          </li>
          <li class="list-item" id="id-link-tooltype">
            <a href="#id-tooltype" class="item-link"
              >1. {{ tool.toolType.name | dashEmpty }}</a
            >
          </li>
          <li class="list-item" id="id-link-statistical-methods">
            <a href="#id-statistical-methods" class="item-link"
              >2. Metodi Statistici</a
            >
          </li>
          <li class="list-item" id="id-link-functionalities">
            <a href="#id-functionalities" class="item-link"
              >3. Implementazione</a
            >
          </li>
          <li class="list-item" id="id-link-process">
            <a href="#id-process" class="item-link">4. Processi</a>
          </li>

          <li class="list-item" id="id-link-documentations">
            <a href="#id-documentations" class="item-link">5. Documentazione</a>
          </li>
          <li class="list-item" id="id-link-link-agents-tools">
            <a href="#id-agents-tools" class="item-link">6. Referenti</a>
          </li>
        </ul>
      </section>
    </aside>
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

export default {
  name: "ToolDetails",
  //components: { plusORminus },
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
  components: {
    "app-documentations": DocumentationView,
    "app-methods": StatisticalMethodView,
    "app-linkedAgents": LinkedAgentView,
    "app-business-service": BusinessServiceView,
    "app-business-functions": BusinessFunctionsView,
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