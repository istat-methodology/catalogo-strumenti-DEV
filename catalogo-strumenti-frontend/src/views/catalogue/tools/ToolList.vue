<template>
  <div class="row">
    <div class="col-12" v-if="isLoading">
      <tile></tile>
    </div>
    <div class="col-12" v-else>
      <div class="card fade-in">
        <header class="card-header">
          Elenco Strumenti
        </header>
        <!--  <CCard>
          <CCardHeader>Elenco Strumenti</CCardHeader>
 -->
        <CCardBody>
          <CDataTable
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
        <!--   </CCard> -->
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "Supervisor",
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
          _style: "width:20%;"
        },
        {
          key: "tooltype",
          label: "Tipologia",
          _style: "width:20%;"
        },
        {
          key: "releaseDate",
          label: "Data Rilascio",
          _style: "width:10%;"
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
    computedItems() {
      return this.toolscatalog.map(item => {
        return Object.assign({}, item, {
          tooltype: item.toolType.name,
          gsbpm: item.gsbpmProcesses
            .map(gsbpmProcess => {
              return gsbpmProcess.name;
            })
            .join(", "),
          methods: item.statisticalMethods
            .map(method => {
              return method.name;
            })
            .join(", ")
        });
      });
    }
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.ToolList);
    this.$store.dispatch("tools/findAll");
    //this.$store.dispatch("gsbpm/findAll");
  }
};
</script>
