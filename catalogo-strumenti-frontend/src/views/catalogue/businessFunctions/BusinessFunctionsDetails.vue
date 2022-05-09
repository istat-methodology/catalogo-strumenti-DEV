<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="bFunction">
        <CCardHeader>{{ bFunction.name | dashEmpty }}</CCardHeader>
        <CCardBody>
          <div>
            <label>Descrizione:</label>
            <span>{{ bFunction.descr | dashEmpty }}</span>
          </div>
          <div>
            <label>Etichetta:</label>
            <span>{{ bFunction.label | dashEmpty }}</span>
          </div>
          <div>
            <label>Active:</label>
            <span>{{ bFunction.active | dashEmpty }}</span>
          </div>
          <div>
            <label>Fasi GSBPM:</label>
            <span>{{ bFunction.gsbpmProcesses
            .map(gsbpmProcess => {
              return gsbpmProcess.name;
            })
            .join(", "), | dashEmpty }}</span>
          </div>
        </CCardBody>
      </CCard>
      <CCard v-if="this.bFunction">
        <CCardHeader>Elenco Processi</CCardHeader>
        <CCardBody>
          <app-business-processview
            :businessProcesses="getBusinessProcesses"
          ></app-business-processview>
          <!-- <app-business-process
            v-for="item in getBusinessProcesses"
            :key="item.id"
            :name="item.name"
            :descr="item.descr"
            :label="item.label"
            :orderCode="item.orderCode"
            :parent="item.parent"
            :processSteps="item.processSteps"
          >
          </app-business-process> -->
        </CCardBody>
      </CCard>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
//import BusinessProcess from "../businessProcesses/shared/BusinessProcess";
import BusinessProcessView from "../businessProcesses/shared/BusinessProcessView";
import { Context } from "@/common";
//import { Context } from "@/common";
export default {
  name: "BusinessFunctionsDetails",
  components: {
    // "app-business-process": BusinessProcess,
    "app-business-processview": BusinessProcessView
  },
  data() {
    return {
      fields: [
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "name",
          label: "Nome",
          _style: "width:30%;"
        },
        {
          key: "descr",
          label: "Descrizione",
          _style: "width:30%;"
        },
        {
          key: "label",
          label: "Etichetta",
          _style: "width:20%;"
        },
        {
          key: "active",
          label: "Attivo",
          _style: "width:20%;"
        }
      ]
    };
  },
  computed: {
    ...mapGetters("bFunction", ["bFunction"]),
    getBusinessProcesses: function() {
      return this.bFunction.businessProcesses.map(item => {
        return {
          id: item.id,
          name: item.name,
          desr: item.desr,
          label: item.label,
          orderCode: item.orderCode,
          parent: item.parent
          //processSteps: item.processSteps
        };
      });
    }
    /* getGsbpmList: function() {
      return this.business.gsbpmProcesses.map(gsbpm => {
        return {
          // ...gsbpm,
          id: gsbpm.id,
          code: gsbpm.code,
          label: gsbpm.name,
          active: gsbpm.active
        };
      });
    } */
  },
  methods: {
    /* handleSubmit() {
      this.$store.dispatch("tools/update", this.tool).then(() => {
        this.backToList();
      });
    }, */
    backToList() {
      this.$router.push("/catalogue/businessfunctions");
    }
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.ToolDetail);
    this.$store.dispatch("bFunction/findById", this.$route.params.id);
    //this.$store.dispatch("coreui/setContext", Context.BusinessDetail);
  }
};
</script>
<style scoped>
.card-header {
  font-weight: 600;
}
label {
  font-weight: bold;
  display: inline;
  padding: 15px;
}

/* label-after {
  content: ": ";
} */
</style>
