<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader v-if="statmethod">Modifica Metodo Statistico</CCardHeader>
        <CCardBody>
          <CInput label="Nome" placeholder="nome" v-model="statmethod.nome" />
          <CInput
            label="Autore"
            placeholder="autore"
            v-model="statmethod.autore"
          />
          <CInput
            label="Obiettivo"
            placeholder="obiettivo"
            v-model="statmethod.obiettivo"
          />
          <CInput
            label="Desrizione"
            placeholder="descrizione"
            v-model="statmethod.descrizione"
          />
          <CInput
            label="Genealita"
            placeholder="generalita"
            v-model="statmethod.generalita"
          />
          <CInput
            label="Ipotesi"
            placeholder="ipotesi"
            v-model="statmethod.ipotesi"
          />
          <CInput
            label="Limiti"
            placeholder="limiti"
            v-model="statmethod.limiti"
          />
          <CInput
            label="IndicatoriQualita"
            placeholder="Indicatori di Qualita"
            v-model="statmethod.indicatoriQualita"
          />
          <label>Strumento Metodologico</label>
          <v-select
            label="nome"
            :options="toolscatalog"
            :reduce="option => option.id"
            v-model="statmethod.toolId"
            placeholder="Tool"
            :class="{
              'is-invalid': $v.statmethod.toolId.$error
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
  name: "StatMethodEdit",
  computed: {
    ...mapGetters("tools", ["toolscatalog"]),
    ...mapGetters("methods", ["method"])
  },
  data() {
    return {
      statmethod: {
        id: 0,
        nome: "",
        autore: "",
        obiettivo: "",
        descrizione: "",
        generalita: "",
        ipotesi: "",
        limiti: "",
        indicatoriQualita: "",
        toolId: ""
      }
    };
  },
  validations: {
    statmethod: {
      toolId: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      if (!this.$v.statmethod.toolId.$invalid) {
        this.$store.dispatch("methods/update", this.statmethod).then(() => {
          this.backToList();
        });
      }
    },
    setOldValues() {
      this.statmethod.id = this.method.id;
      this.statmethod.nome = this.method.nome;
      this.statmethod.autore = this.method.autore;
      this.statmethod.obiettivo = this.method.obiettivo;
      this.statmethod.descrizione = this.method.descrizione;
      this.statmethod.generalita = this.method.generalita;
      this.statmethod.ipotesi = this.method.ipotesi;
      this.statmethod.limiti = this.method.limiti;
      this.statmethod.indicatoriQualita = this.indicatoriQualita;
      this.statmethod.toolId = this.method.tool.id;
    },

    backToList() {
      this.$router.push("/catalogue/metodi");
    }
  },
  created() {
    this.$store.dispatch("tools/findAll");
    this.$store.dispatch("methods/findById", this.$route.params.id).then(() => {
      this.setOldValues();
    });
  }
};
</script>
