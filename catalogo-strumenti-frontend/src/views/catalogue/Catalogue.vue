<template>
  <div v-if="isSupervisor">
    <app-landing-supervisor />
  </div>
  <div v-else-if="isReviewer">
    <app-landing-reviewer />
  </div>
  <!-- <div v-else-if="!isReviewer && !isSupervisor">
    <app-landing-everyone />
  </div> -->
  <div class="row" v-else>
    <div class="col-4">
      <div class="card">
        <header class="card-header">
          <span>Strumenti Metodologici</span>
        </header>
        <div class="card-body">
          In questa sezione puoi trovare la lista degli Strumenti Metodologici.
          <p class="section-link">
            <router-link tag="a" :to="{ name: 'ToolList' }"
              ><span>Vai alla lista <chevron-right-icon /></span>
            </router-link>
          </p>
        </div>
      </div>
    </div>
  </div>
  <!-- <div class="col-4">
      <div class="card">
        <header class="card-header">
          <span>Procedure Software</span>
        </header>
        <div class="card-body">
          In questa sezione puoi trovare la lista delle Procedue Software.
        </div>
      </div>
    </div>
    <div class="col-4">
      <div class="card">
        <header class="card-header">
          <span>Servizi Statistici</span>
        </header>
        <div class="card-body">
          In questa sezione puoi trovare la lista dei Servizi Statistici.
        </div>
      </div>
    </div>
    <div class="col-4">
      <div class="card">
        <header class="card-header">
          <span>Metodi Statitici</span>
        </header>
        <div class="card-body">
          In questa sezione puoi trovare la lista dei Metodi Statistici.
        </div>
      </div>
    </div> -->
</template>

<script>
import { Context } from "@/common";
import { mapGetters } from "vuex";
import Reviewer from "./landing/Reviewer";
import Supervisor from "./landing/Supervisor";
//import Everyone from "./landing/Everyone.vue";

export default {
  name: "Catalogue",
  components: {
    "app-landing-reviewer": Reviewer,
    "app-landing-supervisor": Supervisor
    // "app-landing-everyone": Everyone
  },
  computed: {
    ...mapGetters("auth", ["isReviewer", "isSupervisor"])
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.Home);
  }
};
</script>
