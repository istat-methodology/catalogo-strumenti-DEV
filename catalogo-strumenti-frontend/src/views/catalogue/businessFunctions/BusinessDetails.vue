<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="business">
        <CCardHeader>{{ business.name | dashEmpty }}</CCardHeader>
        <CCardBody>
          <div>
            <label>Descrizione:</label>
            <span>{{ business.descr | dashEmpty }}</span>
          </div>
          <div>
            <label>Etichetta:</label>
            <span>{{ business.label | dashEmpty }}</span>
          </div>
          <div>
            <label>Active:</label>
            <span>{{ business.active | dashEmpty }}</span>
          </div>
          <div>
            <label>Fasi GSBPM:</label>
            <span>{{ business.gsbpmProcesses
            .map(gsbpmProcess => {
              return gsbpmProcess.name;
            })
            .join(", "), | dashEmpty }}</span>
          </div>
        </CCardBody>
      </CCard>
      <CCard v-if="this.business">
        <CCardHeader>Elenco Processi</CCardHeader>
        <CCardBody>
          <app-process-agent
            v-for="item in getBusinessProcesses"
            :key="item.id"
            :name="item.name"
            :descr="item.descr"
            :label="item.label"
            :orderCode="item.orderCode"
            :parent="item.parent"
            :processSteps="item.processSteps"
          >
          </app-process-agent>
        </CCardBody>
      </CCard>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
import BusinessProcess from "@/components/BusinessProcess";
import { Context } from "@/common";
//import { Context } from "@/common";
export default {
  name: "BusinessDetails",
  components: {
    "app-process-agent": BusinessProcess
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
    ...mapGetters("business", ["business"]),
    getBusinessProcesses: function() {
      return this.business.businessProcesses.map(item => {
        return {
          id: item.id,
          name: item.name,
          desr: item.desr,
          label: item.label,
          orderCode: item.orderCode,
          parent: item.parent,
          processSteps: item.processSteps
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
      this.$router.push("/catalogue/businessList");
    }
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.ToolDetail);
    this.$store.dispatch("business/findById", this.$route.params.id);
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
