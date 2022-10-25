<template>
  <div>
    <div>
      <CTitle
        title="Documenti"
        buttonTitle=" Documento"
        functionality="Elenco"
        :authenticated="isAuthenticated"
        :buttons="['nuovo']"
        @handleNew="handleNew"
      />
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
    </div>
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
  name: "documentationList",
  components: { CTitle, CModalDelete, CTableLink },
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
      showModal: false,
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
    handleNew() {
      this.$router.push({ name: "DocumentationAdd" });
    },
    handleView(item) {
      //router.push({ name: 'user', params: { username } })
      this.$router.push({
        name: "DocumentationDetails",
        params: { id: item.id },
      });
    },
    handleEdit(item) {
      //router.push({ name: 'user', params: { username } })
      this.$router.push({ name: "DocumentationEdit", params: { id: item.id } });
    },
    handleDelete() {
      this.$store.dispatch(
        "documentation/delete",
        this.selectedDocumentation.id
      );
      this.showModal = false;
    },

    handleOpenModalDelete(app) {
      this.selectedDocumentation = app;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare la documentazione " +
        this.selectedDocumentation.name +
        " selezionato?"
      );
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
