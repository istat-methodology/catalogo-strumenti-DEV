<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-8">
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
              return gsbpmProcess.name;
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
      <CCard v-if="tool.gsbpmProcesses">
        <CCardHeader>Processi GSBPM</CCardHeader>
        <CCardBody>
          <CDataTable
            :items="getGsbpmList"
            :fields="fieldsGsbpm"
            :items-per-page="10"
          >
          </CDataTable>
        </CCardBody>
      </CCard>
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
      <CCard v-if="tool.statisticalMethods">
        <CCardHeader>Metodi Statistici</CCardHeader>
        <CCardBody>
          <CDataTable
            :items="tool.statisticalMethods"
            :fields="fields"
            :items-per-page="10"
          >
          </CDataTable>
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
    <div class="col-4">

      <CCard >
        <CCardHeader>Menu List</CCardHeader>
        <CCardBody>
          <!--CDataTable
            :items=""
            :fields=""
            :items-per-page="10"          
          </CDataTable-->
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
    backToList() {
      this.$router.push("/catalogue/tools");
    }
  },
  created() {
    this.$store.dispatch("tools/findById", this.$route.params.id);
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

/* label-after {
  content: ": ";
} */
</style>
