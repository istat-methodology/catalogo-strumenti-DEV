<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Nuovo Tool</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome"
            placeholder="Name"
            v-model="toolLocal.name"
            :class="{ 'is-invalid': $v.toolLocal.name.$error }"
          />
          <div class="help-block" :class="{ show: $v.toolLocal.name.$error }">
            Campo obbligatorio
          </div>
          <CInput
            label="Descrizione"
            placeholder="Descrizione"
            v-model="toolLocal.description"
          />
          <CInput
            label="Versione"
            placeholder="Versione"
            v-model="toolLocal.versione"
          />
          <CInput label="Tags" placeholder="Tags" v-model="toolLocal.tags" />

          <CInput
            label="Requisiti"
            placeholder="Requisiti"
            v-model="toolLocal.requirements"
          />
        </CCardBody>
      </CCard>
      <CCard>
        <CCardHeader>Tipologia</CCardHeader>
        <CCardBody v-if="tooltypeList">
          <select @change="onChange($event)" v-model="toolLocal.toolType">
            <option
              v-for="option in tooltypeList"
              v-bind:value="option.id"
              :key="option.id"
            >
              {{ option.name }}
            </option>
          </select>
          <!-- <select
            class="form-select"
            @change="onChange($event)"
            aria-label="Default select example"
          >
            <option selected>Tipologia</option>
            <option value="1">Servizio Statistico</option>
            <option value="2">Applicazione Desktop</option>
            <option value="3">Procedura Software</option>
          </select></CCardBody -->
        </CCardBody>
      </CCard>
      <CCard v-if="this.tipologia == '3'">
        <CCardHeader> Procedura Software</CCardHeader>
        <CCardBody>
          <CInput
            label="Codice"
            placeholder="Codice"
            v-model="toolLocal.code"
          />
          <CInput
            label="Download"
            placeholder="Download"
            v-model="toolLocal.download"
          />
          <CInput
            label="Flusso di lavoro"
            placeholder="Flusso di lavoro"
            v-model="toolLocal.workflow"
          />
          <CInput
            label="Linguaggio"
            placeholder="Linguaggio"
            v-model="toolLocal.language"
          />
          <CInput
            label="Dipendenze"
            placeholder="Dipendenze"
            v-model="toolLocal.depenencies"
          />
          <CInput
            label="Requisiti Tecnici"
            placeholder="Requisiti Tecnici"
            v-model="toolLocal.technicalRequirements"
          />
        </CCardBody>
      </CCard>
      <CCard v-if="this.tipologia == '2'">
        <CCardHeader> Applicazione Desktop</CCardHeader>
        <CCardBody>
          <CInput
            label="Download"
            placeholder="Download"
            v-model="toolLocal.download"
          />
          <CInput
            label="Licenza"
            placeholder="Licenza"
            v-model="toolLocal.licence"
          />
          <CInput
            label="Linguaggio"
            placeholder="Linguaggio"
            v-model="toolLocal.language"
          />
          <CInput
            label="Pacchetto"
            placeholder="Pacchetto"
            v-model="toolLocal.packageApplication"
          />
          <CInput
            label="Sistema Operativo"
            placeholder="Sistema Operativo"
            v-model="toolLocal.operativeSystem"
          />
          <CInput
            label="Verione"
            placeholder="Versione"
            v-model="toolLocal.version"
          />
          <CInput
            label="Requisiti Tecnici"
            placeholder="Requisiti Tecnici"
            v-model="toolLocal.technicalRequirements"
          />
        </CCardBody>
      </CCard>
      <CCard v-if="this.tipologia == '1'">
        <CCardHeader> Servizio Statistico</CCardHeader>
        <CCardBody>
          <CInput
            label="Potocollo"
            placeholder="Protocollo"
            v-model="toolLocal.protocol"
          />
          <CInput label="Url" placeholder="Url" v-model="toolLocal.url" />
          <CInput
            label="Contributi"
            placeholder="Contributi"
            v-model="toolLocal.outcomes"
          />
          <CInput
            label="Dipendenze"
            placeholder="Dipendenze"
            v-model="toolLocal.serviceDependencies"
          />
          <CInput
            label="Restrizioni"
            placeholder="Retrizioni"
            v-model="toolLocal.restrictions"
          />
          <CInput
            label="Funzione"
            placeholder="Funzione"
            v-model="toolLocal.businessFunction"
          />
        </CCardBody>
      </CCard>

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
          @click.prevent="$router.back()"
          >Indietro</CButton
        >
      </CCardFooter>
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
      toolLocal: {
        id: "",
        releaseDate: "",
        description: "",
        name: "",
        standardIstat: "",
        tags: "",
        version: "",
        toolType: "",
        service: "",

        requirements: "",
        download: "",
        licence: "",
        language: "",
        packageApplication: "",
        operativeSystem: "",
        technicalRequirements: "",
        code: "",
        dependencies: "",
        workflow: "",
        assumptions: "",
        constraints: "",
        notes: "",
        protocol: "",
        url: "",
        outcomes: "",
        serviceDependencies: "",
        restrictions: "",
        gsbpm: "",
        businessFunction: "",
        processDesign: ""
      },
      tipologia: 1,
      value: 0
    };
  },
  computed: {
    /* ...mapGetters("auth", ["isReviewer", "isSupervisor"]), */
    /* ...mapGetters("address", ["assignedId", "assignedName"]), */

    ...mapGetters("tooltype", ["tooltypeList"])
  },
  validations: {
    toolLocal: {
      name: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      this.$v.$touch(); //validate form data
      if (!this.$v.toolLocal.$invalid) {
        this.$store
          .dispatch("tools/save", this.toolLocal)
          .then(this.$router.push("/catalogue/tools"));
      }
    },
    goBack() {
      this.$router.push("/catalogue/tools");
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
