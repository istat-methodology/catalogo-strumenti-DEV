<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-8">
      <div
        @mouseover="setActiveItemList('#id-link-main', true)"
        @mouseleave="setActiveItemList('#id-link-main', false)"
      >
        <CCard v-if="tool" id="id-card-main">
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

      <div
        @mouseover="setActiveItemList('#id-link-tooltype', true)"
        @mouseleave="setActiveItemList('#id-link-tooltype', false)"
      >
        <CCard id="id-card-tooltype">
          <CCardHeader>{{ tool.toolType.name | dashEmpty }}</CCardHeader>
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
      <div id="middle" />
      <div
        @mouseover="setActiveItemList('#id-link-statistical-methods', true)"
        @mouseleave="setActiveItemList('#id-link-statistical-methods', false)"
      >
        <CCard v-if="tool.statisticalMethods" id="id-card-statistical-methods">
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
      </div>
      <div
        @mouseover="setActiveItemList('#id-link-statistical-methods', true)"
        @mouseleave="setActiveItemList('#id-link-statistical-methods', false)"
      >
        <CCard id="id-card-functionalities">
          <CCardHeader>Funzionalità</CCardHeader>
          <div v-if="businessServiceService">
            <label>name</label> <span>{{ businessServiceService.name }}</span>
          </div>

          <CCardBody> </CCardBody>
        </CCard>
      </div>
      <div
        @mouseover="setActiveItemList('#id-link-functionalities', true)"
        @mouseleave="setActiveItemList('#id-link-functionalities', false)"
      >
        <CCard
          class="border-card"
          v-if="tool.documentations"
          id="id-card-documentations"
        >
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
      </div>
      <div
        @mouseover="setActiveItemList('#id-link-agents-tools', true)"
        @mouseleave="setActiveItemList('#id-link-agents-tools', false)"
      >
        <CCard v-if="tool.linkAgentsTools" id="id-card-link-agents-tools">
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
      </div>
    </div>

    <aside class="container-rigth">
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
              href="#"
              class="item-link"
              @mouseover="setActiveCard('#id-card-tooltype', true)"
              @mouseleave="setActiveCard('#id-card-tooltype', false)"
              >{{ tool.toolType.name | dashEmpty }}</a
            >
          </li>
          <li class="list-item" id="id-link-statistical-methods">
            <a
              href="#middle"
              class="item-link"
              @mouseover="setActiveCard('#id-card-statistical-methods', true)"
              @mouseleave="setActiveCard('#id-card-statistical-methods', false)"
              >Metodi Statistici</a
            >
          </li>
          <li class="list-item" id="id-link-functionalities">
            <a
              href="#middle"
              class="item-link"
              @mouseover="setActiveCard('#id-card-functionalities', true)"
              @mouseleave="setActiveCard('#id-card-functionalities', false)"
              >Funzionalità</a
            >
          </li>

          <li class="list-item" id="id-link-documentations">
            <a
              href="#middle"
              class="item-link"
              @mouseover="setActiveCard('#id-card-documentations', true)"
              @mouseleave="setActiveCard('#id-card-documentations', false)"
              >Documentazione</a
            >
          </li>
          <li class="list-item" id="id-link-agents-tools">
            <a
              href="#middle"
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
          _style: "width:20%;"
        },
        {
          key: "description",
          label: "Descrizione",
          _style: "width:20%;"
        },
        {
          key: "notes",
          label: "Note",
          _style: "width:60%;"
        }
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
          _style: "width:20%;"
        },
        {
          key: "agentRole",
          label: "Ruolo",
          _style: "width:20%;"
        },
        {
          key: "agentNotes",
          label: "Note",
          _style: "width:60%;"
        }
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
          _style: "width:20%;"
        },
        {
          key: "code",
          label: "Codice",
          _style: "width:20%;"
        },
        {
          key: "active",
          label: "Attivo",
          _style: "width:20%;"
        }
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
          _style: "width:20%;"
        },
        {
          key: "publisher",
          label: "Editore",
          _style: "width:20%;"
        },
        {
          key: "resource",
          label: "Fonte",
          _style: "width:20%;"
        }
      ]
    };
  },
  computed: {
    ...mapGetters("tools", ["tool"]),

    ...mapGetters("bus inessService", {
      businessServiceService: "businessService"
    }),
    getLinkedAgentList: function() {
      return this.tool.linkAgentsTools.map(agentTool => {
        return {
          id: agentTool.id,

          agentId: agentTool.agent.id,
          agentName: agentTool.agent.name,
          agentOrganization: agentTool.agent.organization,
          agentContact: agentTool.agent.contact,
          agentNotes: agentTool.agent.notes,

          role: agentTool.role,
          notes: agentTool.notes,
          referenceDate: agentTool.referenceDate
        };
      });
    },
    getGsbpmList: function() {
      return this.tool.gsbpmProcesses.map(gsbpm => {
        return {
          // ...gsbpm,
          id: gsbpm.id,
          code: gsbpm.code,
          label: gsbpm.name,
          active: gsbpm.active
        };
      });
    },

    getDocumentationList: function() {
      return this.tool.documentations.map(doc => {
        return {
          id: doc.id,
          name: doc.name,
          publisher: doc.publisher,
          resource: doc.resource
        };
      });
    }
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
    backToList() {
      this.$router.push("/catalogue/tools");
    }
  },
  created() {
    this.$store.dispatch("tools/findById", this.$route.params.id).then(tool => {
      if (tool && tool.businessService)
        this.$store.dispatch(
          "businessService/findById",
          tool.businessService.id
        );
    });
    this.$store.dispatch("coreui/setContext", Context.ToolDetail);
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
  border-left: 2px solid #aebad1;
  list-style: none;
}
.list-item:hover,
.list-item-hover {
  border-left: 2px solid #196fed;
  list-style: none;
}

.item-link {
  display: block;
  padding: 0.5rem 1rem;
  font: var(--type-body-m);
  color: gray;
  font-weight: 600;
  text-decoration: none;
  cursor: pointer;
}

ol,
ul {
  list-style: none;
  padding: 0;
}
ul {
  list-style-type: disc;
}
a {
  text-decoration: none;
  color: gray;
}
.card:hover,
.card-hover {
  position: relative !important;
  display: flex !important;
  flex-direction: column !important;
  min-width: 0 !important;
  margin-bottom: 1.5rem !important;
  word-wrap: break-word !important;
  background-clip: border-box !important;
  border-radius: 0.25rem !important;
  background-color: #fff !important;
  border: 1px solid #196fed !important;
  box-shadow: none !important;
}
.card {
  position: relative !important;
  display: flex !important;
  flex-direction: column !important;
  min-width: 0 !important;
  margin-bottom: 1.5rem !important;
  word-wrap: break-word !important;
  background-clip: border-box !important;
  border-radius: 0.25rem !important;
  background-color: #fff !important;
  border: 1px solid #d8dbe0 !important;
  box-shadow: none !important;
}
</style>
