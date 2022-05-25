<template>
  <!-- wait until service is loaded -->
  <div class="row" v-if="tool">
    <div class="col-9">
      <div id="id-main" />
      <div
        @mouseover="setActiveItemList('#id-link-main', true)"
        @mouseleave="setActiveItemList('#id-link-main', false)"
      >
        <div class="p-2">
          <h2 class="pt-4">
            contenuto centrale<span class="float-right">
              
            </span>
          </h2>
          <div class="pl-2">
          <div class="columns">
          fff
          </div>
        </div>        
        </div>        
      </div>
    </div>

    <aside class="container-rigth col-2">
      <section class="menu">
        <header><h2 class="menu-heading"><b>Contenuto:</b></h2></header>
        <ul class="menu-list">
          <li class="list-item" id="id-link-main">
            <a class="item-link" href="#id-main">contenuto centrale</a>
          </li>
     
        </ul>
      </section>
    </aside>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
 

import { mapGetters } from "vuex";
import { Context } from "@/common";

export default {
  name: "ToolDetails",
  //components: { plusORminus },
  data() {
     
  },
  computed: { 
  },
  components: {
    
  },
  methods: {
  
  },
  created() {
    
  },
};
</script>

<style scoped>
.icon-prop {
  display: inline;
  padding-left: 6px;
}

.list-group-item {
  border: none !important;
}
* Clear floats after the columns */ .row:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* this adds the "card" effect */
  padding: 12px;
  text-align: left;
  background-color: #f1f1f1;
  margin-left: 5px;
}

/* Responsive columns - one column layout (vertical) on small screens */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}
fieldset.scheduler-border {
  border: 1px solid #ddd !important;
  padding: 0 1.4em 1.4em 1.4em !important;
  margin: 0 0 1.5em 0 !important;
}
legend.scheduler-border {
  width: inherit; /* Or auto */
  padding: 0 10px; /* To give a bit of padding on the left and right */
  border-bottom: none;
}
.max-col {
  max-width: 5%;
}
