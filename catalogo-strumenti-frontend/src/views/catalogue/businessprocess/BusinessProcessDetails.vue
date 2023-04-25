<template>
  <div class="row" v-if="bProcess">
    <div class="col-8">
      <div>
        <div class="p-0">
          <CTitle
            :title="bProcess.name"
            :buttonTitle="bProcess.name"
            functionality="DETTAGLIO"
            :authenticated="isAuthenticated"
            :buttons="['indietro']"
            @handleBack="handleBack"
          />
          <CBusinessProcessView
            :bProcess="bProcess"
            @enableEditStep="showEditStep"
            @enableNewStep="showNewStep"
          />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
import CBusinessProcessView from "@/components/businessProcess/CBusinessProcessView";
export default {
  components: {
    CTitle,
    CBusinessProcessView,
  },
  name: "BusinessProcessDetails",
  data() {
    return {};
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bProcess", ["bProcess"]),
  },
  methods: {
    handleBack() {
      this.$router.back();
    },
  },
  created() {
    this.$store.dispatch("bProcess/findById", this.$route.params.id);
  },
};
</script>
<style scoped>
h5 {
  margin-bottom: 0.1rem;
}
.card-border {
  border: 1px solid #d8dbe0 !important;
  box-shadow: none !important;
}
.bg-lighter {
  background-color: #f8f8f8 !important;
}
.material-design-icon {
  margin-bottom: 0.2rem;
}

* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding in columns */
.row {
  margin: 0 -5px;
}

/* Clear floats after the columns */
.row:after {
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
</style>
