<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <div class="row">
        <div class="col-8">
          <CCardHeader class="mt-4 no-border">
            <h2>
              Nuovo Metodo Statistico
              <div class="card-header-actions">
                <button
                  class="btn btn-outline-primary text-center"
                  @click.prevent="handleSubmit"
                  title="Salva nuovo metodo statistico"
                >
                  <floppy-icon title="Salva nuovo metodo statistico" />
                </button>
                <button
                  class="btn btn-outline-primary text-center"
                  @click.prevent="$router.back()"
                  title="Indietro"
                >
                  <close-icon title="Indietro" />
                </button>
              </div>
            </h2>
          </CCardHeader>

          <CCard>
            <CCardBody>
              <CInput
                label="Nome*"
                placeholder="Name"
                v-model="statisticalMethodLocal.name"
                :class="{
                  'is-invalid': $v.statisticalMethodLocal.name.$error,
                }"
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
                label="Requisiti/Ipotesi"
                placeholder="Requisiti/Ipotesi"
                v-model="statisticalMethodLocal.requirements"
              />
              <!-- <CInput
            label="Presupposti"
            placeholder="Presupposti"
            v-model="statisticalMethodLocal.assumptions"
          /> -->
              <CInput
                label="Limitazioni/Vincoli"
                placeholder="Limitazioni/Vincoli"
                v-model="statisticalMethodLocal.constraints"
              />
              <CInput
                label="Note"
                placeholder="Note"
                v-model="statisticalMethodLocal.notes"
              />
            </CCardBody>
          </CCard>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { required } from "vuelidate/lib/validators";
import { mapGetters } from "vuex";
export default {
  name: "ToolAdd",
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
      },
    };
  },
  computed: {
    /* ...mapGetters("auth", ["isReviewer", "isSupervisor"]), */
    /* ...mapGetters("address", ["assignedId", "assignedName"]), */

    ...mapGetters("tooltype", ["tooltypeList"]),
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
      /*  this.$v.$touch(); //validate form data
      if (!this.$v.tool.$invalid) {*/
      this.$v.$touch();
      if (!this.$v.statisticalMethodLocal.$invalid) {
        this.$store
          .dispatch("methods/save", this.statisticalMethodLocal)
          .then(this.$router.push("/catalogue/metodi"));
      }
    },
    goBack() {
      this.$router.push("/catalogue/metodi");
    },
    onChange(event) {
      this.tipologia = event.target.value;
    },
  },
  created() {
    this.$store.dispatch("tooltype/findAll");
  },
};
</script>

