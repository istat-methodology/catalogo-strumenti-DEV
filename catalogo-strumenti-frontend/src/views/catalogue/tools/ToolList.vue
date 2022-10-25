<template>
  <div v-if="isLoading">
    <tile></tile>
  </div>
  <div v-else>
    <CTitle
      title="Strumenti Metodologici"
      buttonTitle=" Strumento Metodologico"
      functionality="Elenco"
      :actions="isAuthenticated"
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
            <td>
              <router-link
                tag="a"
                :to="{ name: 'ToolDetails', params: { id: item.id } }"
              >
                <view-icon title="Visualizza Strumento Metodologico" />
              </router-link>
            </td>
            <td v-if="isAuthenticated">
              <router-link
                tag="a"
                :to="{ name: 'ToolEdit', params: { id: item.id } }"
              >
                <edit-icon title="Modifica Strumento Metodologico" />
              </router-link>
            </td>
            <td v-if="isAuthenticated">
              <span class="icon-link" @click="openModal(item)"
                ><delete-icon title="Elimina Strumento Metodologico" />
              </span>
            </td>
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
export default {
  name: "ToolList",
  components: { CTitle, CModalDelete },
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
    openModal(app) {
      this.selectedTool = app;
      this.showModal = true;
    },
    handleDelete() {
      this.$store.dispatch("tools/delete", this.selectedTool.id);
      this.showModal = false;
    },
    closeModal() {
      this.showModal = false;
    },
    handleNew() {
      this.$router.push({ name: "ToolAdd" });
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
