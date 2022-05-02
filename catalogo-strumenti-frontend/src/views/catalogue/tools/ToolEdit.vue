<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <div v-if="tool">
        <CCardHeader
          >{{ tool.name | dashEmpty }}
          <div class="card-header-actions">
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
          </div>
        </CCardHeader>

        <CTabs
          variant="pills"
          :vertical="{ navs: 'col-md-3', content: 'col-md-9' }"
        >
          <CTab>
            <template #title>
              <span>Strumento</span>
            </template>

            <CCard v-if="tool">
              <CCardHeader>{{ tool.name | dashEmpty }}</CCardHeader>
              <CCardBody>
                <CInput
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
                      @select="onNodeCheckedGsbpm"
                      @deselect="onNodeUncheckedGsbpm"
                    />
                  </div>
                </div>
                <CInput
                  label="Versione"
                  placeholder="Versione"
                  v-model="toolLocal.version"
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
              </CCardBody>
            </CCard>

            <!-- <CCard v-if="this.agentList">
        <CCardHeader>Referenti</CCardHeader>
        <CCardBody>
          <div id="app-tree1" class="demo-tree">
            <treeselect
              v-model="agentChecked"
              :multiple="true"
              :options="getAgentList"
              :disable-branch-nodes="true"
              :show-count="true"
              @select="onNodeCheckedAgent"
              @deselect="onNodeUncheckedAgent"
            />
          </div>
        </CCardBody>
      </CCard> -->
            <!-- <CCard v-if="this.documentationList">
        <CCardHeader>Documentazione</CCardHeader>
        <CCardBody>
          <div id="app-tree3" class="demo-tree">
            <treeselect
              v-model="documentationChecked"
              :multiple="true"
              :options="getDocumentationList"
              :disable-branch-nodes="true"
              :show-count="true"
              @select="onNodeCheckedDocumentation"
              @deselect="onNodeUncheckedDocumentation"
            />
          </div>
        </CCardBody>
      </CCard> -->
          </CTab>
          <CTab>
            <template #title>
              <span>{{ tool.toolType.name | dashEmpty }}</span>
            </template>

            <CCard v-if="tool && tool.toolType.id == 3">
              <CCardHeader> {{ tool.toolType.name | dashEmpty }}</CCardHeader>
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
            <CCard v-if="tool && tool.toolType.id == 2">
              <CCardHeader> {{ tool.toolType.name | dashEmpty }}</CCardHeader>
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
            <CCard v-if="tool && tool.toolType.id == 1">
              <CCardHeader> {{ tool.toolType.name | dashEmpty }}</CCardHeader>
              <CCardBody>
                <CInput
                  label="Protocollo"
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
               
              </CCardBody>
            </CCard>
          </CTab>
          <CTab>
            <template #title>
              <span>Metodi Statistici</span>
            </template>

            <CCard v-if="this.statisticalMethodsList">
              <CCardHeader>Metodi Statistici</CCardHeader>
              <CCardBody>
                <div id="app-tree1" class="demo-tree">
                  <treeselect
                    v-model="checkedNodesMethods"
                    :multiple="true"
                    :options="getMethodsList"
                    :disable-branch-nodes="true"
                    :show-count="true"
                    @select="onNodeCheckedMethods"
                    @deselect="onNodeUncheckedMethods"
                  />
                </div>
              </CCardBody>
            </CCard>
          </CTab>
          <CTab>
            <template #title>
              <span>Referenti</span>
            </template>

            <app-linkedAgents :toolId="tool.id"></app-linkedAgents>
          </CTab>
          <CTab>
            <template #title>
              <span>Documentazione</span>
            </template>

            <CCard v-if="this.tool">
              <CCardHeader>Documentazione </CCardHeader>
              <CCardBody>
                <app-edit-documentation @refreshTool="loadTool" :documentations="getDocumentation" :toolId="this.tool.id">
                 </app-edit-documentation>

              </CCardBody>
            </CCard>
          </CTab>
        </CTabs>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
import Treeselect from "@riophae/vue-treeselect";

import DocumentationEditView from "../documentation/shared/DocumentationEditView";
import LinkedAgentView from "../agent/shared/LinkedAgentEditView";

/* import { required } from "vuelidate/lib/validators"; */
export default {
  name: "ToolEdit",
  components: {
    Treeselect,
    "app-edit-documentation": DocumentationEditView,
    "app-linkedAgents": LinkedAgentView,
  },
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
        businessFunction: "",
        processDesign: "",
        statisticalMethods:[],
        gsbpmProcesses:	[]
      },
      linkedToolList: [],
      gsbpmChecked: [],
      checkedNodesGsbpm: [],
      checkedNodesMethods: [],
      checkedNodesDocumentation: [],
      checkedNodesAgent: [],
      methodsChecked: [],
      agentChecked: [],
      documentationChecked: [],
      //toolNodes: [],
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
          label: gsbpm.name,
          children: gsbpm.gsbpmSubProcesses.map((gsbpmSubProcess) => {
            return {
              id: gsbpmSubProcess.id,
              label: gsbpmSubProcess.name,
              /* state: {
                selected: this.toolNodes.includes(gsbpmSubProcess.id)
                  ? true
                  : false
              } */
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
      if (this.tool)
        return this.tool.documentations.map((doc) => {
          return {
            id: doc.id,
            name: doc.name,
            publisher: doc.publisher,
            documentType: doc.documentType.name,
            resource: doc.resource,
          };
        });
      else return [];
    },
  },

  /* validations: {
    dug: {
      name: {
        required
      }
    }
  }, */
    mutations: {
     
    },
  methods: {
      handleSubmit() {

      this.toolLocal.toolType = this.tool.toolType.id;
        this.toolLocal.statisticalMethods = this.checkedNodesMethods;
             this.toolLocal.gsbpmProcesses = this.checkedNodesGsbpm;
        
      this.$store
        .dispatch("tools/update", this.toolLocal).then(() => {
          this.loadTool();
      }); 

    },
    onNodeCheckedGsbpm(node) {
      this.checkedNodesGsbpm.push(node.id);
      console.log(node.text);
      /* this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
      this.$store
        .dispatch("filter/setParams", this.payload)
        .then(this.$store.dispatch("tools/filter", this.params)); */
    },
    setCheckedNodesGsbpm() {
       this.gsbpmChecked=[];
      this.tool.gsbpmProcesses.map((gsbpmProc) => {
        this.gsbpmChecked.push(gsbpmProc.id);
      });
    },
    onNodeCheckedMethods(node) {
      this.checkedNodesMethods.push(node.id);
  
      /* this.filter(this.checkedNodesMethods, this.checkedNodesType);
      this.$store
        .dispatch("filter/setParams", this.payload)
        .then(this.$store.dispatch("tools/filter", this.params)); */
    },
    onNodeCheckedDocumentation(node) {
      this.checkedNodesDocumentation.push(node.id);
     
    },
    onNodeCheckedAgent(node) {
      this.checkedNodesAgent.push(node.id);
      
    },
    setCheckedNodesMethods() {
       this.methodsChecked=[];       
      this.tool.statisticalMethods.map((method) => {
        this.methodsChecked.push(method.id);
      });
    },
    setCheckedNodesDocumentation() {
      this.documentationChecked=[];
      this.tool.documentations.map((doc) => {
        this.documentationChecked.push(doc.id);
      });
    },
    onNodeUncheckedGsbpm(node) {
      if (this.checkedNodesGsbpm.indexOf(node.id) >= 0) {
        this.checkedNodesGsbpm.splice(
          this.checkedNodesGsbpm.indexOf(node.id),
          1
        );
        console.log(node.text + "- unchecked");
        this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
        this.$store
          .dispatch("filter/setParams", this.payload)
          .then(this.$store.dispatch("tools/filter", this.params));
      } else {
        this.$store.dispatch("tools/filter", this.params);
      }
    },
    onNodeUncheckedMethods(node) {
      if (this.checkedNodesMethods.indexOf(node.id) >= 0) {
        this.checkedNodesMethods.splice(
          this.checkedNodesMethods.indexOf(node.id),
          1
        );
       
        /* this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
        this.$store
          .dispatch("filter/setParams", this.payload)
          .then(this.$store.dispatch("tools/filter", this.params)); */
      } /* else {
        this.$store.dispatch("tools/filter", this.params);
      } */
    },
    onNodeUncheckedDocumentation(node) {
      if (this.checkedNodesDocumentation.indexOf(node.id) >= 0) {
        this.checkedNodesDocumentation.splice(
          this.checkedNodesDocumentation.indexOf(node.id),
          1
        );
         
      }
    },
    onNodeUncheckedAgent(node) {
      if (this.checkedNodesAgent.indexOf(node.id) >= 0) {
        this.checkedNodesAgent.splice(
          this.checkedNodesAgent.indexOf(node.id),
          1
        );
        console.log(node.text + "- unchecked");
      }
    },

    setOldValues() {
      this.toolLocal.id = this.tool.id;
      this.toolLocal.releaseDate = this.tool.releaseDate;
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
      this.toolLocal.statisticalMethods =this.tool.statisticalMethods;
      this.toolLocal.gsbpmProcesses = this.tool.gsbpmProcesses;;
    
    },
    backToList() {
      this.$router.push("/catalogue/tools");
    },
    loadTool() {
      this.$store.dispatch("tools/findById", this.$route.params.id).then(() => {
        this.setOldValues();
        this.setCheckedNodesGsbpm();
        this.setCheckedNodesMethods();
        this.setCheckedNodesDocumentation();
      });
    },
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
