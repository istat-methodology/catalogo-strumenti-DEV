<template>
  <div class="row">
    <div class="col-12">
      <div class="card fade-in">
        <header class="card-header">
          Elenco Metodi Statistici
          <div class="card-header-actions">
            <router-link tag="a" :to="{ name: 'ToolAdd' }">
              <add-icon />
            </router-link>
          </div>
        </header>
        <!--  <CCard>
          <CCardHeader>Elenco Strumenti</CCardHeader>
 -->
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
  name: "statisticalMethodsList",
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
          _style: "width:30%;"
        },
        {
          key: "description",
          label: "Descrizione",
          _style: "width:60%;"
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
    ...mapGetters("coreui", ["isMethodsList"]),
    ...mapGetters("methods", ["statisticalMethodsList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("filter", ["params"]),
    computedItems() {
      if (this.statisticalMethodsList) {
        return this.statisticalMethodsList;
      } else {
        return [];
      }
    }
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.MethodList);
    // if (this.params) {
    // this.$store.dispatch("tools/filter", this.params);
    this.$store.dispatch("methods/findAll");
    // }
  }
};
</script>
