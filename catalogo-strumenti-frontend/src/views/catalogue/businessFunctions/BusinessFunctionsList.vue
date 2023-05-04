<template>
  <div>
    <div>
      <CTitle
        title="Business Functions"
        buttonTitle=" Business Functions"
        functionality="Elenco"
        :authenticated="isAuthenticated"
        :buttons="['aggiungi', 'indietro']"
        @handleNew="handleNew"
        @handleBack="handleBack"
      />
      <CCard>
        <CCardBody>
          <CDataTable
            v-if="bFunctionList"
            :items="getBusinessFunctionList"
            :fields="fields"
            column-filter
            :columnFilterValue="columnFilterValue"
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
import CTitle from "@/components/CTitle.vue";
import CModalDelete from "@/components/CModalDelete.vue";
import CTableLink from "@/components/CTableLink.vue";

export default {
  name: "BusinessFunctionsList",
  components: { CTitle, CModalDelete, CTableLink },
  data() {
    return {
      fields: [
        {
          key: "id",
          label: "ID",
          _style: "width:4%;",
        },
        {
          key: "gsbpm",
          label: "Gsbpm",
          _style: "width:40%;",
        },
        {
          key: "name",
          label: "Nome",
          _style: "width:50%;",
        },
        {
          key: "label",
          label: "Etichetta",
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
      selectedBusinessFunction: {},
      showModal: false,
      columnFilterValue: {},
    };
  },
  computed: {
    ...mapGetters("bFunction", ["bFunctionList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("filter", ["params"]),

    getBusinessFunctionList: function () {
      if (this.bFunctionList) {
        return this.bFunctionList.map((business) => {
          return {
            id: business.id,
            name: business.name == null ? "" : business.name,
            descr: business.descr == null ? "" : business.descr,
            label: business.label == null ? "" : business.label,
            gsbpm:
              business.gsbpmProcesses == null
                ? ""
                : business.gsbpmProcesses
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
  mounted() {
    if(this.$route.params.gsbpm){
    
    this.columnFilterValue = {
      gsbpm: this.$route.params.gsbpm.code  
    }}
  },
  methods: {
    handleOpenModalDelete(app) {
      this.selectedBusinessFunction = app;
      this.showModal = true;
    },
    handleNew() {
      this.$router.push({ name: "BusinessFunctionsAdd" });
    },
    handleBack() {
      //this.$router.back();
      this.$router.push({
        name: "Catalogue",
        params: { cataloguePage: "2", gsbpm: this.$route.params.gsbpm },
      });
    },
    handleView(item) {
      this.$router.push({
        name: "BusinessFunctionsDetails",
        params: { id: item.id },
      });
    },
    handleEdit(item) {
      this.$router.push({
        name: "BusinessFunctionsEdit",
        params: { id: item.id },
      });
    },
    handleDelete() {
      //this.$store.dispatch("bFunction/delete", this.selectedBusinessFunction.id).catch(() => {});
      //this.$store.dispatch("bFunction/filter", this.params).catch(() => {});
      //this.$store.dispatch("bFunction/findAll");

      this.showModal = false;
    },
    closeModal() {
      this.showModal = false;
    },
    getMessage() {
      return (
        "Sei sicuro di eliminare la Business Function: " +
        this.selectedBusinessFunction.name +
        " selezionata?"
      );
    },
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.BusinessFunctionSession);
    //this.$store.dispatch("bFunction/filter", this.params).catch(() => {});
    this.$store.dispatch("bFunction/findAll");
    
  },
};
</script>
