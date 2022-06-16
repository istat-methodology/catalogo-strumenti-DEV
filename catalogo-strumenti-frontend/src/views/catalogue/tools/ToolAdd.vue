<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Nuovo Strumento metodologico</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome*"
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
          <div class="form-group" role="group">
            <label for="app-tree">Fasi GSBPM</label>

            <div id="app-tree" class="demo-tree">
              <treeselect
                v-model="toolLocal.gsbpmProcesses"
                :multiple="true"
                :options="getGsbpmList"
                :disable-branch-nodes="true"
                :show-count="true"
              />
            </div>
          </div>
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
          <label>Data di Rilascio</label>
          <div>
            <date-picker
              v-if="toolLocal"
              v-model="toolLocal.releaseDate"
              format="D/M/YYYY"
              value-type="format"
              placeholder="Seleziona una data"
            ></date-picker>
          </div>
          <br />
          <div class="form-group">
            <label for="checkbox">Standard Istat &nbsp;</label>
            <input
              id="checkbox"
              type="checkbox"
              v-model="toolLocal.standardIstat"
              true-value="1"
              false-value="0"
              aria-label="Standard Istat"
            />
          </div>
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
          <!-- <CInput
            label="Funzione"
            placeholder="Funzione"
            v-model="toolLocal.businessFunction"
          /> -->
        </CCardBody>
      </CCard>

      <CCardFooter>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          class="mr-2"
          @click.prevent="handleSubmit"
          >Salva</CButton
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
import "vue2-datepicker/index.css";
import DatePicker from "vue2-datepicker";
import Treeselect from "@riophae/vue-treeselect";
export default {
  name: "ToolAdd",
  components: {
    DatePicker,
    Treeselect
  },
  data() {
    return {
      toolLocal: {
        id: "",
        releaseDate: null,
        description: "",
        name: "",
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
        standardIstat: 0,
        gsbpmProcesses: [],
        statisticalMethods: [],
        linkAgentsTools: [],
        documentations: []
      },
      //gsbpmChecked: [],
      tipologia: 1,
      value: 0
    };
  },
  computed: {
    ...mapGetters("tooltype", ["tooltypeList"]),
    ...mapGetters("gsbpm", ["gsbpmList"]),
    getGsbpmList: function() {
      return this.gsbpmList.map(gsbpm => {
        return {
          // ...gsbpm,
          id: "id-" + gsbpm.id,
          label: gsbpm.code + " " + gsbpm.name,
          children: gsbpm.gsbpmSubProcesses.map(gsbpmSubProcess => {
            return {
              id: gsbpmSubProcess.id,
              label: gsbpmSubProcess.code + " " + gsbpmSubProcess.name
            };
          })
        };
      });
    }
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
    if (this.tooltypeList && this.tooltypeList.length > 0) {
      this.toolLocal.toolType = this.tooltypeList[0].id;
    }
  }
};
</script>
