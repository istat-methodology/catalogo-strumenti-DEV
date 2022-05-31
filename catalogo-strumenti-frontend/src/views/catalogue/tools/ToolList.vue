<template>
  <div class="col-12" v-if="isLoading">
    <tile></tile>
  </div>
  <div class="col-12" v-else>
    <h2 class="pt-4">
      Elenco Strumenti
      <div class="card-header-actions">
        <router-link tag="a" :to="{ name: 'ToolAdd' }" v-if="isAuthenticated">
          
          <button class="btn btn-primary" type="button">
            <add-icon /> Nuovo
          </button>
        </router-link>
      </div>
    </h2>
    <CCard class="card fade-in">
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
                <view-icon />
              </router-link>
            </td>
            <td v-if="isAuthenticated">
              <router-link
                tag="a"
                :to="{ name: 'ToolEdit', params: { id: item.id } }"
              >
                <edit-icon />
              </router-link>
            </td>
            <td v-if="isAuthenticated">
              <router-link tag="a" :to="{ name: 'ToolAdd' }">
                <delete-icon />
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
      /*
      fields: [
        {
          key: "name",
          label: "Nome",
          _style: "width:20%;"
        },
        {
          key: "description",
          label: "Descrizione",
          _style: "width:20%;"
        },
        {
          key: "standardIstat",
          label: "Standard Istat",
          _style: "width:10%;"
        },
        {
          key: "tags",
          label: "Tags",
          _style: "width:30%;"
        },
        {
          key: "version",
          label: "Versione",
          _style: "width:30%;"
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ],
      */
      fields: [
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "name",
          label: "Nome",
          _style: "width:20%;"
        },
        {
          key: "tooltype",
          label: "Tipologia",
          _style: "width:20%;"
        },
        {
          key: "gsbpm",
          label: "Gsbpm",
          _style: "width:30%;"
        },
        {
          key: "methods",
          label: "Metodi",
          _style: "width:30%;"
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ]
    };
  },
  computed: {
    ...mapGetters("coreui", ["isLoading"]),
    ...mapGetters("tools", ["toolscatalog"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("filter", ["params"]),
    computedItems() {
      if (this.toolscatalog) {
        return this.toolscatalog.map(item => {
          return Object.assign({}, item, {
            tooltype: item.toolType.name,
            gsbpm: item.gsbpmProcesses
              .map(gsbpmProcess => {
                return gsbpmProcess.code + " " + gsbpmProcess.name;
              })
              .join(", "),
            methods: item.statisticalMethods
              .map(method => {
                return method.name;
              })
              .join(", ")
          });
        });
      } else {
        return [];
      }
    }
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.ToolList);
    // if (this.params) {
    this.$store.dispatch("tools/filter", this.params);
    //this.$store.dispatch("tools/findAll");
    // }
  }
};
</script>
