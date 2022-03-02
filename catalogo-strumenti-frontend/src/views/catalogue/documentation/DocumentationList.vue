<template>
  <div class="row">
    <div class="col-12">
      <div class="card fade-in">
        <header class="card-header">
          Elenco Metodi Statistici
          <div class="card-header-actions">
            <router-link tag="a" :to="{ name: 'DocumentationAdd' }">
              <add-icon />
            </router-link>
          </div>
        </header>
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
            ><template #show_details="{item}">
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
              <td>
                <span class="icon-link" @click="modalOpen(item)"
                  ><delete-icon
                /></span>
              </td>

              <!-- <td v-if="isAuthenticated">
                <router-link tag="a" :to="{ name: 'ToolAdd' }">
                  <delete-icon />
                </router-link>
              </td> -->
            </template>
          </CDataTable>
        </CCardBody>
        <!--   </CCard> -->
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
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "name",
          label: "Nome",
          _style: "width:30%;"
        },
        {
          key: "publisher",
          label: "Editore",
          _style: "width:60%;"
        },
        {
          key: "documentType",
          label: "Documento",
          _style: "width:30%;"
        },
        {
          key: "notes",
          label: "Note",
          _style: "width:60%;"
        },
        {
          key: "resource",
          label: "Fonti",
          _style: "width:60%;"
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
        return this.documentationList;
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
