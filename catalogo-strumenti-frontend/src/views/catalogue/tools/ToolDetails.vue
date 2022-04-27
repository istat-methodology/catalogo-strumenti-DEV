<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-9">
      <div id="id-tooltype" />
      <div
        @mouseover="setActiveItemList('#id-link-main', true)"
        @mouseleave="setActiveItemList('#id-link-main', false)"
      >
        <div>
          <h2 id="id-main">
            {{ tool.name | dashEmpty
            }}<span>
              <router-link
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
        </div>

        <CCard v-if="tool" id="id-card-main">
          <CCardBody>
            <div>
              <label>Descrizione:</label>
              <span>{{ tool.description | dashEmpty }}</span>
            </div>
            <div>
              <label>Fasi GSBPM:</label>
              <span>{{ tool.gsbpmProcesses
            .map(gsbpmProcess => {
              return gsbpmProcess.code + " " + gsbpmProcess.name ;

            })
            .join(", "), | dashEmpty }}</span>
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
              <label>Ultima Modifica:</label>
              <span>{{ tool.lastUpdate | dashEmpty }}</span>
            </div>
            <div>
              <label>Requisiti:</label>
              <span>{{ tool.requirements | dashEmpty }}</span>
            </div>
          </CCardBody>
        </CCard>
      </div>
      <div id="id-statistical-methods" />
      <div
        @mouseover="setActiveItemList('#id-link-tooltype', true)"
        @mouseleave="setActiveItemList('#id-link-tooltype', false)"
      >
        <h2>{{ tool.toolType.name | dashEmpty }}</h2>
        <CCard id="id-card-tooltype">
          <CCardBody>
            <div v-if="tool.toolType.id == 3">
              <div>
                <label>Codice:</label>
                <span>{{ tool.code | dashEmpty }}</span>
              </div>
              <div>
                <label>Download:</label>
                <span>{{ tool.download | dashEmpty }}</span>
              </div>
              <div>
                <label>Flusso di lavoro:</label>
                <span>{{ tool.workflow | dashEmpty }}</span>
              </div>
              <div>
                <label>Linguaggio:</label>
                <span>{{ tool.language | dashEmpty }}</span>
              </div>
              <div>
                <label>Dipendenze:</label>
                <span>{{ tool.ependencies | dashEmpty }}</span>
              </div>
              <div>
                <label>Prerequisiti:</label>
                <span>{{ tool.technicalRequirements | dashEmpty }}</span>
              </div>
            </div>
            <div v-if="tool.toolType.id == 2">
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
                <span>{{ tool.packageApplication | dashEmpty }}</span>
              </div>
              <div>
                <label>Sistema Operativo:</label>
                <span>{{ tool.operativeSystem | dashEmpty }}</span>
              </div>
              <div>
                <label>Versione:</label>
                <span>{{ tool.version | dashEmpty }}</span>
              </div>
              <div>
                <label>Prerequisiti:</label>
                <span>{{ tool.technicalRequirements | dashEmpty }}</span>
              </div>
            </div>
            <div v-if="tool.toolType.id == 1">
              <div>
                <label>Protocollo:</label>
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
                <label>Funzione operativa:</label>
                <span>{{ tool.businessFunction | dashEmpty }}</span>
              </div>
            </div>
          </CCardBody>
        </CCard>
      </div>

      <div id="id-functionalities" />
      <div
        @mouseover="setActiveItemList('#id-link-statistical-methods', true)"
        @mouseleave="setActiveItemList('#id-link-statistical-methods', false)"
      >
        <app-methods
          :statisticalMethods="tool.statisticalMethods"
        ></app-methods>
      </div>

      <!-- functionalities  -->
      <div
        v-if="businessServiceService.processSteps"
        @mouseover="setActiveItemList('#id-link-functionalities', true)"
        @mouseleave="setActiveItemList('#id-link-functionalities', false)"
      >
        <app-business-service
          :businessServiceService="businessServiceService"
        ></app-business-service>

      </div>

      <!--  process  -->
      <div
        v-if="businessServiceService.processSteps"
        @mouseover="setActiveItemList('#id-link-process', true)"
        @mouseleave="setActiveItemList('#id-link-process', false)"
      >
        <app-business-functions
          :businessFunctions="bFunctionsList"
        ></app-business-functions>
      </div>

      <!-- 
        
        documentations

      -->
      <div
        @mouseover="setActiveItemList('#id-link-documentations', true)"
        @mouseleave="setActiveItemList('#id-link-documentations', false)"
      >
        <app-documentations
          :documentations="getDocumentationList"
        ></app-documentations>
      </div>
      <div
        @mouseover="setActiveItemList('#id-link-link-agents-tools', true)"
        @mouseleave="setActiveItemList('#id-link-link-agents-tools', false)"
      >
        <app-linkedAgents :linkedAgents="getLinkedAgentList"></app-linkedAgents>
      </div>
    </div>

    <aside class="container-rigth col-2">
      <section class="menu">
        <header><h2 class="menu-heading">Contenuto:</h2></header>
        <ul class="menu-list">
          <li class="list-item" id="id-link-main">
            <a
              class="item-link"
              href="#"
              @mouseover="setActiveCard('#id-card-main', true)"
              @mouseleave="setActiveCard('#id-card-main', false)"
              >{{ tool.name | dashEmpty }}</a
            >
          </li>
          <li class="list-item" id="id-link-tooltype">
            <a
              href="#id-tooltype"
              class="item-link"
              @mouseover="setActiveCard('#id-card-tooltype', true)"
              @mouseleave="setActiveCard('#id-card-tooltype', false)"
              >{{ tool.toolType.name | dashEmpty }}</a
            >
          </li>
          <li class="list-item" id="id-link-statistical-methods">
            <a
              href="#id-statistical-methods"
              class="item-link"
              @mouseover="setActiveCard('#id-card-statistical-methods', true)"
              @mouseleave="setActiveCard('#id-card-statistical-methods', false)"
              >Metodi Statistici</a
            >
          </li>
          <li class="list-item" id="id-link-functionalities">
            <a
              href="#id-functionalities"
              class="item-link"
              @mouseover="setActiveCard('#id-card-functionalities', true)"
              @mouseleave="setActiveCard('#id-card-functionalities', false)"
              >Funzionalità</a
            >
          </li>
          <li class="list-item" id="id-link-process">
            <a
              href="#id-process"
              class="item-link"
              @mouseover="setActiveCard('#id-card-process', true)"
              @mouseleave="setActiveCard('#id-card-process', false)"
              >Processi</a
            >
          </li>

          <li class="list-item" id="id-link-documentations">
            <a
              href="#id-documentations"
              class="item-link"
              @mouseover="setActiveCard('#id-card-documentations', true)"
              @mouseleave="setActiveCard('#id-card-documentations', false)"
              >Documentazione</a
            >
          </li>
          <li class="list-item" id="id-link-link-agents-tools">
            <a
              href="#id-link-agents-tools"
              class="item-link"
              @mouseover="setActiveCard('#id-card-link-agents-tools', true)"
              @mouseleave="setActiveCard('#id-card-link-agents-tools', false)"
              >Referenti</a
            >
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
//import plusORminus from "@/components/plusORminus";

export default {
  name: "ToolDetails",
  //components: { plusORminus },
  data() {
    return {
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
    ...mapGetters("business", ["bFunctionsList"]),
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
            "business/findBFunctionsByBService",
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
  padding-left:6px;
}
</style>

