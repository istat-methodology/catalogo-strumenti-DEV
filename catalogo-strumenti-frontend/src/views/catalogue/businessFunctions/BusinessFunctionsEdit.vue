<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <div class="row p-0">
        <div class="col-md-2"></div>
        <div class="col-md-10 p-0 pl-4">
          <div class="col-10 p-0 pl-2">
            <h1 class="uppercase text-right p-0 pt-2 text-info">
              <span>
                <span class="p-0">{{ bFunction.name }}</span>
                <h4 class="bg-secondary p-0">
                  <span class="pr-1 text-info">Modifica</span>
                </h4>
              </span>
            </h1>
          </div>
        </div>
      </div>
      <CTabs
        variant="pills"
        :vertical="{ navs: 'col-md-2', content: 'col-md-10 p-0 pl-4' }">
        <CTab>
          <template #title>
            <span>Informazioni Generali</span>
          </template>
          <div v-if="bFunction">
            <div class="row p-0">
              <div class="col-10 p-0">
                <CTitle
                  title="Informazioni Generali"
                  buttonTitle=" Informazioni Generali"
                  functionality=""
                  :authenticated="isAuthenticated"
                  :buttons="['salva', 'indietro']"
                  @handleSubmit="handleSubmit"
                  @handleBack="handleBack" />
                <CCard>
                  <CCardBody>
                    <CInput
                      label="Nome*"
                      placeholder="Nome"
                      v-model="businessFunctionLocal.name"
                      :class="{
                        'is-invalid': $v.businessFunctionLocal.name.$error
                      }" />
                    <div
                      class="help-block"
                      :class="{ show: $v.businessFunctionLocal.name.$error }">
                      Campo obbligatorio
                    </div>
                    <CInput
                      label="Descrizione"
                      placeholder="Descrizione"
                      v-model="businessFunctionLocal.descr" />
                    <CInput
                      label="Etichetta"
                      placeholder="Etichetta"
                      v-model="businessFunctionLocal.label" />
                    <div class="form-group" role="group">
                      <label for="app-tree">Fasi GSBPM</label>

                      <div id="app-tree" class="demo-tree">
                        <treeselect
                          v-model="gsbpmChecked"
                          :multiple="true"
                          :options="getGsbpmList"
                          :disable-branch-nodes="true"
                          :show-count="true" />
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
          <div v-if="this.bFunction">
            <CBusinessProcessList
              :bFunctionId="bFunction.id"
              :bFunctionName="bFunction.name"
              :bProcesses="getBusinessProcesses"
              @refreshBProcess="loadBusinessFunction" />
          </div>
        </CTab>
      </CTabs>
    </div>
  </div>
</template>
<script>
import { mapGetters } from "vuex"
import { required } from "vuelidate/lib/validators"
import _ from "lodash"
import "@riophae/vue-treeselect/dist/vue-treeselect.css"
import Treeselect from "@riophae/vue-treeselect"
import CBusinessProcessList from "@/components/businessProcess/CBusinessProcessList"

import CTitle from "@/components/CTitle.vue"
export default {
  name: "BusinessFunctionsEdit",
  components: {
    Treeselect,
    CBusinessProcessList,
    CTitle
  },
  data() {
    return {
      businessFunctionLocal: {
        id: "",
        name: "",
        descr: "",
        label: "",
        businessProcesses: [],
        gsbpmProcesses: []
      },
      gsbpmChecked: []
    }
  },
  validations: {
    businessFunctionLocal: {
      name: {
        required
      }
    }
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("bFunction", ["bFunction"]),
    ...mapGetters("gsbpm", ["gsbpmList"]),
    getGsbpmList: function () {
      return this.gsbpmList.map((gsbpm) => {
        return {
          id: "id-" + gsbpm.id,
          label: gsbpm.code + " " + gsbpm.name,
          children: gsbpm.gsbpmSubProcesses.map((gsbpmSubProcess) => {
            return {
              id: gsbpmSubProcess.id,
              label: gsbpmSubProcess.code + " " + gsbpmSubProcess.name
            }
          })
        }
      })
    },
    getBusinessProcesses: function () {
      return this.bFunction.businessProcesses.map((item) => {
        return {
          id: item.id,
          name: item.name,
          descr: item.descr,
          label: item.label,
          orderCode: item.orderCode,
          parent: item.parent,
          processSteps: item.processSteps
        }
      })
    }
  },

  methods: {
    handleSubmit() {
      this.businessFunctionLocal.gsbpmProcesses = this.gsbpmChecked
      this.$v.$touch() //validate form data
      if (!this.$v.businessFunctionLocal.$invalid) {
        this.$store
          .dispatch("bFunction/update", this.businessFunctionLocal)
          .then(() => {
            this.loadBusinessFunction(this.$route.params.id)
          })
      }
    },
    setOldValues() {
      this.businessFunctionLocal.id = this.bFunction.id
      this.businessFunctionLocal.name = this.bFunction.name
      this.businessFunctionLocal.descr = this.bFunction.descr
      this.businessFunctionLocal.label = this.bFunction.label
      this.businessFunctionLocal.businessProcesses =
        this.bFunction.businessProcesses
    },
    setCheckedNodesGsbpm() {
      this.gsbpmChecked = []
      this.bFunction.gsbpmProcesses.map((gsbpmProc) => {
        this.gsbpmChecked.push(gsbpmProc.id)
      })
    },
    handleBack() {
      this.$router.back()
    },
    loadBusinessFunction: _.debounce(function (idBFunction) {
      this.$store.dispatch("bFunction/findById", idBFunction).then(() => {
        this.setOldValues()
        this.setCheckedNodesGsbpm()
      })
    }, 500)
  },
  created() {
    //this.$store.dispatch("coreui/setContext", Context.ToolEdit);
    this.loadBusinessFunction(this.$route.params.id)
    this.$store.dispatch("gsbpm/findAll")
  }
}
</script>
