<template>
  <div>
    <!-- 1 -->
    <div v-if="stateform == FormState.GSBPM_1">
      <CTitle title="GSBPM" />
      <div class="row">
        <div v-for="item of gsbpmList" :key="item.id" class="col-3">
          <div class="center text-info mt-2 mb-2">
            <h4>
              {{ item.name }}
            </h4>
          </div>
          <div class="card">
            <div class="card-body">
              <div class="list-group">
              <div v-for="subitem of item.gsbpmSubProcesses" :key="subitem.id">
                <li
                  class="list-group-item list-group-item-action p-0  p-1 no-border cursor-pointer"
                  @click="handleGSBPM(subitem)"
                  title="vai a"
                >
                  {{ subitem.code + " - " + subitem.name }}
                </li>
              </div>
            </div>
          </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 2 -->
    <div v-if="stateform == FormState.GSBPM_2">
      <CTitle
        :title="titleGSBPM_2"
        :buttonTitle="titleGSBPM_2"
        :authenticated="isAuthenticated"
        :buttons="['indietro']"
        @handleBack="handleBack"
      />
      <div class="row">
        <div class="col-sm-6 col-md-5">
          <h2 class="pt-5 pl-1 text-info">Strumenti Metodologici</h2>
          <div class="card">
            <div class="card-body">
              In questa sezione puoi trovare la lista degli Strumenti
              Metodologici.
              <p class="section-link">
                <router-link
                  tag="a"
                  :to="{
                    name: 'ToolList',
                    params: { gsbpm: this.gsbpmSelected },
                  }"
                  ><span>Vai alla lista <chevron-right-icon /></span>
                </router-link>
              </p>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-4">
          <h2 class="pt-5 pl-1 text-info">Business Functions</h2>
          <div class="card">
            <div class="card-body">
              In questa sezione puoi trovare la lista delle Business Functions.
              <p class="section-link">
                <router-link
                  tag="a"
                  :to="{
                    name: 'BusinessFunctionsList',
                    params: { gsbpm: this.gsbpmSelected },
                  }"
                >
                  <span>Vai alla lista <chevron-right-icon /></span>
                </router-link>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "Catalogue",
  components: { CTitle },
  //, CTableLink },
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
      selectedTool: {},
      showModal: false,
      FormState: {
        GSBPM_1: 0,
        GSBPM_2: 1,
      },
      stateform: 0,
      gsbpmSelected: "",
      titleGSBPM_1: "",
      titleGSBPM_2: "",
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("coreui", ["isLoading"]),
    ...mapGetters("gsbpm", ["gsbpmList"]),
    ...mapGetters("filter", ["params"]),
  },
  methods: {
    handleOpenModalDelete(app) {
      this.selectedTool = app;
      this.showModal = true;
    },
    handleBack() {
      this.stateform = this.FormState.GSBPM_1;
    },
    handleGSBPM(item) {
      console.log(item);
      this.gsbpmSelected = item;
      this.titleGSBPM_2 = "GSBPM: " + item.code + "-" + item.name;
      this.stateform = this.FormState.GSBPM_2;
    },
  },
  created() {
    this.stateform = this.FormState.GSBPM_1;
    this.$store.dispatch("coreui/setContext", Context.Home);
    this.$store.dispatch("gsbpm/findAll");
  },
};
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

