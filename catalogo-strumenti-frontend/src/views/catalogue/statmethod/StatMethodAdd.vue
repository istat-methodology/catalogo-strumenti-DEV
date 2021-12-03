<template>
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>
          Nuovo Metodo Statistico
        </CCardHeader>
        <CCardBody>
          <div class="row">
            <div class="col-6">
              <CCard class="card-no-border">
                <CCardBody>
                  <CInput
                    label="Nome"
                    placeholder="nome"
                    v-model="statmethod.nome"
                  />
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
                  <label>Tool</label>
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
                    >Save</CButton
                  >
                  <CButton
                    shape="square"
                    size="sm"
                    color="light"
                    @click="goBack"
                    >Back</CButton
                  >
                </CCardFooter>
              </CCard>
            </div>
          </div>
        </CCardBody>
      </CCard>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
import { required } from "vuelidate/lib/validators";
export default {
  name: "StatMethodAdd",
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
        this.$store
          .dispatch("methods/save", this.statmethod)
          .then(this.$router.push("/catalogue/metodi"));
      }
    },
    goBack() {
      this.$router.push("/catalogue/metodi");
    }
  },
  created() {
    this.$store.dispatch("tools/findAll");
  }
};
</script>
