<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="statisticalMethod">
        <CCardHeader>Modifica Metodo Statistico</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome*"
            placeholder="Name"
            v-model="statisticalMethodLocal.name"
            :class="{ 'is-invalid': $v.statisticalMethodLocal.name.$error }"
          />
          <div
            class="help-block"
            :class="{ show: $v.statisticalMethodLocal.name.$error }"
          >
            Campo obbligatorio
          </div>
          <CInput
            label="Descrizione"
            placeholder="Descrizione"
            v-model="statisticalMethodLocal.description"
          />
          <CInput
            label="Requisiti"
            placeholder="Requisiti"
            v-model="statisticalMethodLocal.requirements"
          />
          <CInput
            label="Presupposti"
            placeholder="Presupposti"
            v-model="statisticalMethodLocal.assumptions"
          />
          <CInput
            label="Vincoli"
            placeholder="Vincoli"
            v-model="statisticalMethodLocal.constraints"
          />
          <CInput
            label="Note"
            placeholder="Note"
            v-model="statisticalMethodLocal.notes"
          />
          <!-- <CInput
            label="Ultimo Aggiornamento"
            placeholder="Ultimo Aggiornamento"
            v-model="statisticalMethodLocal.lastUpdate"
          /> -->
          <CInput
            label="Tag"
            placeholder="Tag"
            v-model="statisticalMethodLocal.tags"
          />
          <CInput
            label="Versione"
            placeholder="Versione"
            v-model="statisticalMethodLocal.version"
          />
          <label>Data di Pubblicazione</label>
          <div>
            <date-pick
              aria-label="Data di Pubblicazione"
              v-model="statisticalMethodLocal.releaseDate"
              :displayFormat="'DD/MM/YYYY'"
            ></date-pick>
          </div>
          <!--  <CInput
            label="Data di Pubblicazione"
            placeholder="Data di Pubblicazione"
            v-model="statisticalMethodLocal.releaseDate"
          /> -->
          <CInput
            label="Standard Istat"
            placeholder="Standard Istat"
            v-model="statisticalMethodLocal.standardIstat"
          />
          <!-- <div>
            <label>Ultimo Aggiornamento:</label>
            <span>{{ statisticalMethodLocal.lastUpdate | dashEmpty }}</span>
          </div> -->
        </CCardBody>
      </CCard>
      <CCardFooter>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          class="mr-2"
          @click.prevent="handleSubmit"
          >Update</CButton
        >
        <CButton
          shape="square"
          size="sm"
          color="light"
          @click.prevent="$router.back()"
          >Indietro</CButton
        >
      </CCardFooter>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
//import { CDatePicker } from "@coreui/vue";
import DatePick from "vue-date-pick";
import "vue-date-pick/dist/vueDatePick.css";
import { required } from "vuelidate/lib/validators";
export default {
  name: "ToolEdit",
  components: {
    DatePick
  },
  data() {
    return {
      statisticalMethodLocal: {
        id: "",
        name: "",
        description: "",
        requirements: "",
        assumptions: "",
        constraints: "",
        notes: "",
        lastUpdate: "",
        tags: "",
        version: "",
        releaseDate: "",
        standardIstat: ""
      }
    };
  },
  computed: {
    ...mapGetters("methods", ["statisticalMethod"])
  },
  validations: {
    statisticalMethodLocal: {
      name: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      this.$v.$touch();
      if (!this.$v.statisticalMethodLocal.$invalid) {
        this.$store
          .dispatch("methods/update", this.statisticalMethodLocal)
          .then(() => {
            this.backToList();
          });
      }
    },
    setOldValues() {
      this.statisticalMethodLocal.id = this.statisticalMethod.id;
      this.statisticalMethodLocal.name = this.statisticalMethod.name;
      this.statisticalMethodLocal.description = this.statisticalMethod.description;
      this.statisticalMethodLocal.requirements = this.statisticalMethod.requirements;
      this.statisticalMethodLocal.assumptions = this.statisticalMethod.assumptions;
      this.statisticalMethodLocal.constraints = this.statisticalMethod.constraints;
      this.statisticalMethodLocal.notes = this.statisticalMethod.notes;
      this.statisticalMethodLocal.lastUpdate = this.statisticalMethod.lastUpdate;
      this.statisticalMethodLocal.tags = this.statisticalMethod.tags;
      this.statisticalMethodLocal.version = this.statisticalMethod.version;
      this.statisticalMethodLocal.releaseDate = this.statisticalMethod.releaseDate;
      this.statisticalMethodLocal.standardIstat = this.statisticalMethod.standardIstat;
    },
    backToList() {
      this.$router.push("/catalogue/metodi");
    }
  },
  created() {
    //this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.$store.dispatch("methods/findById", this.$route.params.id).then(() => {
      this.setOldValues();
    });
  }
};
</script>
<style scoped>
.vdpArrowPrev:after {
  border-right-color: #cc99cd;
}

.vdpArrowNext:after {
  border-left-color: #cc99cd;
}

.vdpCell.selectable:hover .vdpCellContent,
.vdpCell.selected .vdpCellContent {
  background: #cc99cd;
}

.vdpCell.today {
  color: #cc99cd;
}

.vdpTimeUnit > input:hover,
.vdpTimeUnit > input:focus {
  border-bottom-color: #cc99cd;
}
</style>
