<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard v-if="tool">
        <CCardHeader>{{ tool.name | dashEmpty }}</CCardHeader>
        <CCardBody>
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
            label="Ultima Modifica"
            placeholder="Ultima Modifica"
            v-model="toolLocal.lastUpdate"
          />
          <CInput
            label="Requisiti"
            placeholder="Requisiti"
            v-model="toolLocal.requirements"
          />
        </CCardBody>
      </CCard>
      <CCard v-if="this.gsbpmList">
        <CCardHeader>Fasi GSBPM</CCardHeader>
        <CCardBody>
          <div id="app-tree" class="demo-tree">
            <treeselect
              v-model="value"
              :multiple="true"
              :options="getGsbpmList"
              :disable-branch-nodes="true"
              :show-count="true"
              @select="onNodeCheckedGsbpm"
              @deselect="onNodeUncheckedGsbpm"
            />
          </div>
          <!-- <CListGroup>
            <CListGroupItem
              v-for="process in tool.gsbpmProcesses"
              :key="process.id"
              ><CFormCheck label="process.name"
                >{{ process.name | dashEmpty }}
              </CFormCheck>
            </CListGroupItem>
          </CListGroup> -->
        </CCardBody>
      </CCard>
      <CCard v-if="tool.toolType.id == 3">
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
      <CCard v-if="tool.toolType.id == 2">
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
      <CCard v-if="tool.toolType.id == 1">
        <CCardHeader> {{ tool.toolType.name | dashEmpty }}</CCardHeader>
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
          @click.prevent="backToList"
          >Back</CButton
        >
      </CCardFooter>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
import Treeselect from "@riophae/vue-treeselect";
/* import { required } from "vuelidate/lib/validators"; */
export default {
  name: "ToolEdit",
  components: {
    Treeselect
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
        gsbpm: "",
        businessFunction: "",
        processDesign: ""
      },
      value: [],
      checkedNodesGsbpm: [],
      //toolNodes: [],
      elenco: []
    };
  },
  computed: {
    ...mapGetters("tools", ["tool"]),
    ...mapGetters("gsbpm", ["gsbpmList"]),
    ...mapGetters("tooltype", ["tooltypeList"]),
    getGsbpmList: function() {
      return this.gsbpmList.map(gsbpm => {
        return {
          // ...gsbpm,
          id: "id-" + gsbpm.id,
          label: gsbpm.name,
          children: gsbpm.gsbpmSubProcesses.map(gsbpmSubProcess => {
            return {
              id: gsbpmSubProcess.id,
              label: gsbpmSubProcess.name
              /* state: {
                selected: this.toolNodes.includes(gsbpmSubProcess.id)
                  ? true
                  : false
              } */
            };
          }),

          state: {
            selected: false,
            selectable: false,
            checked: false,
            expanded: false,
            disabled: false,
            visible: true,
            indeterminate: false,
            matched: false,
            editable: true,
            dragging: false,
            draggable: true,
            dropable: true
          }
        };
      });
    }
  },
  /* validations: {
    dug: {
      name: {
        required
      }
    }
  }, */
  methods: {
    onNodeCheckedGsbpm(node) {
      this.checkedNodesGsbpm.push(node.id);
      console.log(node.text);
      this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
      this.$store
        .dispatch("filter/setParams", this.payload)
        .then(this.$store.dispatch("tools/filter", this.params));
    },
    setCheckedNodes() {
      this.tool.gsbpmProcesses.map(gsbpmProc => {
        this.value.push(gsbpmProc.id);
      });
    },
    /* onNodeCheckedType(node) {
      this.checkedNodesType.push(node.id);
      console.log(node.text);
      this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
      this.$store
        .dispatch("filter/setParams", this.payload)
        .then(this.$store.dispatch("tools/filter", this.params));
    }, */
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
    /*  onNodeUncheckedType(node) {
      if (this.checkedNodesType.indexOf(node.id) >= 0) {
        this.checkedNodesType.splice(this.checkedNodesType.indexOf(node.id), 1);
        console.log(node.text + "- unchecked");
        this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
        this.$store
          .dispatch("filter/setParams", this.payload)
          .then(this.$store.dispatch("tools/filter", this.params));
      } else {
        this.$store.dispatch("tools/filter", this.params);
      }
    }, */
    handleSubmit() {
      /*  this.$v.$touch(); //validate form data
      if (!this.$v.dug.$invalid) { */
      this.$store.dispatch("tools/update", this.toolLocal).then(() => {
        this.backToList();
      });
      /*   } */
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
      this.toolLocal.gsbpm = this.tool.gsbpm;
      this.toolLocal.businessFunction = this.tool.buinessFunction;
      this.toolLocal.processDesign = this.tool.processDesign;
    },
    backToList() {
      this.$router.push("/catalogue/tools");
    }
  },
  created() {
    //this.$store.dispatch("tools/findById", this.$route.params.id);
    this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.$store.dispatch("tools/findById", this.$route.params.id).then(() => {
      this.setOldValues();
      this.setCheckedNodes();
    });
    this.$store.dispatch("gsbpm/findAll");x
    this.$store.dispatch("tooltype/findAll");
  }
};
</script>
