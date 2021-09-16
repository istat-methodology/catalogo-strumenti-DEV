<template>
  <div class="row">
    <div class="col-12" v-if="isLoading">
      <tile></tile>
    </div>
    <div class="col-12" v-else>
      <div class="card fade-in">
        <header class="card-header">
          Tools List
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
                  :to="{ name: 'ToolShow', params: { id: item.id } }"
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

export default {
  name: "Supervisor",
  data() {
    return {
      fields: [
        {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        },
        {
          key: "nome",
          label: "Nome",
          _style: "width:10%;"
        },
        {
          key: "descrizione",
          label: "Descrizione",
          _style: "width:10%;"
        },
        {
          key: "autore",
          label: "Autore",
          _style: "width:10%;"
        },
        {
          key: "data",
          label: "Data",
          _style: "width:10%;"
        },
        {
          key: "documentazione",
          label: "Documentazione",
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
    this.$store.dispatch("tools/findAll");
  }
};
</script>
