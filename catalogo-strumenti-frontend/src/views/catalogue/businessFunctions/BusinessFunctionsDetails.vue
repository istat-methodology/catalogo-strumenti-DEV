<template>
  <!-- wait until service is loaded -->
  <div class="row" v-if="bFunction">
    <div class="col-9">
      <div id="id-main" />
      <div
        @mouseover="setActiveItemList('#id-link-main', true)"
        @mouseleave="setActiveItemList('#id-link-main', false)"
      >
        <div class="p-2">
          <h2 class="pt-4">
            {{ bFunction.name | dashEmpty
            }}<span class="float-right">
              <router-link
                tag="a"
                :to="{
                  name: 'BusinessFunctionsEdit',
                  params: { id: bFunction.id },
                }"
                class="icon-prop"
              >
                <edit-icon />
              </router-link>
            </span>
          </h2>
          <div class="pl-2">
          <div class="columns">
            <div class="row">
              <div class="description-fields col-12">
                {{ bFunction.descr | dashEmpty }}
              </div>
              <div class="card col-md-auto p-2">
                <span><strong>Fasi GSBPM</strong></span>
                <div class="card-slot  p-2">
                  {{ bFunction.gsbpmProcesses
            .map(gsbpmProcess => {
              return gsbpmProcess.code + " " + gsbpmProcess.name ;

            })
            .join(", ") | dashEmpty }}
                </div>
              </div>

              <div class="card col-md-auto p-2">
                <span><strong>Etichetta</strong></span>
                <div class="card-slot  p-2">
                  <span>{{ bFunction.label | dashEmpty }}</span>
                </div>
              </div>
           
            </div>
          </div>
        </div>        
        </div>        
      </div>

   <div id="id-tools" />
      <div
        
        @mouseover="setActiveItemList('#id-link-tools', true)"
        @mouseleave="setActiveItemList('#id-link-tools', false)"
      >    <div class="p-2">
           <app-tools-function
            :tools="toolsByBfunction"
          ></app-tools-function>
        </div>
      </div>



   <div id="id-bProcesses" />
      <div
      
        @mouseover="setActiveItemList('#id-link-bProcesses', true)"
        @mouseleave="setActiveItemList('#id-link-bProcesses', false)"
      >
        <div class="p-2">
          <app-business-processview :positionIndex="'3'"
            :businessProcesses="getBusinessProcesses"
          
          ></app-business-processview>
        </div>
      </div>

   

    </div>

    <aside class="container-rigth col-2">
      <section class="menu">
        <header><h2 class="menu-heading"><b>Contenuto:</b></h2></header>
        <ul class="menu-list">
          <li class="list-item" id="id-link-main">
            <a class="item-link" href="#id-main">{{ bFunction.name | dashEmpty }}</a>
          </li>
         <li class="list-item" id="id-link-tools">
            <a class="item-link" href="#id-tools">Strumenti</a>
          </li>

               <li class="list-item" id="id-link-bProcesses">
            <a class="item-link" href="#id-bProcesses">Processi</a>
          </li>
            
        </ul>
      </section>
    </aside>
  </div>
</template>
<script>

import { mapGetters } from "vuex";
import { Context } from "@/common";
import _ from "lodash";
import BusinessProcessView from "../businessProcesses/shared/BusinessProcessView";
import ToolsView from "../tools/shared/ToolsView";
export default {
  name: "BusinessFunctionsDetails",
  components: {
    "app-business-processview": BusinessProcessView,
    "app-tools-function":ToolsView
  },
  data() {
    return {
      index:1,
      subIndex:0,

      activeIndex: -1,
   
     };
  },
   computed: {
    ...mapGetters("bFunction", ["bFunction"]),
    ...mapGetters("tools", ["toolsByBfunction"]),
    getBusinessProcesses: function() {
      return this.bFunction.businessProcesses.map(item => {
        return {
          id: item.id,
          name: item.name,
          descr: item.descr,
          label: item.label,
          orderCode: item.orderCode,
          parent: item.parent,
          processSteps: item.processSteps
        };
      });
    }
  },
  methods: {
    setActiveItemList(selector, bool) {
      document.querySelector(selector).className = bool
        ? "list-item-hover"
        : "list-item";
    },
    setActiveCard(selector, bool) {
      document.querySelector(selector).className = bool ? "card-hover" : "card";
    },
    setActiveIndex(index) {
      this.activeIndex !== index
        ? (this.activeIndex = index)
        : (this.activeIndex = -1);
    },
    backToList() {
      this.$router.push("/catalogue/businessfunctions");
    },
    formatDate(dt){
      dt = new Date(dt);
      return  dt.toLocaleDateString("it");
    },
    loadBFunction: _.debounce(function() {
      this.$store.dispatch("bFuntion/findById", this.$route.params.id)
    }, 500)
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.BusinessDetail);
    this.$store.dispatch("bFunction/findById", this.$route.params.id);
     this.$store.dispatch("tools/findToolsByBFunctions", this.$route.params.id);
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
