<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader v-if="statservice"
          >Modifica Servizio Statistico</CCardHeader
        >
        <CCardBody>
          <CInput
            label="Metodi Esposti"
            placeholder="metodiEposti"
            v-model="statservice.metodiEsposti"
          />
          <CInput
            label="Dipendenze"
            placeholder="Dipendenze"
            v-model="statservice.dipendenze"
          />
          <CInput
            label="Potocollo"
            placeholder="Protocollo"
            v-model="statservice.protocollo"
          />
          <label>Strumento Metodologico</label>
          <v-select
            label="nome"
            :options="toolscatalog"
            :reduce="option => option.id"
            v-model="statservice.toolId"
            placeholder="Tool"
            :class="{
              'is-invalid': $v.statservice.toolId.$error
            }"
          ></v-select>
        </CCardBody>
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
            @click.prevent="backToList"
            >Back</CButton
          >
        </CCardFooter>
      </CCard>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import { required } from "vuelidate/lib/validators";
/* import { required } from "vuelidate/lib/validators"; */
export default {
  name: "StatServiceEdit",
  computed: {
    ...mapGetters("tools", ["toolscatalog"]),
    ...mapGetters("services", ["service"])
  },
  data() {
    return {
      statservice: {
        id: 0,
        metodiEsposti: "",
        dipendenze: "",
        protocollo: "",
        toolId: ""
      }
    };
  },
  validations: {
    statservice: {
      toolId: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      if (!this.$v.statservice.toolId.$invalid) {
        this.$store.dispatch("services/update", this.statservice).then(() => {
          this.backToList();
        });
      }
    },
    setOldValues() {
      this.statservice.id = this.service.id;
      this.statservice.metodiEsposti = this.service.metodiEsposti;
      this.statservice.dipendenze = this.service.dipendenze;
      this.statservice.protocollo = this.service.protocollo;
      this.statservice.toolId = this.service.tool.id;
    },

    backToList() {
      this.$router.push("/catalogue/statservicelist");
    }
  },
  created() {
    this.$store.dispatch("tools/findAll");
    this.$store
      .dispatch("services/findById", this.$route.params.id)
      .then(() => {
        this.setOldValues();
      });
  }
};
</script>
