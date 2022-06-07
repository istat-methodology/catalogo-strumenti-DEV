<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="statisticalMethodLocal">
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
          <CTextarea
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
          <CTextarea
            label="Note"
            placeholder="Note"
            v-model="statisticalMethodLocal.notes"
          />

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
            <date-picker
              v-if="releaseDate"
              v-model="releaseDate"
              format="D/M/YYYY"
              value-type="format"
              placeholder="Seleziona una data"
            ></date-picker>
          </div>

          <CInputCheckbox
            label="Standard Istat"
            placeholder="Standard Istat"
            
            v-model="checkStandardIstat"
          />
        </CCardBody>
      </CCard>
      <CCardFooter>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          class="mr-2"
          @click.prevent="handleSubmit"
          >Salva</CButton
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
import _ from "lodash";
import { mapGetters } from "vuex";
import DatePicker from "vue2-datepicker";
import "vue2-datepicker/index.css";
import { required } from "vuelidate/lib/validators";
export default {
  name: "ToolEdit",
  components: {
    DatePicker,
  },
  data() {
    return {
      checkStandardIstat: false,
      statisticalMethodLocal: {
        id: "",
        name: "",
        description: "",
        requirements: "",
        assumptions: "",
        constraints: "",
        notes: "",
        tags: "",
        version: "",
        releaseDate: "",
        standardIstat: "",
      },
    };
  },
  computed: {
    ...mapGetters("methods", ["statisticalMethod"]),
  },
  validations: {
    statisticalMethodLocal: {
      name: {
        required,
      },
    },
  },
  methods: {
    handleSubmit() {
      this.statisticalMethodLocal.releaseDate = this.releaseDate;
      this.statisticalMethodLocal.checkStandardIstat = this.checkStandardIstat
        ? 1
        : 0;
      this.$v.$touch();

      if (!this.$v.statisticalMethodLocal.$invalid) {
        this.$store
          .dispatch("methods/update", this.statisticalMethodLocal)
          .then(() => {
            this.loadMethod();
          });
      }
    },
    formatDate(dt) {
      dt = new Date(dt);
      return dt.toLocaleDateString("it");
    },
    setOldValues() {
      this.statisticalMethodLocal.id = this.statisticalMethod.id;
      this.statisticalMethodLocal.name = this.statisticalMethod.name;
      this.statisticalMethodLocal.description =
        this.statisticalMethod.description;
      this.statisticalMethodLocal.requirements =
        this.statisticalMethod.requirements;
      this.statisticalMethodLocal.assumptions =
        this.statisticalMethod.assumptions;
      this.statisticalMethodLocal.constraints =
        this.statisticalMethod.constraints;
      this.statisticalMethodLocal.notes = this.statisticalMethod.notes;
      this.statisticalMethodLocal.tags = this.statisticalMethod.tags;
      this.statisticalMethodLocal.version = this.statisticalMethod.version;
      //  this.statisticalMethodLocal.releaseDate =  this.statisticalMethod.releaseDate;

      this.statisticalMethodLocal.releaseDate = this.formatDate(
        this.statisticalMethod.releaseDate
      );
      this.releaseDate = this.formatDate(this.statisticalMethod.releaseDate);
      this.statisticalMethodLocal.standardIstat =
        this.statisticalMethod.standardIstat;
      this.checkStandardIstat = 1 == this.statisticalMethod.standardIstat;
    },
    backToList() {
      this.$router.push("/catalogue/metodi");
    },
    loadMethod: _.debounce(function () {
      this.$store
        .dispatch("methods/findById", this.$route.params.id)
        .then(() => {
          this.setOldValues();
        });
    }, 500),
  },
  created() {
    this.loadMethod();
  },
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
