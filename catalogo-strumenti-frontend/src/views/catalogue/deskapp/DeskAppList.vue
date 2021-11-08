<template>
  <div class="row">
    <div class="col-12" v-if="isLoading">
      <tile></tile>
    </div>
    <div class="col-12" v-else>
      <div class="card fade-in">
        <header class="card-header">
          Desktop Application List
          <div class="card-header-actions">
            <router-link tag="a" :to="{ name: 'DeskAppAdd' }">
              <add-icon />
            </router-link>
          </div>
        </header>
        <CCardBody>
          <CDataTable
            :items="applications"
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
                    name: 'DeskAppEdit',
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
          @click="deleteDeskApp"
        >
          Delete
        </CButton>
      </template>
      Delete Desktop Application '{{ selectedDeskApp.dipendenze }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "DeskAppList",
  data() {
    return {
      warningModal: false,
      selectedDeskApp: {},
      fields: [
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "dipendenze",
          label: "Dipendenze",
          _style: "width:10%;"
        },
        {
          key: "download",
          label: "Download",
          _style: "width:10%;"
        },
        {
          key: "licenza",
          label: "Licenza",
          _style: "width:10%;"
        },
        {
          key: "linguaggio",
          label: "Linguaggio",
          _style: "width:10%;"
        },
        {
          key: "pacchetto",
          label: "Pacchetto",
          _style: "width:10%;"
        },
        {
          key: "sistemaOperativo",
          label: "Sistema Operativo",
          _style: "width:10%;"
        },
        {
          key: "tool",
          label: "Tool",
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
    ...mapGetters("applications", ["applications"])
  },
  methods: {
    deleteDeskApp() {
      this.$store.dispatch("applications/delete", this.selectedDeskApp);
      this.warningModal = false;
    },
    modalOpen(app) {
      this.selectedDeskApp = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    }
  },
  created() {
    this.$store.dispatch("applications/findAll");
  }
};
</script>
