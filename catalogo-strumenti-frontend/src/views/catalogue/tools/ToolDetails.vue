<template>
  <!-- wait until service is loaded -->

  <div class="row">
    <div class="col-8">
      <a
        href=""
        @mouseover="setActiveItemList('#id-main', true)"
        @mouseleave="setActiveItemList('#id-main', false)"
      >
        <CCard v-if="tool">
          <CCardHeader>{{ tool.name | dashEmpty }}</CCardHeader>
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
            <!--div>
            <label>Servizio:</label>
            <span>{{ tool.service | dashEmpty }}</span>
          </div-->
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
      </a>

      <a
        href=""
        @mouseover="setActiveItemList('#id-tooltype', true)"
        @mouseleave="setActiveItemList('#id-tooltype', false)"
      >
        <CCard v-if="tool.toolType.id == 3">
          <CCardHeader>{{ tool.toolType.name | dashEmpty }}</CCardHeader>
          <CCardBody>
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
          </CCardBody>
        </CCard>
        <CCard v-if="tool.toolType.id == 2">
          <CCardHeader>{{ tool.toolType.name | dashEmpty }}</CCardHeader>
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
          </CCardBody>
        </CCard>
      
        <CCard v-if="tool.toolType.id == 1">
          <CCardHeader>{{ tool.toolType.name | dashEmpty }}</CCardHeader>
          <CCardBody>
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
          </CCardBody>
        </CCard>
      </a>
      <a
        href=""
        @mouseover="setActiveItemList('#id-statistical-methods', true)"
        @mouseleave="setActiveItemList('#id-statistical-methods', false)"
      >
        <CCard v-if="tool.statisticalMethods">
          <CCardHeader>Metodi Statistici</CCardHeader>
          <CCardBody>
            <CDataTable
              :items="tool.statisticalMethods"
              :fields="fields"
              :items-per-page="10"
              ><template #show_details="{ item }">
                <td>
                  <router-link
                    tag="a"
                    :to="{ name: 'MethodDetails', params: { id: item.id } }"
                  >
                    <view-icon />
                  </router-link>
                </td>
              </template>
            </CDataTable>
          </CCardBody>
        </CCard>
      </a>
      <a
        href=""
        @mouseover="setActiveItemList('#id-documentations', true)"
        @mouseleave="setActiveItemList('#id-documentations', false)"
      >
        <CCard v-if="tool.documentations">
          <CCardHeader>Documentazione</CCardHeader>
          <CCardBody>
            <CDataTable
              :items="getDocumentationList"
              :fields="fieldsDocumentation"
              :items-per-page="10"
            >
            </CDataTable>
          </CCardBody>
        </CCard>
      </a>
      <a
        href=""
        @mouseover="setActiveItemList('#id-link-agents-tools', true)"
        @mouseleave="setActiveItemList('#id-link-agents-tools', false)"
      >
        <CCard v-if="tool.linkAgentsTools">
          <CCardHeader>Referenti</CCardHeader>
          <CCardBody>
            <CDataTable
              :items="getLinkedAgentList"
              :fields="fieldsAgent"
              :items-per-page="10"
            >
            </CDataTable>
          </CCardBody>
        </CCard>
      </a>
    </div>

    <aside class="container-rigth">
      <section class="menu">
        <header><h2 class="menu-heading">Elenco:</h2></header>
        <ul class="menu-list">
          <li class="list-item" id="id-main">
            <a class="item-link" aria-current="true">{{
              tool.name | dashEmpty
            }}</a>
          </li>
          <li class="list-item" id="id-tooltype">
            <a class="item-link"
              >{{ tool.toolType.name | dashEmpty }}, type =
              {{ tool.toolType.id }}</a
            >
          </li>
          <li class="list-item" id="id-statistical-methods">
            <a class="item-link">Metodi Statistici</a>
          </li>

          <li class="list-item" id="id-documentations">
            <a class="item-link">Documentazione</a>
          </li>
          <li class="list-item" id="id-link-agents-tools">
            <a class="item-link">Referenti</a>
          </li>
        </ul>
      </section>
    </aside>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "ToolDetails",
  data() {
    return {
      fields: [
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "name",
          label: "Nome",
          _style: "width:20%;",
        },
        {
          key: "description",
          label: "Descrizione",
          _style: "width:20%;",
        },
        {
          key: "notes",
          label: "Note",
          _style: "width:60%;",
        },
      ],
      fieldsAgent: [
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "agentName",
          label: "Nome",
          _style: "width:20%;",
        },
        {
          key: "agentRole",
          label: "Ruolo",
          _style: "width:20%;",
        },
        {
          key: "agentNotes",
          label: "Note",
          _style: "width:60%;",
        },
      ],
      fieldsGsbpm: [
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
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
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "name",
          label: "Nome",
          _style: "width:20%;",
        },
        {
          key: "publisher",
          label: "Editore",
          _style: "width:20%;",
        },
        {
          key: "resource",
          label: "Fonte",
          _style: "width:20%;",
        },
      ],
    };
  },
  computed: {
    ...mapGetters("tools", ["tool"]),
    getLinkedAgentList: function () {
      return this.tool.linkAgentsTools.map((agentTool) => {
        return {
          id: agentTool.id,

          agentId: agentTool.agent.id,
          agentName: agentTool.agent.name,
          agentOrganization: agentTool.agent.organization,
          agentContact: agentTool.agent.contact,
          agentNotes: agentTool.agent.notes,

          role: agentTool.role,
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
          resource: doc.resource,
        };
      });
    },
  },
  methods: {
    /* handleSubmit() {
      this.$store.dispatch("tools/update", this.tool).then(() => {
        this.backToList();
      });
    }, */
    setActiveItemList(selector, toDo) {
      let element = document.querySelector(selector);
      element.setAttribute(
        "style",
        toDo
          ? "border-left: 2px solid #196fed;"
          : "border-left: 2px solid #aebad1"
      );
    },
    backToList() {
      this.$router.push("/catalogue/tools");
    },
  },
  created() {
    this.$store.dispatch("tools/findById", this.$route.params.id);
    this.$store.dispatch("coreui/setContext", Context.ToolDetail);
  },
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
.container {
  display: flex;
}
.container-rigth {
  position: -webkit-sticky;
  position: sticky;
  top: 110px;
  display: -ms-flexbox;
  display: flex;
  -ms-flex: 0 1 306px;
  flex: 0 1 306px;
  height: 100%;
  margin: 0 80px 0 0;
  font-family: cousine, monospace;
  font-size: 14px;
  line-height: 16px;
}

/******************************/
.menu {
  font-size: 1rem;
  margin-bottom: 2rem;
  padding: 0;
  position: relative;
}
.menu-heading {
  font: var(--type-heading-h6);
  letter-spacing: 1.5px;
  margin: 0 0 1rem;
  text-transform: uppercase;
}
.list-item {
  background-color: var(--category-color-background);

  border-left: 2px solid #aebad1;
  list-style: none;
}
.list-item:hover {
  color: var(--text-primary);
  font-weight: 600;
  border-left: 2px solid #196fed;
  background-color: var(--category-color-background);
}

.item-link {
  display: block;
  padding: 0.5rem 1rem;
  font: var(--type-body-m);
  border-left: 2px solid rgb(235, 235, 235);
  color: var(--text-secondary);
  text-decoration: none;
  cursor: pointer;
}
.item-link:hover {
  color: gray;
}
ol,
ul {
  list-style: none;
  padding: 0;
}
ul {
  list-style-type: disc;
}
</style>
