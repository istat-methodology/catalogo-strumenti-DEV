<template>
  <div v-if="isSupervisor">
    <app-landing-supervisor />
  </div>
  <div v-else-if="isReviewer">
    <app-landing-reviewer />
  </div>
  <div class="row" v-else>
    <div class="col-4">
      <div class="card">
        <header class="card-header">
          <span>Pre elaborazione</span>
        </header>
        <div class="card-body">
          In questa sezione puoi trovare la lista degli strumnti per la preelaborazione dei dati.
        </div>
      </div>
    </div>
    <div class="col-4">
      <div class="card">
        <header class="card-header">
          <span>Controllo e correzione</span>
        </header>
        <div class="card-body">
          In questa sezione puoi trovare la lista degli strumenti per controllo
          e correzione.
        </div>
      </div>
    </div>
    <div class="col-4">
      <div class="card">
        <header class="card-header">
          <span>Clustering</span>
        </header>
        <div class="card-body">
          In questa sezione puoi trovare la lista degli srumenti per il
          clustering.
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { Context } from "@/common";
import { mapGetters } from "vuex";
import Reviewer from "./landing/Reviewer";
import Supervisor from "./landing/Supervisor";

export default {
  name: "Catalogue",
  components: {
    "app-landing-reviewer": Reviewer,
    "app-landing-supervisor": Supervisor
  },
  computed: {
    ...mapGetters("auth", ["isReviewer", "isSupervisor"])
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.Home);
  }
};
</script>
