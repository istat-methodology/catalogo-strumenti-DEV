<template>
  <!-- wait until service is loaded -->
  <div>
    <div class="col-12 p-0">
      <CTitle
        title="Nuovo Referente"
        buttonTitle=" Nuovo Referente"
        functionality=""
        :authenticated="isAuthenticated"
        :buttons="['salva', 'indietro']"
        @handleSubmit="handleSubmit"
        @handleBack="goBack(false)" />
    </div>
    <CCard class="col-12 p-0">
      <CCardBody>
        <CInput
          label="Nome"
          placeholder="Nome"
          v-model="agentLocal.name"
          :class="{ 'is-invalid': $v.agentLocal.name.$error }" />
        <div class="help-block" :class="{ show: $v.agentLocal.name.$error }">
          Campo obbligatorio
        </div>
        <CInput
          label="Organizzazione"
          placeholder="Organizzazione"
          v-model="agentLocal.organization" />
        <CInput
          label="Contatto"
          placeholder="Contatto"
          v-model="agentLocal.contact" />
        <CTextarea label="Note" placeholder="Note" v-model="agentLocal.notes" />
      </CCardBody>
    </CCard>
  </div>
</template>
<script>
import { required } from "vuelidate/lib/validators"
import { mapGetters } from "vuex"
import CTitle from "@/components/CTitle.vue"
export default {
  name: "AgentAdd",
  components: { CTitle },
  data() {
    return {
      agentLocal: {
        id: 0,
        name: "",
        organization: "",
        contact: "",
        notes: ""
      }
    }
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"])
  },
  emits: ["appClose"],
  props: {
    goBackClose: {
      type: Boolean,
      required: false,
      default: () => false
    }
  },
  validations: {
    agentLocal: {
      name: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      this.$v.$touch() //validate form data
      if (!this.$v.agentLocal.$invalid) {
        this.$store
          .dispatch("agent/save", this.agentLocal)
          .then(this.$store.dispatch("agent/findAll"))
          .then(this.goBack(true))
      }
    },
    goBack(saved) {
      if (this.goBackClose) this.$emit("appClose", saved)
      else this.$router.push("/catalogue/referenti")
    },
    onChange(event) {
      this.tipologia = event.target.value
    }
  },
  created() {
    this.$store.dispatch("agent/findAll")
  }
}
</script>
