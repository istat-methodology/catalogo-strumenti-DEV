<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <div class="row">
        <div class="col-8">
          <CTitle
            title="Referente"
            buttonTitle=" Referente"
            functionality="Nuovo"
            :authenticated="isAuthenticated"
            :buttons="['salva', 'indietro']"
            @handleSubmit="handleSubmit"
          />
          <CCard>
            <CCardBody>
              <CInput
                label="Nome*"
                placeholder="Nome"
                v-model="agentLocal.name"
                :class="{ 'is-invalid': $v.agentLocal.name.$error }"
              />
              <div
                class="help-block"
                :class="{ show: $v.agentLocal.name.$error }"
              >
                Campo obbligatorio
              </div>
              <CInput
                label="Organizzazione"
                placeholder="Organizzazione"
                v-model="agentLocal.organization"
              />

              <CInput
                label="Contatto"
                placeholder="Contatto"
                v-model="agentLocal.contact"
              />
              <CTextarea
                label="Note"
                placeholder="Note"
                v-model="agentLocal.notes"
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
import CTitle from "../../../components/CTitle.vue";

//import { mapGetters } from "vuex";
export default {
  name: "documentationlAdd",
  components: { CTitle  },

  data() {
    return {
      agentLocal: {
        id: 0,
        name: "",
        organization: "",
        contact: "",
        notes: "",
      },
    };
  },
  computed: {
    //...mapGetters("documentation", ["documentation"])
  },
  validations: {
    agentLocal: {
      name: {
        required,
      },
    },
  },
  methods: {
    handleSubmit() {
      this.$v.$touch();
      if (!this.$v.agentLocal.$invalid) {
        this.$store
          .dispatch("agent/save", this.agentLocal)
          .then(this.$router.push("/catalogue/referenti"));
      }
    },
    goBack() {
      this.$router.push("/catalogue/referenti");
    },
    onChange(event) {
      this.tipologia = event.target.value;
    },
  },
  created() {
    this.$store.dispatch("agent/findAll");
  },
};
</script>
