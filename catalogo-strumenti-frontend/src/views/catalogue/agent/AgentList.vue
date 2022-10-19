<template>
  <div>
    <CCardHeader class="mt-4 no-border">
      <h2>
        Referenti
        <div class="card-header-actions" v-if="isAuthenticated">
          <router-link tag="a" :to="{ name: 'AgentAdd' }">
            <button
              class="btn btn-outline-primary"
              type="button"
              title="Nuovo referente"
            >
              <add-icon title="Nuovo referente" />
            </button>
          </router-link>
        </div>
      </h2>
    </CCardHeader>
    <CCard>
      <CCardBody>
        <CDataTable
          v-if="agentList"
          :items="computedItems"
          :fields="fields"
          column-filter
          :items-per-page="10"
          sorter
          hover
          pagination
          ><template #show_details="{ item }">
            <td>
              <router-link
                tag="a"
                :to="{
                  name: 'AgentDetails',
                  params: { id: item.id },
                }"
              >
                <view-icon />
              </router-link>
            </td>
            <td v-if="isAuthenticated">
              <router-link
                tag="a"
                :to="{ name: 'AgentEdit', params: { id: item.id } }"
              >
                <edit-icon />
              </router-link>
            </td>
            <td v-if="isAuthenticated">
              <span class="icon-link" @click="modalOpen(item)"
                ><delete-icon
              /></span>
            </td>
          </template>
        </CDataTable>
      </CCardBody>
    </CCard>
    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton shape="square" size="sm" color="primary" @click="deleteAgent">
          Delete
        </CButton>
      </template>
      Elimina referente '{{ selectedAgent.name }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "AgentList",
  data() {
    return {
      fields: [
        {
          key: "name",
          label: "Nome",
          _style: "width:30%;",
        },
        {
          key: "contact",
          label: "Contatto",
          _style: "width:30%;",
        },
        {
          key: "organization",
          label: "Organizzazione",
          _style: "width:60%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      selectedAgent: {},
      warningModal: false,
    };
  },
  computed: {
    ...mapGetters("agent", ["agentList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    computedItems() {
      if (this.agentList) {
        return this.agentList.map((agent) => {
          return {
            id: agent.id,
            name: agent.name == null ? "" : agent.name,
            organization: agent.organization == null ? "" : agent.organization,
            contact: agent.contact == null ? "" : agent.contact,
          };
        });
      } else {
        return [];
      }
    },
  },

  methods: {
    deleteAgent() {
      this.$store.dispatch("agent/delete", this.selectedAgent.id);
      this.warningModal = false;
    },
    modalOpen(app) {
      this.selectedAgent = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    },
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.AgentList);
    // if (this.params) {
    // this.$store.dispatch("tools/filter", this.params);
    this.$store.dispatch("agent/findAll");
    // }
  },
};
</script>
