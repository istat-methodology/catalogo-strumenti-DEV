<template>
  <!-- wait until service is loaded -->
  <div class="col-8">
    <CTitle
      title="Metodo Statistico"
      buttonTitle="Metodo Statistico"
      functionality="Nuovo"
      :authenticated="isAuthenticated"
      :buttons="['salva', 'indietro']"
      @handleSubmit="handleSubmit"
      @handleBack="handleBack"
    />
    <CCard>
      <CCardBody>
        <CInput
          label="Nome*"
          placeholder="Name"
          v-model="statisticalMethodLocal.name"
          :class="{
            'is-invalid': $v.statisticalMethodLocal.name.$error
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
</template>
<script>
import { required } from "vuelidate/lib/validators";
import { mapGetters } from "vuex";
import CTitle from "../../../components/CTitle.vue";

export default {
  name: "ToolAdd",
  components: {
    CTitle
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
        notes: ""
      }
    };
  },
  computed: {
    /* ...mapGetters("auth", ["isReviewer", "isSupervisor"]), */
    /* ...mapGetters("address", ["assignedId", "assignedName"]), */

    ...mapGetters("tooltype", ["tooltypeList"]),
    ...mapGetters("auth", ["isAuthenticated"])
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
      /*  this.$v.$touch(); //validate form data
      if (!this.$v.tool.$invalid) {*/
      this.$v.$touch();
      if (!this.$v.statisticalMethodLocal.$invalid) {
        this.$store
          .dispatch("methods/save", this.statisticalMethodLocal)
          .then(this.$router.push("/catalogue/metodi"));
      }
    },
    handleBack() {
      this.$router.push({ name: "MethodList" });
    },
    onChange(event) {
      this.tipologia = event.target.value;
    }
  },
  created() {
    this.$store.dispatch("tooltype/findAll");
  }
};
</script>
