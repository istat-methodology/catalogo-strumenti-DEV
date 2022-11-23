<template>
  <!-- wait until service is loaded -->
  <div class="row" v-if="bProcess">
    <div class="col-8">
      <div>
        <div class="p-2">
          <CTitle
            :title="bProcess.name"
            :buttonTitle="bProcess.name"
            functionality="Dettaglio"
            :authenticated="isAuthenticated"
            :buttons="['modifica', 'indietro']"
            @handleEdit="handleEdit(bProcess)"
            @handleBack="handleBack"
          />
          <div class="pl-2">
            <div class="columns">
              <div class="row">
                <div class="description-fields col-12">
                  {{ bProcess.name | dashEmpty }}
                </div>

                <div class="description-fields col-12">
                  {{ bProcess.descr | dashEmpty }}
                </div>

                <div class="card col-md-auto p-2">
                  <span><strong>Etichetta</strong></span>
                  <div class="card-slot p-2">
                    <span>{{ bProcess.label | dashEmpty }}</span>
                  </div>
                </div>

                <div class="card col-md-auto p-2">
                  <span><strong>Ordine</strong></span>
                  <div class="card-slot p-2">
                    <span>{{ bProcess.orderCode | dashEmpty }}</span>
                  </div>
                </div>
              </div>
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
import _ from "lodash";
import CTitle from "../../../components/CTitle.vue";
export default {
  name: "BusinessProcessDetails",
  components: {
    CTitle
  },
  data() {
    return {
      index: 1,
      subIndex: 0,
      activeIndex: -1
    };
  },
  computed: {
    ...mapGetters("bProcess", ["bProcess"]),
    ...mapGetters("tools", ["toolsByBfunction"]),
    ...mapGetters("auth", ["isAuthenticated"])
  },
  methods: {
    handleBack() {
      this.$router.back();
    },
    handleEdit(item) {
      //router.push({ name: 'user', params: { username } })
      this.$router.push({
        name: "BusinessProcessEdit",
        params: { id: item.id }
      });
    },
    formatDate(dt) {
      dt = new Date(dt);
      return dt.toLocaleDateString("it");
    },
    loadBFunction: _.debounce(function() {
      this.$store.dispatch("bProcess/findById", this.$route.params.id);
    }, 500)
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.BusinessDetail);
    this.$store.dispatch("bProcess/findById", this.$route.params.id);
    this.$store.dispatch("tools/findToolsByBFunctions", this.$route.params.id);
  }
};
</script>

<style>
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
</style>
