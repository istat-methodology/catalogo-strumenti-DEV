<template>
  <div>
    <div>
      <CCardHeader class="no-border p-0 pt-4 mt-4">
      <h2>
        <h4 class="bg-secondary p-0 mb-4 text-right uppercase">
          <span class="mt-4 pr-1 text-red">Elenco</span>
        </h4>
          Documenti
          <div class="card-header-actions mr-1" v-if="isAuthenticated">
            <router-link tag="a" :to="{ name: 'DocumentationAdd' }">
              <button
                class="btn btn-outline-primary"
                type="button"
                title="Nuovo documento"
              >
                <add-icon title="Nuovo documento" />
              </button>
            </router-link>
          </div>
        </h2>
      </CCardHeader>
      <CCard>
        <CCardBody>
          <CDataTable
            v-if="documentationList"
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
                    name: 'DocumentationDetails',
                    params: { id: item.id },
                  }"
                >
                  <view-icon />
                </router-link>
              </td>
              <td v-if="isAuthenticated">
                <router-link
                  tag="a"
                  :to="{ name: 'DocumentationEdit', params: { id: item.id } }"
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
          @click="deleteDocumentation"
        >
          Delete
        </CButton>
      </template>
      Elimina documentazione '{{ selectedDocumentation.name }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "documentationList",
  data() {
    return {
      fields: [
        {
          key: "name",
          label: "Nome",
          _style: "width:49%;",
        },
        {
          key: "documentType",
          label: "Tipo documento",
          _style: "width:30%;",
        },
        {
          key: "publisher",
          label: "Editore",
          _style: "width:20%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      selectedDocumentation: {},
      warningModal: false,
    };
  },
  computed: {
    ...mapGetters("documentation", ["documentationList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    computedItems() {
      if (this.documentationList) {
        return this.documentationList.map((item) => {
          return {
            id: item.id,
            name: item.name == null ? "" : item.name,
            publisher: item.publisher == null ? "" : item.publisher,
            documentType:
              item.documentType == null ? "" : item.documentType.name,
            notes: item.notes == null ? "" : item.notes,
            resource: item.resource == null ? "" : item.resource,
          };
        });
      } else {
        return [];
      }
    },
  },

  methods: {
    deleteDocumentation() {
      this.$store.dispatch(
        "documentation/delete",
        this.selectedDocumentation.id
      );
      this.warningModal = false;
    },
    modalOpen(app) {
      this.selectedDocumentation = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    },
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.DocumentationList);
    // if (this.params) {
    // this.$store.dispatch("tools/filter", this.params);
    this.$store.dispatch("documentation/findAll");
    // }
  },
};
</script>
