<template>
  <div>
    <CTitle
      title="Referenti"
      buttonTitle=" Referente"
      functionality="Elenco"
      :authenticated="isAuthenticated"
      :buttons="['nuovo']"
      @handleNew="handleNew"
    />
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
            <CTableLink
              :authenticated="isAuthenticated"
              @handleView="handleView(item)"
              @handleEdit="handleEdit(item)"
              @handleDelete="handleOpenModalDelete(item)"
            />
          </template>
        </CDataTable>
      </CCardBody>
    </CCard>
    <CModalDelete
      :message="getMessage()"
      :showModal="showModal"
      @closeModal="closeModal"
      @handleDelete="handleDelete"
    />
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
import CTitle from "../../../components/CTitle.vue";
import CModalDelete from "../../../components/CModalDelete.vue";
import CTableLink from "../../../components/CTableLink.vue";
export default {
  name: "AgentList",
  components: { CTitle, CModalDelete, CTableLink },
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
      showModal: false,
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
    handleNew() {
      this.$router.push({ name: "AgentAdd" });
    },
    handleView(item) {
      this.$router.push({
        name: "AgentDetails",
        params: { id: item.id },
      });
    },
    handleEdit(item) {
      this.$router.push({ name: "AgentEdit", params: { id: item.id } });
    },

    handleDelete() {
      this.$store.dispatch("agent/delete", this.selectedAgent.id);
      this.showModal = false;
    },
    handleOpenModalDelete(app) {
      this.selectedAgent = app;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il referente " +
        this.selectedAgent.name +
        " selezionato?"
      );
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
