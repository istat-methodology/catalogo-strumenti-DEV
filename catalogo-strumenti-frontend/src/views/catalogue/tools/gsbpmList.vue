<template>
  <div>
    <CTitle
      title="Strumenti Metodologici"
      buttonTitle=" Strumento Metodologico"
      functionality="Elenco"
      :authenticated="isAuthenticated"
      :buttons="['aggiungi', 'indietro']"
      @handleNew="handleNew"
      @handleBack="handleBack" />
    <div class="col-12 m-4 p-4">
      <div class="columns m-4 p-4">
        <div class="row">
          <div
            class="card col-1 center"
            v-for="item of gsbpmList"
            :key="item.id">
            <div class="card-body p-2">
              <span
                class="icon-link center"
                @click="handleView(item)"
                title="vai a">
                {{ item.name }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex"
import { Context } from "@/common"
import CTitle from "@/components/CTitle.vue"
//import CTableLink from "@/components/CTableLink.vue";
export default {
  name: "gsbpmList",
  components: { CTitle },
  //, CTableLink },
  data() {
    return {
      fields: [
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
          label: "Fasi Gsbpm",
          _style: "width:30%;"
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
      selectedTool: {},
      showModal: false
    }
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("coreui", ["isLoading"]),
    ...mapGetters("gsbpm", ["gsbpmList"]),
    ...mapGetters("filter", ["params"])
  },
  methods: {
    handleOpenModalDelete(app) {
      this.selectedTool = app
      this.showModal = true
    },
    handleBack() {
      this.$router.push({ name: "Catalogue" })
    },
    handleView(item) {
      console.log(item)
      this.$router.push({ name: "ToolList", params: { id: item.id } })
    }
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.ToolList)
    this.$store.dispatch("gsbpm/findAll")
  }
}
</script>
<style scoped>
.card:hover,
.card-hover {
  position: relative !important;
  display: flex !important;
  flex-direction: column !important;
  min-width: 0 !important;
  margin-bottom: 1.5rem !important;
  word-wrap: break-word !important;
  background-clip: border-box !important;
  border-radius: 0rem !important;
  background-color: #f7faff !important;
  border: 1px solid #f5f3f3 !important;
  box-shadow: none !important;
  transition: none !important;
  margin-left: 1rem !important;
}

.card {
  position: relative !important;
  display: flex !important;
  flex-direction: column !important;
  min-width: 0 !important;
  margin-bottom: 1.5rem !important;
  word-wrap: break-word !important;
  background-clip: border-box !important;
  border-radius: 0rem !important;
  background-color: #f7faff !important;
  border: 1px solid #f5f3f3 !important;

  /*border-left:2px solid #3399ff !important;*/
  box-shadow: none !important;
  transition: none !important;
  margin-left: 1rem !important;
  font-style: weight;
}
</style>
