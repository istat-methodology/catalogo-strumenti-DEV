<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader v-if="application">Desktop Application</CCardHeader>
        <CCardBody>
          <CInput
            label="Dipendenze"
            placeholder="Dipendenze"
            v-model="application.dipendenze"
          />
          <CInput
            label="Download"
            placeholder="Download"
            v-model="application.download"
          />
          <CInput
            label="Licenza"
            placeholder="Liceenza"
            v-model="application.licenza"
          />
          <CInput
            label="Linguaggio"
            placeholder="Linguaggio"
            v-model="application.linguaggio"
          />
          <CInput
            label="Pacchetto"
            placeholder="Pacchetto"
            v-model="application.pacchetto"
          />
          <CInput
            label="Sistema Operativo"
            placeholder="Sistema Operativo"
            v-model="application.sistemaOperativo"
          />
          <CInput label="Tool" placeholder="Tool" v-model="application.tool" />
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
/* import { required } from "vuelidate/lib/validators"; */
export default {
  name: "SoftwareAppEdit",
  computed: {
    ...mapGetters("applications", ["application"])
  },
  /* validations: {
    dug: {
      name: {
        required
      }
    }
  }, */
  methods: {
    handleSubmit() {
      /*  this.$v.$touch(); //validate form data
      if (!this.$v.dug.$invalid) { */
      this.$store.dispatch("applications/update", this.application).then(() => {
        this.backToList();
      });
      /*   } */
    },
    backToList() {
      this.$router.push("/catalogue/deskapplist");
    }
  },
  created() {
    this.$store.dispatch("applications/findById", this.$route.params.id);
  }
};
</script>
