<template>
  <div v-if="isLoading">
    <tile></tile>
  </div>
  <div v-else>
    <CTitle
      title="Strumenti Metodologici"
      buttonTitle=" Strumento Metodologico"
      functionality="Elenco"
      :authenticated="isAuthenticated"
      :buttons="['nuovo']"
      @handleNew="handleNew"
    />
    <CCard>
      <CCardBody>
        <CDataTable
          v-if="toolscatalog"
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
  name: "ToolList",
  components: { CTitle, CModalDelete, CTableLink },
  data() {
    return {
      fields: [
        {
          key: "name",
          label: "Nome",
          _style: "width:20%;",
        },
        {
          key: "tooltype",
          label: "Tipologia",
          _style: "width:20%;",
        },
        {
          key: "gsbpm",
          label: "Fasi Gsbpm",
          _style: "width:30%;",
        },
        /*
                {
                  key: "methods",
                  label: "Metodi",
                  _style: "width:30%;",
                },
                */
        {
          key: "description",
          label: "Descrizione",
          _style: "width:30%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      selectedTool: {},
      showModal: false,
    };
  },
  computed: {
    ...mapGetters("coreui", ["isLoading"]),
    ...mapGetters("tools", ["toolscatalog"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("filter", ["params"]),
    computedItems() {
      if (this.toolscatalog) {
        return this.toolscatalog.map((item) => {
          return Object.assign({}, item, {
            tooltype: item.toolType.name,
            gsbpm: item.gsbpmProcesses
              .map((gsbpmProcess) => {
                return gsbpmProcess.code + " " + gsbpmProcess.name;
              })
              .join(", "),
            methods: item.statisticalMethods
              .map((method) => {
                return method.name;
              })
              .join(", "),
          });
        });
      } else {
        return [];
      }
    },
  },
  methods: {
    handleOpenModalDelete(app) {
      this.selectedTool = app;
      this.showModal = true;
    },
    handleNew() {
      this.$router.push({ name: "ToolAdd" });
    },
    handleView(item) {
      //router.push({ name: 'user', params: { username } }) 
      this.$router.push({ name: 'ToolDetails', params: { id: item.id }});
    },
    handleEdit(item) {
      //router.push({ name: 'user', params: { username } }) 
      this.$router.push({ name: 'ToolEdit', params: { id: item.id } });
    },
    handleDelete() {
      this.$store.dispatch("tools/delete", this.selectedTool.id);
      this.showModal = false;
    },    
    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare lo strumento metodolgico: " +
        this.selectedTool.name +
        " selezionato?"
      );
    },
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.ToolList);
    // if (this.params) {
    this.$store.dispatch("tools/filter", this.params);
    //this.$store.dispatch("tools/findAll");
    // }
  },
};
</script>
<style>