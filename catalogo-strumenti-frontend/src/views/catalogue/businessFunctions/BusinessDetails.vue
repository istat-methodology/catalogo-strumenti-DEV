<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="tool">
        <CCardHeader>{{ tool.name | dashEmpty }}</CCardHeader>
        <CCardBody>
          <div>
            <label>Descrizione:</label>
            <span>{{ tool.descr | dashEmpty }}</span>
          </div>
          <div>
            <label>Etichetta:</label>
            <span>{{ tool.label | dashEmpty }}</span>
          </div>
          <div>
            <label>Active:</label>
            <span>{{ tool.active | dashEmpty }}</span>
          </div>
          <div>
            <label>Fasi GSBPM:</label>
            <span>{{ tool.gsbpmProcesses
            .map(gsbpmProcess => {
              return gsbpmProcess.name;
            })
            .join(", "), | dashEmpty }}</span>
          </div>
        </CCardBody>
      </CCard>
      <!-- <CCard v-if="tool.documentations">
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
      </CCard> -->
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
