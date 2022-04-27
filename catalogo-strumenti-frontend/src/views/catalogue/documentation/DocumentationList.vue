<template>
  <div class="row">
    <div class="col-12">
      <h2>
        Elenco Documentazione
        <div class="card-header-actions" v-if="isAuthenticated">
          <router-link tag="a" :to="{ name: 'DocumentationAdd' }">
            <button class="btn btn-primary" type="button">
              <add-icon /> Nuovo
            </button>
          </router-link>
        </div>
      </h2>
      <div class="card fade-in">
        <!--  <CCard>
          <CCardHeader>Elenco Strumenti</CCardHeader>
 -->
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
                    params: { id: item.id }
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
          _style: "width:49%;"
        },
        {
          key: "documentType",
          label: "Documento",
          _style: "width:30%;"
        },
        {
          key: "publisher",
          label: "Editore",
          _style: "width:20%;"
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ],
      selectedDocumentation: {},
      warningModal: false
    };
  },
  computed: {
    ...mapGetters("documentation", ["documentationList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    computedItems() {
      if (this.documentationList) {
        return this.documentationList.map(item => {
          return {
            id: item.id,
            name: item.name,
            publisher: item.publisher,
            documentType: item.documentType.name,
            notes: item.notes,
            resource: item.resource
          };
        });
      } else {
        return [];
      }
    }
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
    }
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.DocumentationList);
    // if (this.params) {
    // this.$store.dispatch("tools/filter", this.params);
    this.$store.dispatch("documentation/findAll");
    // }
  }
};
</script>
