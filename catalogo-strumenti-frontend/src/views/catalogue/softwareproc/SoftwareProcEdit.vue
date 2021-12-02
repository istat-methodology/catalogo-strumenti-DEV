<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader v-if="softproc">Modifica Applicazione Desktop</CCardHeader>
        <CCardBody>
          <CInput
            label="Codice"
            placeholder="Codice"
            v-model="softproc.codice"
          />
          <CInput
            label="Sintassi"
            placeholder="Sintassi"
            v-model="softproc.sintassi"
          />
          <CInput
            label="Dipendenze"
            placeholder="Dipendenze"
            v-model="softproc.dipendenze"
          />
          <CInput
            label="Linguaggio"
            placeholder="Linguaggio"
            v-model="softproc.linguaggio"
          />
          <label>Strumento Metodologico</label>
          <v-select
            label="nome"
            :options="toolscatalog"
            :reduce="option => option.id"
            v-model="softproc.toolId"
            placeholder="Tool"
            :class="{
              'is-invalid': $v.softproc.toolId.$error
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
  name: "SoftProcEdit",
  computed: {
    ...mapGetters("tools", ["toolscatalog"]),
    ...mapGetters("procedures", ["procedure"])
  },
  data() {
    return {
      softproc: {
        id: "",
        codice: "",
        sintassi: "",
        dipendenze: "",
        linguaggio: "",
        toolId: ""
      }
    };
  },
  validations: {
    softproc: {
      toolId: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      if (!this.$v.softproc.toolId.$invalid) {
        this.$store.dispatch("procedures/update", this.softproc).then(() => {
          this.backToList();
        });
      }
    },
    setOldValues() {
      this.softproc.id = this.procedure.id;
      this.softproc.codice = this.procedure.codice;
      this.softproc.sintassi = this.procedure.sintassi;
      this.softproc.dipendenze = this.procedure.dipendenze;
      this.softproc.linguaggio = this.procedure.linguaggio;
      this.softproc.toolId = this.procedure.tool.id;
    },

    backToList() {
      this.$router.push("/catalogue/softwareproclist");
    }
  },
  created() {
    this.$store.dispatch("tools/findAll");
    this.$store
      .dispatch("procedures/findById", this.$route.params.id)
      .then(() => {
        this.setOldValues();
      });
  }
};
</script>
