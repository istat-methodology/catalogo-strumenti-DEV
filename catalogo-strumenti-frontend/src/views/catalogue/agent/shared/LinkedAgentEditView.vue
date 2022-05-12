<template>
  <div class="row" v-if="agentList">
    <div>
      <CCardHeader
        ><i>{{ this.toolName | dashEmpty }}</i> > Referenti
      </CCardHeader>
      <div class="card-header">
        <span v-if="stateform == FormState.LIST">
          Elenco referenti associati
          <div class="card-header-actions">
            <span
              class="icon-link"
              @click="stateform = FormState.NEW"
              title="Aggiungi una nuova associazione"
            >
              <add-box-icon /> Nuova Associazione
            </span>
          </div>
        </span>
        <span v-if="stateform == FormState.EDIT">
          <p class="card-text">Elenco referenti associati:</p></span
        >
        <span v-if="stateform == FormState.NEW">
          <p class="card-text">Nuova associazione:</p></span
        >
        <span v-if="stateform == FormState.NEW_AGENT">
          <p class="card-text">Nuovo referente:</p></span
        >
      </div>
      <div class="card" v-if="stateform == FormState.NEW_AGENT">
        <div class="card-body">
          <div>
            <app-agent-add :goBackClose="true" @appClose="updateAgentList" />
          </div>
           </div>  </div>

      <div v-if="stateform == FormState.NEW">
      
          <div   class="card">
            <div class="card-slot" v-if="agentList">
              <label>Elenco Referenti</label>
              <v-select
                label="name"
                :options="agentList"
                @input="selectId($event)"
              ></v-select>
              <span class="help-block">Please select a referent.</span>
              <span
                class="icon-link float-right"
                
                   @click="stateform = FormState.NEW_AGENT"
                ><add-icon />Nuovo referente</span
              >
            </div>
            <div class="card-slot">
              <CInput
                label="Ruolo"
                placeholder="Ruolo"
                v-model="newLinkedAgent.role"
              />
            </div>
            <div class="card-slot">
              <CInput
                label="Data"
                placeholder="Data"
                v-model="newLinkedAgent.referenceDate"
              />
            </div>
            <div class="card-slot">
              <CTextarea
                label="Note"
                placeholder="Note"
                v-model="newLinkedAgent.notes"
              />
            </div>
            <div class="card-footer">
              <CButton
                shape="square"
                size="sm"
                color="primary"
                class="mr-2"
                @click.prevent="handleSubmitNewAgent"
                >Salva</CButton
              >
            </div>
          </div>
        </div>
      
      <div v-if="stateform == FormState.LIST">
        <div class="columns">
          <div class="row">
            <div
              class="card"
              v-for="(linkedAgent, index) of getLinkedAgentList"
              :key="linkedAgent.id"
            >
              <div class="card-header">
                <strong>{{ linkedAgent.agentName }}</strong>
                <div class="card-header-actions">
                  <span v-if="getState(index)">
                    <span class="icon-link" @click="changeState(index)"
                      ><edit-icon title="Edit" /></span
                    >&nbsp;
                    <span class="icon-link" @click="modalOpen(linkedAgent)"
                      ><delete-icon title="Cancella"
                    /></span>
                  </span>
                  <span v-else>
                    <span
                      class="icon-link"
                      @click="handleUpdateLinkedAgent(index, linkedAgent)"
                      ><floppy-icon title="Salva" /></span
                    >&nbsp;
                    <span class="icon-link" @click="changeState(index)"
                      ><close-circle-icon title="Chiudi"
                    /></span>
                  </span>
                </div>
              </div>
              <div class="card-body">
                <div class="card-slot">
                  <span><strong>Contatto: </strong></span>
                  <span>{{ linkedAgent.agentContact }}</span>
                </div>
                <div class="card-slot">
                  <span><strong>Organizzazione: </strong></span>
                  <span>{{ linkedAgent.agentOrganization }}</span>
                </div>
                <div class="card-slot">
                  <CInput
                    label="Ruolo:"
                    placeholder="Ruolo"
                    :disabled="getState(index)"
                    v-model="linkedAgent.role"
                  />
                </div>

                <div class="card-slot">
                  <CInput
                    label="Data:"
                    placeholder="Data"
                    :disabled="getState(index)"
                    v-model="linkedAgent.referenceDate"
                  />
                </div>

                <div class="card-slot">
                  <CTextarea
                    label="Note:"
                    placeholder="Note"
                    :disabled="getState(index)"
                    v-model="linkedAgent.notes"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <CModal
      title="Warning!"
      :show.sync="warningModal"
      v-if="selectedLinkedAgent"
    >
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="handleDeleteLinkedAgent"
        >
          Delete
        </CButton>
      </template>
      Elimina referente '{{ selectedLinkedAgent.agentName }}'?
    </CModal>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import AgentAdd from "./AgentAdd.vue";
import _ from "lodash";
export default {
  data() {
    return {
      editState: false,
      selectedId: 0,
      selectedAgent: null,
      selectedLinkedAgent: {},
      states: [],
      FormState: {
        LIST: 0,
        EDIT: 1,
        NEW: 2,
        NEW_AGENT: 3,
      },
      stateform: 0,
      warningModal: false,
      newLinkedAgent: {
        id: 0,
        agent: null,
        tool: this.toolId,
        role: "",
        notes: "",
        referenceDate: "",
      },
    };
  },
  emits: ["refreshTool"],
  computed: {
    ...mapGetters("agent", ["agentList"]),
    ...mapGetters("linkedagent", ["linkedAgentList"]),

    getLinkedAgentList: function () {
      if (this.linkedAgentList)
        return this.linkedAgentList.map((agentTool) => {
          return {
            id: agentTool.id,
            tooId: this.toolId,
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
      else return [];
    },
  },
  components: {
    "app-agent-add": AgentAdd,
  },
  methods: {
    updateAgentList: _.debounce(function () {
      this.$store.dispatch("agent/findAll");
      this.stateform = this.FormState.LIST;
    }, 500),
    selectId(e) {
      this.selectedId = e.id;
    },
    getState(idx) {
      return this.states[idx];
    },
    changeState(idx) {
      this.$set(this.states, idx, !this.states[idx]);
    },
    handleSubmitNewAgent() {
      this.newLinkedAgent.agent = this.selectedId;

      this.$store
        .dispatch("linkedagent/save", this.newLinkedAgent)
        .then(this.loadLinkedAgentList());
          this.stateform = this.FormState.LIST;
    },
    handleUpdateLinkedAgent(index, selectedUpdateLinkedAgent) {
      this.changeState(index);

      let updateLinkedAgent = {
        id: selectedUpdateLinkedAgent.id,
        tool: this.toolId,
        role: selectedUpdateLinkedAgent.role,
        notes: selectedUpdateLinkedAgent.notes,
        referenceDate: selectedUpdateLinkedAgent.referenceDate,
      };

      this.$store
        .dispatch("linkedagent/update", updateLinkedAgent)
        .then(this.loadLinkedAgentList());
    },
    handleDeleteLinkedAgent() {
      this.$store
        .dispatch("linkedagent/delete", this.selectedLinkedAgent.id)
        .then(this.loadLinkedAgentList());
      this.selectedLinkedAgent = null;
      this.warningModal = false;
    },

    loadLinkedAgentList() {
      this.loadDebounceLinkedAgentList(
        this.$store,
        this.toolId,
        this.states,
        this.linkedAgentList.length
      );
      /*   this.$store
        .dispatch("linkedagent/findByCatalogTool", this.toolId)
        .then((this.states = Array(this.linkedAgentList.length).fill(true)));*/
    },
    loadDebounceLinkedAgentList: _.debounce((store, toolId, states, len) => {
      store
        .dispatch("linkedagent/findByCatalogTool", toolId)
        .then((states = Array(len).fill(true)));
    }, 500),

    modalOpen(app) {
      this.selectedLinkedAgent = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    },
  },

  name: "LinkedAgentEditView",
  props: {
    toolId: {
      type: Number,
      required: true,
      default: () => null,
    },
    toolName: {
      type: String,
      required: true,
      default: null,
    },
  },
  created() {
    this.loadLinkedAgentList();
  },
};
</script>

<style scoped>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 50%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding in columns */
.row {
  margin: 0 -5px;
}

/* Clear floats after the columns */
.row:after {
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
h2 {
  font-size: 24px;
  color: #213547;
  margin-top: 10px !important;
  transition: color 0.5s;
  padding-top: 26px;
}
</style>