<template>
  <!-- wait until service is loaded -->
  <div v-if="bFunction" class="row">
    <div class="col-12">
      <div class="row p-0">
        <div class="col-md-12 p-0 pl-4">
          <div class="col-12 p-0 pl-2">
            <h1 class="uppercase text-right p-0 pt-2 text-info">
              <span>
                <span class="mb-0">{{ bFunction.name }}</span>                
              </span>
            </h1>
          </div>
        </div>
      </div>
      <CTabs
        variant="pills"
        :vertical="{ navs: 'col-md-2', content: 'col-md-10 p-0 pl-4' }"
      >
        <CTab>
          <template #title>
            <span>Informazioni Generali</span>
          </template>
          <div v-if="bFunction">
            <div class="row p-0">
              <div class="col-12 p-0">
                <CTitle
                  title="Informazioni Generali"
                  buttonTitle=" Informazioni Generali"
                  functionality=""
                  :authenticated="isAuthenticated"
                  :buttons="['salva', 'indietro']"
                  @handleSubmit="handleSubmit"
                  @handleBack="handleBack"
                />
                <CCard>
                  <CCardBody>
                    <CInput
                      disabled
                      label="ID"
                      placeholder="ID"
                      v-model="lBusinessFunction.id"
                    />
                    <CInput
                      label="Nome*"
                      placeholder="Nome"
                      v-model="lBusinessFunction.name"
                      :class="{
                        'is-invalid': $v.lBusinessFunction.name.$error
                      }"
                    />
                    <div
                      class="help-block"
                      :class="{ show: $v.lBusinessFunction.name.$error }"
                    >
                      Campo obbligatorio
                    </div>
                    <CInput
                      label="Descrizione"
                      placeholder="Descrizione"
                      v-model="lBusinessFunction.descr"
                    />
                    <CInput
                      label="Etichetta"
                      placeholder="Etichetta"
                      v-model="lBusinessFunction.label"
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
              </div>
            </div>
          </div>
        </CTab>
        <CTab>
          <template #title>
            <span>Processi</span>
          </template>
          <div v-if="bFunction">
            <CBusinessProcessList
              :pFunctionId="bFunction.id"
              :pFunctionName="bFunction.name"
              :pProcesses="getBusinessProcesses"
              @refreshProcess="loadBusinessFunction"
            />
          </div>
        </CTab>
      </CTabs>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
import { required } from "vuelidate/lib/validators";
import _ from "lodash";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import Treeselect from "@riophae/vue-treeselect";
import CBusinessProcessList from "@/components/businessProcess/process/CBusinessProcessList";

import CTitle from "@/components/CTitle.vue";
export default {
  name: "BusinessFunctionsEdit",
  components: {
    Treeselect,
    CBusinessProcessList,
    CTitle
  },
  data() {
    return {
      lBusinessFunction: {
        id: "",
        name: "",
        descr: "",
        label: "",
        businessProcesses: [],
        gsbpmProcesses: []
      },
      gsbpmChecked: []
    };
  },
  validations: {
    lBusinessFunction: {
      name: {
        required
      }
    }
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
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
          descr: item.descr,
          label: item.label,
          orderCode: item.orderCode,
          parent: item.parent,
          processSteps: item.processSteps
        };
      });
    }
  },

  methods: {
    handleSubmit() {
      this.lBusinessFunction.gsbpmProcesses = this.gsbpmChecked;
      this.$v.$touch(); //validate form data
      if (!this.$v.lBusinessFunction.$invalid) {
        this.$store
          .dispatch("bFunction/update", this.lBusinessFunction)
          .then(() => {
            this.loadBusinessFunction(this.$route.params.id);
          });
      }
    },
    setOldValues() {
      this.lBusinessFunction.id = this.bFunction.id;
      this.lBusinessFunction.name = this.bFunction.name;
      this.lBusinessFunction.descr = this.bFunction.descr;
      this.lBusinessFunction.label = this.bFunction.label;
      this.lBusinessFunction.businessProcesses = this.bFunction.businessProcesses;
    },
    setCheckedNodesGsbpm() {
      this.gsbpmChecked = [];
      this.bFunction.gsbpmProcesses.map(gsbpmProc => {
        this.gsbpmChecked.push(gsbpmProc.id);
      });
    },
    handleBack() {
      this.$router.back();
    },
    loadBusinessFunction: _.debounce(function(idFunction) {
      this.$store.dispatch("bFunction/findById", idFunction).then(() => {
        this.setOldValues();
        this.setCheckedNodesGsbpm();
      });
    }, 500)
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.BusinessFunctionSession);
    this.loadBusinessFunction(this.$route.params.id);
    this.$store.dispatch("gsbpm/findAll");
  }
};
</script>
