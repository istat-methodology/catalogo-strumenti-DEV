<template>
  <div class="row">
    <div class="col-12" v-if="isLoading">
      <tile></tile>
    </div>
    <div class="col-12" v-else>
      <div class="card fade-in">
        <header class="card-header">
          Software Procedure List
          <div class="card-header-actions">
            <router-link tag="a" :to="{ name: 'SoftProcAdd' }">
              <add-icon />
            </router-link>
          </div>
        </header>
        <CCardBody>
          <CDataTable
            :items="procedures"
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
                    name: 'SoftProcEdit',
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
          @click="deleteSoftProc"
        >
          Delete
        </CButton>
      </template>
      Delete Desktop Application '{{ selectedSoftProc.dipendenze }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "SoftProcList",
  data() {
    return {
      warningModal: false,
      selectedSoftProc: {},
      fields: [
        {
          key: "codice",
          label: "Codice",
          _style: "width:10%;"
        },
        {
          key: "sintassi",
          label: "Sintassi",
          _style: "width:10%;"
        },
        {
          key: "dipendenze",
          label: "Dipendenze",
          _style: "width:10%;"
        },
        {
          key: "linguaggio",
          label: "Linguaggio",
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
    ...mapGetters("procedures", ["procedures"])
  },
  methods: {
    deleteSoftProc() {
      this.$store.dispatch("procedures/delete", this.selectedSoftProc.id);
      this.warningModal = false;
    },
    modalOpen(softproc) {
      this.selectedSoftProc = softproc;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    }
  },
  created() {
    this.$store.dispatch("procedures/findAll");
  }
};
</script>
