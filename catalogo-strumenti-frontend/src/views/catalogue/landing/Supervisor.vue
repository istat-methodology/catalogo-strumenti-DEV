<template>
  <div class="row">
    <div class="col-12" v-if="isLoading">
      <tile></tile>
    </div>
    <div class="col-12" v-else>
      <div class="card fade-in">
        <header class="card-header">
          Tools List
          <div class="card-header-actions">
            <router-link tag="a" :to="{ name: 'ToolAdd' }">
              <add-icon />
            </router-link>
          </div>
        </header>
        <CCardBody>
          <CDataTable
            :items="toolscatalog"
            :fields="fields"
            column-filter
            :items-per-page="10"
            sorter
            hover
            pagination
            ><template #show_details="{item}">
              <td>
                <router-link
                  tag="a"
                  :to="{
                    name: 'ToolDetails',
                    params: { id: item.id }
                  }"
                >
                  <text-icon />
                </router-link>
              </td>
            </template>
            <template #show_update="{item}">
              <td>
                <router-link
                  tag="a"
                  :to="{
                    name: 'ToolEdit',
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
        <CButton shape="square" size="sm" color="primary" @click="deleteTool">
          Delete
        </CButton>
      </template>
      Delete Tool '{{ selectedTool.nome }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "Supervisor",
  data() {
    return {
      warningModal: false,
      selectedTool: {},
      fields: [
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "nome",
          label: "Nome",
          _style: "width:10%;"
        },
        {
          key: "descrizione",
          label: "Descrizione",
          _style: "width:10%;"
        },
        {
          key: "data",
          label: "Data",
          _style: "width:10%;"
        },
        {
          key: "note",
          label: "Note",
          _style: "width:10%;"
        },
        {
          key: "metodoStatistico",
          label: "Metodo Statistico",
          _style: "width:10%;"
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
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
    ...mapGetters("tools", ["toolscatalog"])
  },
  methods: {
    deleteTool() {
      this.$store.dispatch("tools/delete", this.selectedTool);
      this.warningModal = false;
    },
    modalOpen(tool) {
      this.selectedTool = tool;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    }
  },
  created() {
    this.$store.dispatch("tools/findAll");
  }
};
</script>
