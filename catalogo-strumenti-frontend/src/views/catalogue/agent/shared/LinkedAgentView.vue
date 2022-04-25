<template>
  <CCard>
    <CCardHeader>Referenti</CCardHeader>
    <CCardBody>
      {{ agentList }}
      <div class="row">
    
        <div v-if="!viewAddAgent">
          <div class="form-group" v-if="agentList">
            <label for="description">Referente*</label>
            <v-select
              label="name"
              :options="agentList"
              v-model="selectedAgent"
              @input="newAgent"
            ></v-select>
            <span class="help-block">Please select an Organization.</span>
          </div>

          <span class="icon-link" @click="viewAddAgent = true"
            ><add-icon
          /></span>
          <div class="card-slot">
            <CInput
              label="Ruolo"
              placeholder="Ruolo"
              v-model="newAgent.agentRole"
            />
          </div>

          <div class="card-slot">
            <CInput
              label="Organizzazione"
              placeholder="Organizzazione"
              v-model="newAgent.agentOrganization"
            />
          </div>
          <div class="card-slot">
            <CInput
              label="Data"
              placeholder="Data"
              v-model="newAgent.referenceDate"
            />
          </div>

          <div class="card-slot">
            <textarea
              label="Note"
              placeholder="Note"
              v-model="newAgent.notes"
            />
          </div>
          <div class="card-slot">
            <CButton
              shape="square"
              size="sm"
              color="primary"
              class="mr-2"
              @click.prevent="handleSubmit"
              >Salva</CButton
            >
          </div>
        </div>

        <div v-else>
          <app-agent-add :goBackClose="true" @appClose="updateAgentList" />
        </div>
      </div>
      <div class="columns">
        <div class="row">
          <div
            class="card col-4"
            v-for="(linkedAgent, index) of linkedAgents"
            :key="linkedAgent.id"
          >
            <div class="card-header">
              <strong>{{ linkedAgent.agentName }}</strong>
              <div class="card-header-actions">
                <router-link
                  tag="a"
                  :to="{
                    name: 'AgentDetails',
                    params: { id: linkedAgent.agentId },
                  }"
                >
                  <view-icon />
                </router-link>
                <span v-if="editPage">
                  <span
                    class="icon-link"
                    @click="changeState(index)"
                    v-if="getState(index)"
                    ><edit-icon
                  /></span>
                  <span class="icon-link" @click="changeState(index)" v-else
                    ><add-box-icon
                  /></span>
                  <span class="icon-link" @click="modalOpen(item)"
                    ><delete-icon
                  /></span>
                </span>
              </div>
            </div>
            <div class="card-body">
              <div class="card-slot">
                <span><strong>Contatto: </strong></span>
                <span v-if="!editPage">{{ linkedAgent.agentContact }}</span>
                <CInput
                  v-else
                  placeholder="Contatto"
                  :disabled="getState(index)"
                  v-model="linkedAgent.agentContact"
                />
              </div>
              <div class="card-slot">
                <span><strong>Ruolo: </strong></span>
                <span v-if="!editPage">{{ linkedAgent.agentRole }}</span>
                <CInput
                  v-else
                  placeholder="Ruolo"
                  :disabled="getState(index)"
                  v-model="linkedAgent.agentRole"
                />
              </div>

              <div class="card-slot">
                <span><strong>Organizzazione: </strong></span>
                <span v-if="!editPage">{{
                  linkedAgent.agentOrganization
                }}</span>
                <CInput
                  v-else
                  placeholder="Organizzazione"
                  :disabled="getState(index)"
                  v-model="linkedAgent.agentOrganization"
                />
              </div>
              <div class="card-slot">
                <span><strong>Data: </strong></span>
                <span v-if="!editPage">{{ linkedAgent.referenceDate }}</span>
                <CInput
                  v-else
                  placeholder="Data"
                  :disabled="getState(index)"
                  v-model="linkedAgent.referenceDate"
                />
              </div>

              <div class="card-slot">
                <span><strong>Note: </strong></span>
                <span v-if="!editPage">{{ linkedAgent.notes }}</span>
                <textarea
                  v-else
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
</template>
<script>
import { mapGetters } from "vuex";
import AgentAdd from "./AgentAdd.vue";

export default {
  data() {
    return {
      editState: false,
      viewAddAgent: false,

      selectedAgent: null,
      states: Array(this.linkedAgents.length).fill(false),
    };
  },
  computed: {
    ...mapGetters("agent", ["agentList"]),
  },
  components: {
    "app-agent-add": AgentAdd,
  },

  methods: {
    updateAgentList() {
      this.$store.dispatch("agent/findAll");
      this.viewAddAgent = false;
      console.log(this.agentList);
    },

    setIsEdit(value) {
      this.editState = value;
    },
    isEdit() {
      return this.editPage && this.editState;
    },
    getState(idx) {
      return this.states[idx];
    },
    changeState(idx) {
      this.$set(this.states, idx, !this.states[idx]);
    },
    newAgent() {
      let newLinkedAgent = {
        id: 0,
        agentId: this.selectedAgent.id,
        agentName: this.selectedAgent.name,
        toolId: this.toolId,
        role: "",
        notes: "",
        referenceDate: "",
      };
      console.log(this.newLinkedAgent);
      this.linkedAgents.push(newLinkedAgent);
    },
  },
  name: "LinkedAgentView",
  props: {
    toolId: {
      type: Number,
      required: true,
      default: () => null,
    },
    linkedAgents: {
      type: Array,
      required: true,
      default: () => [],
    },

    editPage: {
      type: Boolean,
      required: false,
      default: () => false,
    },
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