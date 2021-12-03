<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader v-if="deskapp">Modifica Applicazione Desktop</CCardHeader>
        <CCardBody>
          <CInput
            label="Dipendenze"
            placeholder="Dipendenze"
            v-model="deskapp.dipendenze"
          />
          <CInput
            label="Download"
            placeholder="Download"
            v-model="deskapp.download"
          />
          <CInput
            label="Licenza"
            placeholder="Liceenza"
            v-model="deskapp.licenza"
          />
          <CInput
            label="Linguaggio"
            placeholder="Linguaggio"
            v-model="deskapp.linguaggio"
          />
          <CInput
            label="Pacchetto"
            placeholder="Pacchetto"
            v-model="deskapp.pacchetto"
          />
          <CInput
            label="Sistema Operativo"
            placeholder="Sistema Operativo"
            v-model="deskapp.sistemaOperativo"
          />
          <label>Strumento Metodologico</label>
          <v-select
            label="nome"
            :options="toolscatalog"
            :reduce="option => option.id"
            v-model="deskapp.tool"
            placeholder="Tool"
            :class="{
              'is-invalid': $v.deskapp.tool.$error
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
  name: "DeskAppEdit",
  computed: {
    ...mapGetters("tools", ["toolscatalog"]),
    ...mapGetters("applications", ["application"])
  },
  data() {
    return {
      deskapp: {
        id: "",
        dipendenze: "",
        download: "",
        licenza: "",
        linguaggio: "",
        pacchetto: "",
        sistemaOperativo: "",
        tool: ""
      }
    };
  },
  validations: {
    deskapp: {
      tool: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      if (!this.$v.deskapp.tool.$invalid) {
        this.$store.dispatch("applications/update", this.deskapp).then(() => {
          this.backToList();
        });
      }
    },
    setOldValues() {
      this.deskapp.id = this.application.id;
      this.deskapp.dipendenze = this.application.dipendenze;
      this.deskapp.download = this.application.download;
      this.deskapp.licenza = this.application.licenza;
      this.deskapp.linguaggio = this.application.linguaggio;
      this.deskapp.pacchetto = this.application.pacchetto;
      this.deskapp.sistemaOperativo = this.application.sistemaOperativo;
      this.deskapp.tool = this.application.tool.id;
    },

    backToList() {
      this.$router.push("/catalogue/applicazioni");
    }
  },
  created() {
    this.$store.dispatch("tools/findAll");
    this.$store
      .dispatch("applications/findById", this.$route.params.id)
      .then(() => {
        this.setOldValues();
      });
  }
};
</script>
