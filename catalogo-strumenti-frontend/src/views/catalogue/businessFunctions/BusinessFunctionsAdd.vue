<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <div class="row">
        <div class="col-8">
          <CTitle
            title=" Business Function"
            buttonTitle=" Business Function"
            functionality="Nuovo"
            :authenticated="isAuthenticated"
            :buttons="['salva', 'indietro']"
            @handleSubmit="handleSubmit"
            @handleBack="handleBack" />

          <CCard>
            <CCardBody>
              <CInput
                label="Nome*"
                placeholder="Nome"
                v-model="businessFunctionLocal.name"
                :class="{
                  'is-invalid': $v.businessFunctionLocal.name.$error
                }" />
              <div
                class="help-block"
                :class="{ show: $v.businessFunctionLocal.name.$error }">
                Campo obbligatorio
              </div>
              <CTextarea
                label="Descrizione"
                placeholder="Descrizione"
                v-model="businessFunctionLocal.descr" />
              <CInput
                label="Etichetta"
                placeholder="Etichetta"
                v-model="businessFunctionLocal.label" />
            </CCardBody>
          </CCard>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { required } from "vuelidate/lib/validators"
import { mapGetters } from "vuex"
import CTitle from "@/components/CTitle.vue"
export default {
  name: "businessFunctionsAdd",
  components: { CTitle },
  data() {
    return {
      businessFunctionLocal: {
        id: "0",
        name: "",
        descr: "",
        label: "",
        businessProcesses: []
      }
    }
  },
  validations: {
    businessFunctionLocal: {
      name: {
        required
      }
    }
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bFunction", ["bFunction"])
  },
  methods: {
    handleSubmit() {
      this.$v.$touch() //validate form data
      if (!this.$v.businessFunctionLocal.$invalid) {
        this.$store
          .dispatch("bFunction/save", this.businessFunctionLocal)
          .then(this.$router.push("/catalogue/businessfunctions"))
      }
    },

    handleBack() {
      this.$router.push("/catalogue/businessfunctions")
    }
  },
  created() {
    this.$store.dispatch("bFunction/findAll")
  }
}
</script>
