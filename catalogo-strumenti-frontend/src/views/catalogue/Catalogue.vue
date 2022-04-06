<template>
  <div class="row">
    <div class="col-sm-6 col-md-4">
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
    <div class="col-sm-6 col-md-4">
      <div class="card">
        <header class="card-header">
          <span>Processi</span>
        </header>
        <div class="card-body">
          In questa sezione puoi trovare la lista dei processi.
          <p class="section-link">
            <router-link tag="a" :to="{ name: 'BusinessList' }"
              ><span>Vai alla lista <chevron-right-icon /></span>
            </router-link>
          </p>
        </div>
      </div>
    </div>
  </div>

  <!--div class="col-4">
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
export default {
  name: "Catalogue",
  created() {
    this.$store.dispatch("coreui/setContext", Context.Home);
  }
};
</script>
