<template>
  <div>
    <CTitle
      title="Metodi Statistici"
      buttonTitle=" Metodo Statistico"
      functionality="Elenco"
      :actions="isAuthenticated"
      :buttons="['nuovo']"
      @handleNew="handleNew"
    />
    <CCard>
      <CCardBody>
        <CDataTable
          v-if="statisticalMethodsList"
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
  name: "statisticalMethodsList",
  components: { CTitle, CModalDelete,CTableLink },
  data() {
    return {
      fields: [
        {
          key: "name",
          label: "Nome",
          _style: "width:40%;",
        },
        {
          key: "gsbpm",
          label: "Fasi Gsbpm",
          _style: "width:30%;",
        },
        {
          key: "description",
          label: "Descrizione",
          _style: "width:29%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      selectedStatisticalMethod: {},
      showModal: false,
    };
  },
  computed: {
    ...mapGetters("coreui", ["isMethodsList"]),
    ...mapGetters("methods", ["statisticalMethodsList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("filter", ["params"]),
    computedItems() {
      if (this.statisticalMethodsList) {
        return this.statisticalMethodsList.map((method) => {
          return {
            id: method.id,
            name: method.name == null ? "" : method.name,
            description: method.description == null ? "" : method.description,
            gsbpm: method.gsbpmProcesses
              .map((gsbpmProcess) => {
                return gsbpmProcess.code + " " + gsbpmProcess.name;
              })
              .join(", "),
          };
        });
      } else {
        return [];
      }
    },
  },

  methods: {
    handleNew() {
      this.$router.push({ name: "MethodAdd" });
    },
    handleDelete() {
      this.$store.dispatch("methods/delete", this.selectedStatisticalMethod.id);
      this.showModal = false;
    },

    handleView(item) {
      //router.push({ name: 'user', params: { username } }) 
      this.$router.push({ name: 'MethodDetails', params: { id: item.id }});
    },
    handleEdit(item) {
      //router.push({ name: 'user', params: { username } }) 
      this.$router.push({ name: 'MethodEdit', params: { id: item.id } });
    },
    handleOpenModalDelete(app) {
      this.selectedStatisticalMethod = app;
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il Metodo Statistico " +
        this.selectedStatisticalMethod.name +
        " selezionato?"
      );
    },
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.MethodList);
    // if (this.params) {
    // this.$store.dispatch("tools/filter", this.params);
    this.$store.dispatch("methods/findAll");
    // }
  },
};
</script>
