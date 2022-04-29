<template>
  <div class="row" v-if="agentList">
    <CCard>
      <CCardHeader>Referenti associati</CCardHeader>
      <CCardBody>
        <span class="icon-link" @click="viewNewAgent = !viewNewAgent"
          ><plus-icon />Nuova associazione</span
        >
        <div>
          <div v-if="viewNewAgent">
            <div>
              <div class="card">
                <div class="card-header">
                  <div class="form-group" v-if="agentList">
                    <label for="description">Elenco Referenti</label>
                    <v-select
                      label="name"
                      :options="agentList"
                      @input="selectId($event)"
                    ></v-select>
                    <span class="help-block"
                      >Please select an Organization.</span
                    >
                  </div>

                  <span class="icon-link" @click="viewAddAgent = !viewAddAgent"
                    ><add-icon />Nuovo referente</span
                  >
                </div>
                <div class="card-body">
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
                    <textarea
                      label="Note"
                      placeholder="Note"
                      v-model="newLinkedAgent.notes"
                    />
                  </div>
                  <div class="card-slot">
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
              <div v-if="viewAddAgent">
                <app-agent-add
                  :goBackClose="true"
                  @appClose="updateAgentList"
                />
              </div>
            </div>
          </div>
        </div>
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
                      ><edit-icon
                    /></span>
                    <span class="icon-link" @click="modalOpen(linkedAgent)"
                      ><delete-icon
                    /></span>
                  </span>
                  <span v-else>
                    <span
                      class="icon-link"
                      @click="handleUpdateLinkedAgent(index, linkedAgent)"
                      ><success-icon
                    /></span>
                    <span class="icon-link" @click="changeState(index)"
                      ><arrow-right-icon
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
                  <span><strong>Ruolo: </strong></span>

                  <CInput
                    placeholder="Ruolo"
                    :disabled="getState(index)"
                    v-model="linkedAgent.role"
                  />
                </div>

                <div class="card-slot">
                  <span><strong>Data: </strong></span>

                  <CInput
                    placeholder="Data"
                    :disabled="getState(index)"
                    v-model="linkedAgent.referenceDate"
                  />
                </div>

                <div class="card-slot">
                  <span><strong>Note: </strong></span>

                  <textarea
                    placeholder="Note"
                    :disabled="getState(index)"
                    v-model="linkedAgent.notes"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </CCardBody>
    </CCard>
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

export default {
  data() {
    return {
      editState: false,
      viewAddAgent: false,
      viewNewAgent: false,
      selectedId: 0,
      selectedAgent: null,
      selectedLinkedAgent: null,
      states: [],
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
mounted() {
    this.updateLinkedAgentList();
},

  methods: {
    updateAgentList() {
      this.$store.dispatch("agent/findAll");
      this.viewAddAgent = false;
      console.log(this.agentList);
    },
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
        .then(
          this.$store
            .dispatch("linkedagent/findByCatalogTool", this.toolId)
            .then((this.states = Array(this.linkedAgentList.length).fill(true)))
        );
        this.viewNewAgent=false;
    },
    handleUpdateLinkedAgent(index, selectedUpdateLinkedAgent) {
      this.changeState(index);

      let updateLinkedAgent = {
        id: selectedUpdateLinkedAgent.id,
        tool: this.toolId,
        role: selectedUpdateLinkedAgent.agentRole,
        notes: selectedUpdateLinkedAgent.notes,
        referenceDate: selectedUpdateLinkedAgent.referenceDate,
      };

      console.log(updateLinkedAgent);
      this.$store
        .dispatch("linkedagent/update", updateLinkedAgent)
        .then(this.updateLinkedAgentList());
    },
    handleDeleteLinkedAgent() {
      this.$store
        .dispatch("linkedagent/delete", this.selectedLinkedAgent.id)
        .then(this.updateLinkedAgentList());
      this.selectedLinkedAgent = null;
      this.warningModal = false;
    },
    updateLinkedAgentList() {
      this.$store
      .dispatch("linkedagent/findByCatalogTool", this.toolId)
      .then((this.states = Array(this.linkedAgentList.length).fill(true)));
    },

    modalOpen(app) {
      this.selectedLinkedAgent = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    },
  },
  name: "LinkedAgentView",
  props: {
    toolId: {
      type: Number,
      required: true,
      default: () => null,
    },

  },
  created() {
   this.updateLinkedAgentList();
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
  width: 25%;
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
</style>