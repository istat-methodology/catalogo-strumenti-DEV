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
        <CCardBody>
          <CDataTable
            :items="toolscatalog"
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
            </template>
          </CDataTable>
        </CCardBody>
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
          label: "Name",
          _style: "width:10%;"
        },
        {
          key: "description",
          label: "Description",
          _style: "width:10%;"
        },
        {
          key: "standardIstat",
          label: "Standad Istat",
          _style: "width:10%;"
        },
        {
          key: "tags",
          label: "Tags",
          _style: "width:10%;"
        },
        {
          key: "releaseDate",
          label: "Release Date",
          _style: "width:10%;"
        },
        {
          key: "metodoStatistico",
          label: "Metodo Statistico",
          _style: "width:10%;"
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
    ...mapGetters("tools", ["toolscatalog"])
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.ToolList);
    this.$store.dispatch("tools/findAll");
  }
};
</script>
