<template>
  <div class="row">
    <div class="col-12" v-if="isLoading">
      <tile></tile>
    </div>
    <div class="col-12" v-else>
      <div class="card fade-in">
        <header class="card-header">
          Elenco Servizi Statistici
          <div class="card-header-actions">
            <router-link tag="a" :to="{ name: 'StatServiceAdd' }">
              <add-icon />
            </router-link>
          </div>
        </header>
        <CCardBody>
          <CDataTable
            :items="computedItems"
            :fields="fields"
            :items-per-page="10"
            sorter
            hover
            pagination
          >
            <template #show_update="{item}">
              <td>
                <router-link
                  tag="a"
                  :to="{
                    name: 'StatServiceEdit',
                    params: { id: item.id }
                  }"
                >
                  <edit-icon />
                </router-link>
              </td>
            </template>
            <template #show_delete="{item}">
              <td>
                <span class="icon-link" @click="modalOpen(item)"
                  ><delete-icon
                /></span>
              </td>
            </template>
          </CDataTable>
        </CCardBody>
      </div>
    </div>
    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="deleteStatService"
        >
          Delete
        </CButton>
      </template>
      Elimina Servizio Statistico '{{ selectedStatService.dipendenze }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "StatServiceList",
  data() {
    return {
      warningModal: false,
      selectedStatService: {},
      fields: [
        {
          key: "metodiEsposti",
          label: "Metodi Esposti",
          _style: "width:10%;"
        },
        {
          key: "dipendenze",
          label: "Dipendenze",
          _style: "width:10%;"
        },
        {
          key: "protocollo",
          label: "Protocollo",
          _style: "width:10%;"
        },
        {
          key: "nomeTool",
          label: "Strumento Metodologico",
          _style: "width:10%;"
        },
        {
          key: "show_update",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        },
        {
          key: "show_delete",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ]
    };
  },
  computed: {
    ...mapGetters("coreui", ["isLoading"]),
    ...mapGetters("services", ["services"]),
    computedItems() {
      return this.services.map(item => {
        return {
          ...item,
          nomeTool: item.tool.nome
        };
      });
    }
  },
  methods: {
    deleteStatService() {
      this.$store.dispatch("services/delete", this.selectedStatService.id);
      this.warningModal = false;
    },
    modalOpen(statservice) {
      this.selectedStatService = statservice;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    }
  },
  created() {
    this.$store.dispatch("services/findAll");
    this.$store.dispatch("coreui/setContext", Context.StatServiceList);
  }
};
</script>
