<template>
  <div>
    <CCardHeader class="no-border p-0 pt-4 mt-4">
      <h2>
        <h4 class="bg-secondary p-0 mb-4 text-right uppercase">
          <span class="mt-4 pr-1 text-primary">Elenco</span>
        </h4>
        Metodi Statistici
        <div class="card-header-actions mr-1" v-if="isAuthenticated">
          <router-link tag="a" :to="{ name: 'MethodAdd' }">
            <button
              class="btn btn-outline-primary"
              type="button"
              title="Nuovo metodo statistico"
            >
              <add-icon title="Nuovo metodo statistico" />
            </button>
          </router-link>
        </div>
      </h2>
    </CCardHeader>

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
            <td>
              <router-link
                tag="a"
                :to="{ name: 'MethodDetails', params: { id: item.id } }"
              >
                <view-icon />
              </router-link>
            </td>
            <td v-if="isAuthenticated">
              <router-link
                tag="a"
                :to="{ name: 'MethodEdit', params: { id: item.id } }"
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
    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="deleteStatisticalMethod"
        >
          Delete
        </CButton>
      </template>
      Elimina Metodo Statistico '{{ selectedStatisticalMethod.name }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "statisticalMethodsList",
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
      warningModal: false,
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
    deleteStatisticalMethod() {
      this.$store.dispatch("methods/delete", this.selectedStatisticalMethod.id);
      this.warningModal = false;
    },
    modalOpen(app) {
      this.selectedStatisticalMethod = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
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
