<template>
  <div class="row">
    <div class="col-12" v-if="isLoading">
      <tile></tile>
    </div>
    <div class="col-12" v-else>
      <div class="card fade-in">
        <header class="card-header">
          Elenco Metodi Statistici
          <div class="card-header-actions">
            <router-link tag="a" :to="{ name: 'StatMethodAdd' }">
              <add-icon />
            </router-link>
          </div>
        </header>
        <CCardBody>
          <CDataTable
            :items="computedItems"
            :fields="fields"
            :items-per-page="10"
            sorter
            hover
            pagination
          >
            <template #show_update="{item}">
              <td>
                <router-link
                  tag="a"
                  :to="{
                    name: 'StatMethodEdit',
                    params: { id: item.id }
                  }"
                >
                  <edit-icon />
                </router-link>
              </td>
            </template>
            <template #show_delete="{item}">
              <td>
                <span class="icon-link" @click="modalOpen(item)"
                  ><delete-icon
                /></span>
              </td>
            </template>
          </CDataTable>
        </CCardBody>
      </div>
    </div>
    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="deleteStatMethod"
        >
          Delete
        </CButton>
      </template>
      Delete Statistical Method '{{ selectedStatMethod.nome }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";

export default {
  name: "SoftProcList",
  data() {
    return {
      warningModal: false,
      selectedStatMethod: {},
      fields: [
        {
          key: "nome",
          label: "Nome",
          _style: "width:10%;"
        },
        {
          key: "autore",
          label: "Autore",
          _style: "width:10%;"
        },
        {
          key: "obiettivo",
          label: "Obiettivo",
          _style: "width:10%;"
        },
        {
          key: "descrizione",
          label: "Descrizione",
          _style: "width:10%;"
        },
        {
          key: "generalita",
          label: "Generalita",
          _style: "width:10%;"
        },
        {
          key: "ipotesi",
          label: "Ipotesi",
          _style: "width:10%;"
        },
        {
          key: "limiti",
          label: "Limiti",
          _style: "width:10%;"
        },
        {
          key: "indicatoriQualita",
          label: "Indicatori di Qualita",
          _style: "width:10%;"
        },
        {
          key: "nomeTool",
          label: "Tool",
          _style: "width:10%;"
        },
        {
          key: "show_update",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        },
        {
          key: "show_delete",
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
    ...mapGetters("methods", ["methods"]),
    computedItems() {
      return this.methods.map(item => {
        return {
          ...item,
          nomeTool: item.tool.nome
        };
      });
    }
  },
  methods: {
    deleteStatMethod() {
      this.$store.dispatch("methods/delete", this.selectedStatMethod.id);
      this.warningModal = false;
    },
    modalOpen(statmethod) {
      this.selectedStatMethod = statmethod;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    }
  },
  created() {
    this.$store.dispatch("methods/findAll");
    this.$store.dispatch("coreui/setContext", Context.StatMethodList);
  }
};
</script>
