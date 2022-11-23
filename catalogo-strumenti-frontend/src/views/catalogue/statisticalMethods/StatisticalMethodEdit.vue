<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-10">
      <div v-if="statisticalMethod">
        <!--div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-9 pl-4">
            <div class="col-10 p-0">
              <h1 class="uppercase text-right p-0 pt-2 text-info ">
                <span>
                  <span >{{ statisticalMethodLocal.name | dashEmpty }}</span>
                  <h5 class="bg-secondary p-0"><span class="pr-2 text-info">Modifica</span></h5>
                </span>                
              </h1>
            </div>
          </div>
        </div-->
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-9 p-0 pl-4">
            <div class="col-12 p-0 pl-2">
              <h1 class="uppercase text-right p-0 pt-2 text-info">
                <span>
                  <span class="p-0">{{
                    statisticalMethodLocal.name | dashEmpty
                  }}</span>
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
          :vertical="{ navs: 'col-md-3', content: 'col-md-9 p-0 pl-4' }"
        >
          <CTab>
            <template #title>
              <span class="text-info">Metodo Statistico</span>
            </template>
            <div class="row p-0">
              <div class="col-12 p-0">
                <CTitle
                  title="Metodo Statistico"
                  buttonTitle=" Metodo Statistico"
                  functionality=""
                  :authenticated="isAuthenticated"
                  :buttons="['salva', 'indietro']"
                  @handleSubmit="handleSubmit"
                  @handleBack="handleBack"
                />
              </div>
              <CCard class="col-12 p-0">
                <CCardBody>
                  <CInput
                    label="Nome*"
                    placeholder="Name"
                    v-model="statisticalMethodLocal.name"
                    :class="{
                      'is-invalid': $v.statisticalMethodLocal.name.$error
                    }"
                  />
                  <div
                    class="help-block"
                    :class="{ show: $v.statisticalMethodLocal.name.$error }"
                  >
                    Campo obbligatorio
                  </div>
                  <CTextarea
                    label="Descrizione"
                    placeholder="Descrizione"
                    v-model="statisticalMethodLocal.description"
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
                  <CInput
                    label="Requisiti/Ipotesi"
                    placeholder="Requisiti/Ipotesi"
                    v-model="statisticalMethodLocal.requirements"
                  />
                  <!-- <CInput
                    label="Presupposti"
                    placeholder="Presupposti"
                    v-model="statisticalMethodLocal.assumptions"
                  /> -->
                  <CInput
                    label="Limitazioni/Vincoli"
                    placeholder="Limitazioni/Vincoli"
                    v-model="statisticalMethodLocal.constraints"
                  />
                  <CTextarea
                    label="Note"
                    placeholder="Note"
                    v-model="statisticalMethodLocal.notes"
                  />

                  <CTextarea
                    label="Tag"
                    placeholder="Tag"
                    v-model="statisticalMethodLocal.tags"
                  />
                  <CInput
                    label="Versione"
                    placeholder="Versione"
                    v-model="statisticalMethodLocal.version"
                  />

                  <label>Data di Pubblicazione</label>
                  <div>
                    <date-picker
                      v-if="statisticalMethodLocal"
                      v-model="statisticalMethodLocal.releaseDate"
                      placeholder="Seleziona una data"
                    ></date-picker>
                  </div>
                  <div class="form-group pt-2">
                    <label for="checkbox">Standard Istat &nbsp;</label>
                    <input
                      id="checkbox"
                      type="checkbox"
                      v-model="statisticalMethodLocal.standardIstat"
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
            <template #title>
              <span class="text-info">Documenti</span>
            </template>
            <div v-if="this.statisticalMethod">
              <div class="row p-0">
                <div class="col-12 p-0 pl-1 pr-1">
                  <CDocumentationEditView
                    :parentName="this.statisticalMethod.name"
                    @updateParent="loadMethod"
                    :documentations="getDocumentation"
                    :methodId="this.statisticalMethod.id"
                  />
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
import _ from "lodash";
import { mapGetters } from "vuex";
import Treeselect from "@riophae/vue-treeselect";

import DatePicker from "vue2-datepicker";
import "vue2-datepicker/index.css";
import { required } from "vuelidate/lib/validators";
import CDocumentationEditView from "@/components/documentation/CDocumentationEditView.vue";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "ToolEdit",
  components: {
    DatePicker,
    Treeselect,
    CDocumentationEditView,
    CTitle
  },
  data() {
    return {
      checkStandardIstat: false,
      statisticalMethodLocal: {
        id: "",
        name: "",
        description: "",
        requirements: "",
        assumptions: "",
        constraints: "",
        notes: "",
        tags: "",
        version: "",
        releaseDate: "",
        standardIstat: 0,
        gsbpmProcesses: []
      },
      gsbpmChecked: [],

      documentationChecked: []
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("methods", ["statisticalMethod"]),
    ...mapGetters("gsbpm", ["gsbpmList"]),
    ...mapGetters("documentation", ["documentationList"]),
    getGsbpmList: function() {
      if (this.gsbpmList)
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
      else return [];
    },
    getDocumentation: function() {
      if (this.statisticalMethod) {
        return this.statisticalMethod.documentations.map(doc => {
          return {
            id: doc.id,
            name: doc.name,
            publisher: doc.publisher,
            documentType: doc.documentType.name,
            resource: doc.resource
          };
        });
      } else return [];
    }
  },
  validations: {
    statisticalMethodLocal: {
      name: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      this.statisticalMethodLocal.gsbpmProcesses = this.gsbpmChecked;
      this.$v.$touch();

      if (!this.$v.statisticalMethodLocal.$invalid) {
        this.$store
          .dispatch("methods/update", this.statisticalMethodLocal)
          .then(() => {
            this.loadMethod();
          });
      }
    },

    setCheckedNodesGsbpm() {
      this.gsbpmChecked = [];
      this.statisticalMethod.gsbpmProcesses.map(gsbpmProc => {
        this.gsbpmChecked.push(gsbpmProc.id);
      });
    },
    formatDate(dt) {
      dt = new Date(dt);
      //return dt.toLocaleDateString("it");
      return dt;
    },
    setOldValues() {
      this.statisticalMethodLocal.id = this.statisticalMethod.id;
      this.statisticalMethodLocal.name = this.statisticalMethod.name;
      this.statisticalMethodLocal.description = this.statisticalMethod.description;
      this.statisticalMethodLocal.requirements = this.statisticalMethod.requirements;
      this.statisticalMethodLocal.assumptions = this.statisticalMethod.assumptions;
      this.statisticalMethodLocal.constraints = this.statisticalMethod.constraints;
      this.statisticalMethodLocal.notes = this.statisticalMethod.notes;
      this.statisticalMethodLocal.tags = this.statisticalMethod.tags;
      this.statisticalMethodLocal.version = this.statisticalMethod.version;
      // this.statisticalMethodLocal.releaseDate =  this.statisticalMethod.releaseDate;
      this.statisticalMethodLocal.releaseDate = this.formatDate(
        this.statisticalMethod.releaseDate
      );

      this.statisticalMethodLocal.standardIstat = this.statisticalMethod.standardIstat;
    },
    handleBack() {
      this.$router.back();
    },

    loadMethod: _.debounce(function() {
      this.$store
        .dispatch("methods/findById", this.$route.params.id)
        .then(() => {
          if (this.statisticalMethod) {
            this.setOldValues();
          }
        });
    }, 500)
  },
  created() {
    this.loadMethod();
  }
};
</script>
<style scoped>
.vdpArrowPrev:after {
  border-right-color: #cc99cd;
}

.vdpArrowNext:after {
  border-left-color: #cc99cd;
}

.vdpCell.selectable:hover .vdpCellContent,
.vdpCell.selected .vdpCellContent {
  background: #cc99cd;
}

.vdpCell.today {
  color: #cc99cd;
}

.vdpTimeUnit > input:hover,
.vdpTimeUnit > input:focus {
  border-bottom-color: #cc99cd;
}
</style>
