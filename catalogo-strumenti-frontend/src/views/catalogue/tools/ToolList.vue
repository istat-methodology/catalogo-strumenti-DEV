<template>
  <div v-if="isLoading">
    <tile></tile>
  </div>
  <div v-else>
    <CCardHeader class="no-border p-0 pt-4 mt-4">
      <h2>
        <h4 class="bg-secondary p-0 mb-4 text-right uppercase">
          <span class="mt-4 pr-1 text-red">Elenco</span>
        </h4>
        Strumenti Metodologici
        <div class="card-header-actions mr-1">
          <router-link tag="a" :to="{ name: 'ToolAdd' }" v-if="isAuthenticated">
            <button
              class="btn btn-outline-primary text-center"
              type="button"
              title="Nuovo strumento metodologico"
            >
              <add-icon title="Nuovo strumento metodologico" />
            </button>
          </router-link>
        </div>
      </h2>
    </CCardHeader>
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
              <router-link tag="a" :to="{ name: 'ToolAdd' }">
                <delete-icon title="Elimina Strumento Metodologico" />
              </router-link>
            </td>
          </template>
        </CDataTable>
      </CCardBody>
    </CCard>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "ToolList",
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
