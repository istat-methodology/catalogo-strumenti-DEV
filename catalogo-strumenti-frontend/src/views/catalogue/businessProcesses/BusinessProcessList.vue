<template>
  <div>
    <CTitle
      title="Processi"
      buttonTitle=" Processo"
      functionality="Elenco"
      :authenticated="isAuthenticated"
      :buttons="['aggiungi', 'indietro']"
      @handleNew="handleNew"
      @handleBack="handleBack"
    />
    <CCard>
      <CCardBody>
        <CDataTable
          v-if="bProcessList"
          :items="bProcessList"
          :fields="fields"
          column-filter
          :items-per-page="10"
          sorter
          hover
          pagination
        >
          <template #show_details="{ item, index }">
            <CTableLink
              :authenticated="isAuthenticated"
              @handleView="handleView(item)"
              @handleEdit="handleEdit(item)"
              @handleDelete="handleOpenModalDelete(item)"
              @handleDetails="setActiveIndex(index)"
            />
          </template>          
          <template #details="{ item, index }">
            <CTableDetails                             
              title="...processo collegato alle Business Functions"
              :items="item.businessFunctions"
              :index="index"
              :activeIndex="isActiveIndex"
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

// const [items, setItems] = useState(usersData)

import { mapGetters } from "vuex";
import { Context } from "@/common";
import CTitle from "@/components/CTitle.vue";
import CModalDelete from "@/components/CModalDelete.vue";
import CTableLink from "@/components/CTableLink.vue";
import CTableDetails from "@/components/CTableDetails.vue";
export default {
  name: "BusinessProcessList",
  components: { CTitle, CModalDelete, CTableLink, CTableDetails },
  data() {
    return {
      
      fields: [
        {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;",
        },
        {
          key: "name",
          label: "Nome",
          _style: "width:30%;",
        },
        {
          key: "label",
          label: "Etichetta",
          _style: "width:10%;",
        },
        {
          key: "descr",
          label: "Descrizione",
          _style: "width:30%;",
        },
        {
          key: "orderCode",
          label: "Order",
          _style: "width:10%;",
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false,
        },
      ],
      details:[],
      setDetails:[],
      selectedBusiness: {},
      showModal: false,
      activeIndex:-1
      
    };
  },
  computed: {
    ...mapGetters("bProcess", ["bProcessList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("filter", ["params"]),
    computedItems: function () {
      if (this.bProcessList) {
        return this.bProcessList.map((item) => {
          return Object.assign({}, item, {
            id: item.id,
            name: item.name == null ? "" : item.name,
            descr: item.descr == null ? "" : item.descr,
            label: item.label == null ? "" : item.label,
            order: item.orderCode == null ? "" : item.orderCode,
            businessFunctions:
              item.businessFunctions == null ? "" : item.businessFunctions,
          });
        });
      } else {
        return [];
      }
    },
	  isActiveIndex() {
      return this.activeIndex;
    },
  },
  methods: {
    setActiveIndex(index) {
      this.activeIndex !== index
        ? (this.activeIndex = index)
        : (this.activeIndex = -1);
    },
    handleDelete() {
      this.$store
        .dispatch("bProcess/delete", this.selectedBusiness.id)
        .catch(() => {});
      this.showModal = false;
    },

    handleNew() {
      this.$router.push({ name: "BusinessProcessAdd" });
    },
    handleBack() {
      this.$router.push({ name: "Catalogue" });
    },
    handleView(item) {
      //router.push({ name: 'user', params: { username } })
      this.$router.push({
        name: "BusinessProcessDetails",
        params: { id: item.id },
      });
    },
    handleEdit(item) {
      //router.push({ name: 'user', params: { username } })
      this.$router.push({
        name: "BusinessProcessEdit",
        params: { id: item.id },
      });
    },
    handleDetails(item) {
      console.log(item);
      this.view = !this.view;
    },

    handleOpenModalDelete(app) {
      this.selectedBusiness = app;
      this.showModal = true;
    },

    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare il processo " +
        this.selectedBusiness.name +
        " selezionato?"
      );
    },
  },
  created() {
    this.$store
      .dispatch("coreui/setContext", Context.BusinessProcessSession)
      .catch(() => {});
    // if (this.params) {
    this.$store.dispatch("bProcess/filter", this.params).catch(() => {});
    //this.$store.dispatch("business/findAll");
    // }
  },
};
</script>
