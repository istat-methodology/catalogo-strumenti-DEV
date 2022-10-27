<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CTabs
        variant="pills"
        :vertical="{ navs: 'col-md-3', content: 'col-md-9' }"
      >
        <CTab>
          <template #title>
            <span>Business Function</span>
          </template>

          <CCard v-if="bFunction">
            <CCardHeader>Modifica Business Function</CCardHeader>
            <CCardBody>
              <CInput
                label="Nome*"
                placeholder="Nome"
                v-model="businessFunctionLocal.name"
                :class="{ 'is-invalid': $v.businessFunctionLocal.name.$error }"
              />
              <div
            class="help-block"
            :class="{ show: $v.businessFunctionLocal.name.$error }"
          >
            Campo obbligatorio
          </div>
              <CInput
                label="Descrizione"
                placeholder="Descrizione"
                v-model="businessFunctionLocal.descr"
              />
              <CInput
                label="Etichetta"
                placeholder="Etichetta"
                v-model="businessFunctionLocal.label"
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
              @click.prevent="backToList"
              >Indietro</CButton
            >
          </CCardFooter>
        </CTab>
        <CTab>
          <template #title>
            <span>Elenco Processi</span>
          </template>
          <div v-if="this.bFunction">
            <div v-if="this.bFunction">
              <app-business-process-edit
                :bFunctionName="bFunction.name"
                @refreshBProcess="loadBusinessFunction"
                :bProcesses="getBusinessProcesses"
                :functionId="bFunction.id"
              >
              </app-business-process-edit>
            </div>
          </div>
        </CTab>
      </CTabs>
    </div>
  </div>
</template>
<script>

import { mapGetters } from "vuex";
import _ from "lodash";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import BusinessProcessEditView from "../businessProcesses/shared/BusinessProcessEditView";
import { required } from "vuelidate/lib/validators"; 
export default {
  name: "BusinessFunctionsEdit",
  components: {
    Treeselect,
    "app-business-process-edit": BusinessProcessEditView
  },
  data() {
    return {
      businessFunctionLocal: {
        id: "",
        name: "",
        descr: "",
        label: "",
        businessProcesses: [],
        gsbpmProcesses:[]
      },
      gsbpmChecked: []
    };
  },
   validations: {
    businessFunctionLocal: {
      name: {
        required
      }
    }
  },
  computed: {
    ...mapGetters("bFunction", ["bFunction"]),
    ...mapGetters("gsbpm", ["gsbpmList"]),
    getGsbpmList: function() {
      return this.gsbpmList.map(gsbpm => {
        return {
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
    },
    getBusinessProcesses: function() {
      return this.bFunction.businessProcesses.map(item => {
        return {
          id: item.id,
          name: item.name,
          desr: item.desr,
          label: item.label,
          orderCode: item.orderCode,
          parent: item.parent,
          processSteps: item.processSteps
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
    handleSubmit() {
         this.businessFunctionLocal.gsbpmProcesses = this.gsbpmChecked;
      this.$v.$touch(); //validate form data
      if (!this.$v.businessFunctionLocal.$invalid) {
      this.$store
        .dispatch("bFunction/update", this.businessFunctionLocal)
        .then(() => {
          this.loadBusinessFunction(this.$route.params.id);
        });
      } 
    },
    setOldValues() {
      this.businessFunctionLocal.id = this.bFunction.id;
      this.businessFunctionLocal.name = this.bFunction.name;
      this.businessFunctionLocal.descr = this.bFunction.descr;
      this.businessFunctionLocal.label = this.bFunction.label;
      this.businessFunctionLocal.businessProcesses = this.bFunction.businessProcesses;
    },
    setCheckedNodesGsbpm() {
      this.gsbpmChecked = [];
      this.bFunction.gsbpmProcesses.map(gsbpmProc => {
        this.gsbpmChecked.push(gsbpmProc.id);
      });
    },
    backToList() {
      this.$router.push("/catalogue/businessfunctions");
    },
    loadBusinessFunction: _.debounce(function(idBFunction) {
      this.$store.dispatch("bFunction/findById", idBFunction).then(() => {
        this.setOldValues();
        this.setCheckedNodesGsbpm();
      });
    }, 500)
  },
  created() {
    //this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.loadBusinessFunction(this.$route.params.id);
    this.$store.dispatch("gsbpm/findAll");

   
  }
};
</script>
