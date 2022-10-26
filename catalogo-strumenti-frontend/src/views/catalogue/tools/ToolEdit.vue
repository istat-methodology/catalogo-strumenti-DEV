<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-10">
      <div v-if="tool">
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-9 p-0 pl-4">
            <div class="col-12 p-0 pl-2">
              <h1 class="uppercase text-right p-0 pt-2 text-info">
                <span>
                  <span class="p-0">{{ tool.name | dashEmpty }}</span>
                  <h4 class="bg-secondary p-0">
                    <span class="pr-1 text-color-title">Modifica</span>
                  </h4>
                </span>
              </h1>
            </div>
          </div>
        </div>
        <CTabs
          variant="pills"
          :vertical="{ navs: 'col-md-3', content: 'col-md-9 p-0 pl-4' }"
        >
          <CTab>
            <template #title>
              <span>Informazioni Generali</span>
            </template>

            <div v-if="tool" class="row p-0">
              <div class="col-12 p-0">
                <CCardHeader class="no-border p-0 pr-1 mt-4">
                  <h2>
                    Informazioni Generali
                    <div class="card-header-actions">
                      <button
                        class="btn btn-outline-primary text-center"
                        @click.prevent="handleSubmit"
                        title="Aggiorna"
                      >
                        <floppy-icon title="Aggiorna" />
                      </button>
                      <button
                        class="btn btn-outline-primary text-center"
                        @click.prevent="$router.back()"
                        title="Indietro"
                      >
                        <close-icon title="Indietro" />
                      </button>
                    </div>
                  </h2>
                </CCardHeader>
              </div>
              <CCard class="col-12 p-0">
                <CCardBody>
                  <CInput
                    label="Nome"
                    placeholder="Nome"
                    v-model="toolLocal.name"
                  />
                  <CTextarea
                    label="Descrizione"
                    placeholder="Descrizione"
                    v-model="toolLocal.description"
                  />
                  <div class="form-group" role="group">
                    <label for="app-tree">Fasi GSBPM</label>
                    <div id="app-tree" class="demo-tree">
                      <treeselect
                        v-model="gsbpmChecked"
                        :multiple="true"
                        :options="getGsbpmList"
                        :disable-branch-nodes="true"
                        :show-count="true"
                      />
                    </div>
                  </div>
                  <!-- 
                        <CInput
                          label="Versione"
                          placeholder="Versione"
                           v-model="toolLocal.version"
                        /> 
                  -->
                  <CTextarea
                    label="Tags"
                    placeholder="Tags"
                    v-model="toolLocal.tags"
                  />
                  <CInput
                    label="Requisiti per l’applicabilità dello strumento"
                    placeholder="Requisiti per l’applicabilità dello strumento"
                    v-model="toolLocal.requirements"
                  />
                  <label>Data di rilascio</label>
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
          </CTab>
          <CTab>
            <!--
            statistical service, desktop application, procedure
            -->
            <template #title>
              <span>{{ toolLocal.toolType.name | dashEmpty }}</span>
            </template>
            <div class="row p-0">
              <div class="col-12 p-0">
                <CCardHeader class="no-border p-0 pr-1 mt-4">
                  <h2>
                    {{ toolLocal.toolType.name | dashEmpty }}
                    <div class="card-header-actions">
                      <button
                        class="btn btn-outline-primary text-center"
                        @click.prevent="handleSubmit"
                        title="Aggiorna"
                      >
                        <floppy-icon title="Aggiorna" />
                      </button>
                      <button
                        class="btn btn-outline-primary text-center"
                        @click.prevent="$router.back()"
                        title="Indietro"
                      >
                        <close-icon title="Indietro" />
                      </button>
                    </div>
                  </h2>
                </CCardHeader>
                <CCard>
                  <CCardBody>
                    <div v-if="toolLocal && toolLocal.toolType.id == 3">
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
                    <div v-if="tool && tool.toolType.id == 2">
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
                    <div v-if="tool && tool.toolType.id == 1">
                      <CInput
                        label="Protocollo"
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
                      <CInput
                        label="Restrizioni"
                        placeholder="Retrizioni"
                        v-model="toolLocal.restrictions"
                      />
                    </div>
                  </CCardBody>
                </CCard>
              </div>
            </div>
          </CTab>
          <CTab>
            <!--
            metodi statistici          
            --->
            <template #title>
              <span>Metodi Statistici</span>
            </template>
            <div v-if="this.statisticalMethodsList" class="row p-0">
              <div class="col-12 p-0">
                <CCardHeader class="no-border p-0 pr-1 mt-4">
                  <h2>
                    Metodi Statistici
                    <div class="card-header-actions">
                      <button
                        class="btn btn-outline-primary text-center"
                        @click.prevent="handleSubmit"
                        title="Aggiorna"
                      >
                        <floppy-icon title="Aggiorna" />
                      </button>
                      <button
                        class="btn btn-outline-primary text-center"
                        @click.prevent="$router.back()"
                        title="Indietro"
                      >
                        <close-icon title="Indietro" />
                      </button>
                    </div>
                  </h2>
                </CCardHeader>
                <CCard>
                  <CCardBody>
                    <div id="app-tree1" class="demo-tree">
                      <treeselect
                        v-model="methodsChecked"
                        :multiple="true"
                        :options="getMethodsList"
                        :disable-branch-nodes="true"
                        :show-count="true"
                      />
                    </div>
                  </CCardBody>
                </CCard>
              </div>
            </div>
          </CTab>
          <CTab>
            <template #title>
              <span>Moduli implementati</span>
            </template>
            <div class="row p-0">
              <div class="col-12 p-0">
                <app-edit-business-service
                  v-if="this.tool.businessService"
                  :businessServiceID="this.tool.businessService.id"
                  :toolName="this.tool.name"
                ></app-edit-business-service>
              </div>
            </div>
          </CTab>
          <CTab>
            <template #title>
              <span>Referenti</span>
            </template>
            <div class="row p-0">
              <div class="col-12 p-0">
                <app-linkedAgents
                  :toolId="tool.id"
                  :toolName="this.tool.name"
                ></app-linkedAgents>
              </div>
            </div>
          </CTab>
          <CTab>
            <template #title>
              <span>Documentazione</span>
            </template>
            <div v-if="this.tool">
              <div class="row p-0">
                <div class="col-12 p-0">
                  <app-edit-documentation
                    :parentName="this.tool.name"
                    @updateParent="loadTool"
                    :documentations="getDocumentation"
                    :toolId="this.tool.id"
                  >
                  </app-edit-documentation>
                </div>
              </div>
            </div>
          </CTab>
        </CTabs>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import _ from "lodash";
import { Context } from "@/common";
import Treeselect from "@riophae/vue-treeselect";
import "vue2-datepicker/index.css";
import DatePicker from "vue2-datepicker";

import DocumentationEditView from "../documentation/shared/DocumentationEditView";
import LinkedAgentView from "../agent/shared/LinkedAgentEditView";
import BusinessServiceEditView from "../tools/shared/BusinessServiceEditView";

/* import { required } from "vuelidate/lib/validators"; */
export default {
  name: "ToolEdit",
  components: {
    Treeselect,
    DatePicker,
    "app-edit-documentation": DocumentationEditView,
    "app-edit-business-service": BusinessServiceEditView,
    "app-linkedAgents": LinkedAgentView,
  },
  data() {
    return {
      toolLocal: {
        id: "",
        releaseDate: "",
        description: "",
        name: "",
        standardIstat: 0,
        tags: "",
        version: "",
        toolType: "",
        service: "",
        lastUpdate: "",
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
        statisticalMethods: [],
        gsbpmProcesses: [],
      },
      linkedToolList: [],
      gsbpmChecked: [],
      methodsChecked: [],
      agentChecked: [],
      documentationChecked: [],

      elenco: [],
    };
  },
  computed: {
    ...mapGetters("tools", ["tool"]),
    ...mapGetters("gsbpm", ["gsbpmList"]),
    ...mapGetters("tooltype", ["tooltypeList"]),
    ...mapGetters("methods", ["statisticalMethodsList"]),

    ...mapGetters("documentation", ["documentationList"]),
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
    getMethodsList: function () {
      return this.statisticalMethodsList.map((method) => {
        return {
          id: method.id,
          label: method.name,
        };
      });
    },
    getDocumentationList: function () {
      return this.documentationList.map((doc) => {
        return {
          id: doc.id,
          label: doc.name,
        };
      });
    },
    getLinkedAgentList: function () {
      if (this.tool)
        return this.tool.linkAgentsTools.map((agentTool) => {
          return {
            id: agentTool.id,
            tooId: this.tool.id,
            agentId: agentTool.agent.id,
            agentName: agentTool.agent.name,
            agentOrganization: agentTool.agent.organization,
            agentContact: agentTool.agent.contact,
            agentNotes: agentTool.agent.notes,
            role: agentTool.role,
            notes: agentTool.notes,
            referenceDate: agentTool.referenceDate,
          };
        });
      else return [];
    },
    getDocumentation: function () {
      if (this.tool) {
        return this.tool.documentations.map((doc) => {
          return {
            id: doc.id,
            name: doc.name,
            publisher: doc.publisher,
            documentType: doc.documentType.name,
            resource: doc.resource,
          };
        });
      } else return [];
    },
  },

  methods: {
    handleSubmit() {
      this.toolLocal.toolType = this.tool.toolType.id;
      this.toolLocal.statisticalMethods = this.methodsChecked;
      this.toolLocal.gsbpmProcesses = this.gsbpmChecked;

      this.$store.dispatch("tools/update", this.toolLocal).then(() => {
        this.loadTool();
      });
    },

    setCheckedNodesGsbpm() {
      this.gsbpmChecked = [];
      this.tool.gsbpmProcesses.map((gsbpmProc) => {
        this.gsbpmChecked.push(gsbpmProc.id);
      });
    },

    setCheckedNodesMethods() {
      this.methodsChecked = [];
      this.tool.statisticalMethods.map((method) => {
        this.methodsChecked.push(method.id);
      });
    },
    setCheckedNodesDocumentation() {
      this.documentationChecked = [];
      this.tool.documentations.map((doc) => {
        this.documentationChecked.push(doc.id);
      });
    },

    formatDate(dt) {
      console.log(dt);
      dt = new Date(dt);
      return dt;
    },

    setOldValues() {
      this.toolLocal.id = this.tool.id;
      this.toolLocal.releaseDate = this.formatDate(this.tool.releaseDate);
      this.toolLocal.description = this.tool.description;
      this.toolLocal.name = this.tool.name;
      this.toolLocal.standardIstat = this.tool.standardIstat;
      this.toolLocal.tags = this.tool.tags;
      this.toolLocal.version = this.tool.version;
      this.toolLocal.toolType = this.tool.toolType;
      this.toolLocal.service = this.tool.service;
      this.toolLocal.lastUpdate = this.tool.lastUpate;
      this.toolLocal.requirements = this.tool.requirements;
      this.toolLocal.download = this.tool.download;
      this.toolLocal.licence = this.tool.licence;
      this.toolLocal.language = this.tool.language;
      this.toolLocal.packageApplication = this.tool.packageApplication;
      this.toolLocal.operativeSystem = this.tool.operativeSystem;
      this.toolLocal.technicalRequirements = this.tool.technicalRequirements;
      this.toolLocal.code = this.tool.code;
      this.toolLocal.dependencies = this.tool.dependencies;
      this.toolLocal.workflow = this.tool.workFlow;
      this.toolLocal.assumptions = this.tool.assumption;
      this.toolLocal.constraints = this.tool.constraints;
      this.toolLocal.notes = this.tool.notes;
      this.toolLocal.protocol = this.tool.protocol;
      this.toolLocal.url = this.tool.url;
      this.toolLocal.outcomes = this.tool.outcomes;
      this.toolLocal.serviceDependencies = this.tool.serviceDepenencies;
      this.toolLocal.restrictions = this.tool.restrictions;

      this.toolLocal.businessFunction = this.tool.buinessFunction;
      this.toolLocal.processDesign = this.tool.processDesign;
      this.toolLocal.statisticalMethods = this.tool.statisticalMethods;
      this.toolLocal.gsbpmProcesses = this.tool.gsbpmProcesses;
    },
    backToList() {
      this.$router.push("/catalogue/tools");
    },
    loadTool: _.debounce(function () {
      this.$store.dispatch("tools/findById", this.$route.params.id).then(() => {
        if (this.tool) {
          this.setOldValues();
          this.setCheckedNodesGsbpm();
          this.setCheckedNodesMethods();
          this.setCheckedNodesDocumentation();
        }
      });
    }, 700),
  },

  created() {
    //this.$store.dispatch("tools/findById", this.$route.params.id);
    this.$store.dispatch("coreui/setContext", Context.ToolEdit);

    this.loadTool();

    this.$store.dispatch("gsbpm/findAll");
    this.$store.dispatch("tooltype/findAll");
    this.$store.dispatch("methods/findAll");
    this.$store.dispatch("documentation/findAll");
    this.$store.dispatch("agent/findAll");
  },
};
</script>


<style scoped>
.bg-info {
  background-color: #f7faff !important;
}
.text-color-title {
  color: #3780bd !important;
  transition: color 0.5s !important;
}
</style>