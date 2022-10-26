<template>
  <!-- wait until service is loaded -->
  <div class="col-8">
    <CTitle
      title="Strumento Metodologico"
      buttonTitle=" Strumento Metodologico"
      functionality="Nuovo"
      :authenticated="isAuthenticated"
      :buttons="['salva', 'indietro']"
      @handleSubmit="handleSubmit"
    />
    <CCard>
      <CCardBody v-if="tooltypeList">
        <div class="row mt-2">
          <div class="col-12">
            <h4 class="p-1">Seleziona la Tipologia</h4>
            <select
              class="p-1 ml-1"
              @change="onChangeToolType($event)"
              v-model="toolLocal.toolType"
            >
              <option
                v-for="option in tooltypeList"
                v-bind:value="option.id"
                :key="option.id"
              >
                {{ option.name }}
              </option>
            </select>
          </div>
        </div>

        <div class="row mt-2">
          <div class="col-6">
            <h4 class="mt-2 ml-1">Informazioni Generali</h4>
            <CCard class="p-1 ml-1">
              <CCardBody>
                <CInput
                  label="Nome*"
                  placeholder="Name"
                  v-model="toolLocal.name"
                  :class="{ 'is-invalid': $v.toolLocal.name.$error }"
                />
                <div
                  class="help-block"
                  :class="{ show: $v.toolLocal.name.$error }"
                >
                  Campo obbligatorio
                </div>
                <CTextarea
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
                <CInput
                  label="Tags"
                  placeholder="Tags"
                  v-model="toolLocal.tags"
                />

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
          </div>
          <div class="col-6">
            <h4 class="mt-2 ml-1">{{ this.tipologia.name }}</h4>
            <CCard>
              <CCardBody v-if="tooltypeList">
                <div v-if="this.tipologia.id == '3'">
                  <!-- Procedura Software -->
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
                </div>
                <div v-if="this.tipologia.id == '2'">
                  <!--Applicazione Desktop -->
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
                </div>
                <div v-if="this.tipologia.id == '1'">
                  <!-- Servizio Statistico -->
                  <CInput
                    label="Potocollo"
                    placeholder="Protocollo"
                    v-model="toolLocal.protocol"
                  />
                  <CInput
                    label="Url"
                    placeholder="Url"
                    v-model="toolLocal.url"
                  />
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
                </div>
              </CCardBody>
            </CCard>
          </div>
        </div>
      </CCardBody>
    </CCard>
  </div>
</template>
<script>
import { required } from "vuelidate/lib/validators";
import { mapGetters } from "vuex";
import "vue2-datepicker/index.css";
import DatePicker from "vue2-datepicker";
import Treeselect from "@riophae/vue-treeselect";
import CTitle from "../../../components/CTitle.vue";
export default {
  name: "ToolAdd",
  components: {
    DatePicker,
    Treeselect,
    CTitle,
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
        documentations: [],
      },
      //gsbpmChecked: [],

      /*tipologia: 0,      */

      tipologia: {
        id: 9,
        name: "Tipologia",
      },
    };
  },
  computed: {
    ...mapGetters("tooltype", ["tooltypeList"]),
    ...mapGetters("gsbpm", ["gsbpmList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    getGsbpmList: function () {
      return this.gsbpmList.map((gsbpm) => {
        return {
          // ...gsbpm,
          id: "id-" + gsbpm.id,
          label: gsbpm.code + " " + gsbpm.name,
          children: gsbpm.gsbpmSubProcesses.map((gsbpmSubProcess) => {
            return {
              id: gsbpmSubProcess.id,
              label: gsbpmSubProcess.code + " " + gsbpmSubProcess.name,
            };
          }),
        };
      });
    },
  },
  validations: {
    toolLocal: {
      name: {
        required,
      },
    },
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
    onChangeTipologia(value) {
      this.tipologia.id = value.id;
    },
    onChangeToolType(event) {
      this.tipologia.id = event.target.value;
    },
  },
  created() {
    this.$store.dispatch("tooltype/findAll");
    if (this.tooltypeList && this.tooltypeList.length > 0) {
      this.toolLocal.toolType = this.tooltypeList[0].id;
    }
  },
};
</script>
