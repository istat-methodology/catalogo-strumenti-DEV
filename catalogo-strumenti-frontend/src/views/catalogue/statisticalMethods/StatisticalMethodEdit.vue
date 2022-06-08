<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <div v-if="statisticalMethodLocal">
        <div>
          <h2 class="pt-2">
            {{ statisticalMethodLocal.name }}
            <span class="float-right">
              <close-icon @click.prevent="$router.back()" />
            </span>
          </h2>
        </div>
        <CTabs
          variant="pills"
          :vertical="{ navs: 'col-md-3', content: 'col-md-9' }"
        >
          <CTab>
            <template #title>
              <span>Metodo Statistico</span>
            </template>
            <div>
              <CCardHeader
                ><i>{{ statisticalMethodLocal.name | dashEmpty }}</i> > Metodo
              </CCardHeader>
              <CCard>
                <CCardBody>
                  <CInput
                    label="Nome*"
                    placeholder="Name"
                    v-model="statisticalMethodLocal.name"
                    :class="{
                      'is-invalid': $v.statisticalMethodLocal.name.$error,
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
                    label="Requisiti"
                    placeholder="Requisiti"
                    v-model="statisticalMethodLocal.requirements"
                  />
                  <CInput
                    label="Presupposti"
                    placeholder="Presupposti"
                    v-model="statisticalMethodLocal.assumptions"
                  />
                  <CInput
                    label="Vincoli"
                    placeholder="Vincoli"
                    v-model="statisticalMethodLocal.constraints"
                  />
                  <CTextarea
                    label="Note"
                    placeholder="Note"
                    v-model="statisticalMethodLocal.notes"
                  />

                  <CInput
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
                      v-if="releaseDate"
                      v-model="releaseDate"
                      format="D/M/YYYY"
                      value-type="format"
                      placeholder="Seleziona una data"
                    ></date-picker>
                  </div>

                  <CInputCheckbox
                    label="Standard Istat"
                    placeholder="Standard Istat"
                    v-model="checkStandardIstat"
                  />
                </CCardBody>

                <CCardFooter>
                  <CButton
                    shape="square"
                    size="sm"
                    color="primary"
                    class="mr-2"
                    @click.prevent="handleSubmit"
                    >Salva</CButton
                  >
                </CCardFooter>
              </CCard>
            </div>
          </CTab>
                 <CTab>
            <template #title>
              <span>Documentazione</span>
            </template>

            <div v-if="this.statisticalMethodLocal">
              <app-edit-documentation
                :toolName="this.statisticalMethodLocal.name"
                @refreshTool="handleSubmit"
                :documentations="getDocumentation"
                :toolId="this.statisticalMethodLocal.id"
              >
              </app-edit-documentation>
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
import DocumentationEditView from "../documentation/shared/DocumentationEditView";
import DatePicker from "vue2-datepicker";
import "vue2-datepicker/index.css";
import { required } from "vuelidate/lib/validators";
export default {
  name: "ToolEdit",
  components: {
    DatePicker,
     Treeselect,
    "app-edit-documentation": DocumentationEditView,
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
        standardIstat: "",
      },
    };
  },
  computed: {
    ...mapGetters("methods", ["statisticalMethod"]),
  },
  validations: {
    statisticalMethodLocal: {
      name: {
        required,
      },
    },
  },
  methods: {
    handleSubmit() {
      this.statisticalMethodLocal.releaseDate = this.releaseDate;
      this.statisticalMethodLocal.checkStandardIstat = this.checkStandardIstat
        ? 1
        : 0;
      this.$v.$touch();

      if (!this.$v.statisticalMethodLocal.$invalid) {
        this.$store
          .dispatch("methods/update", this.statisticalMethodLocal)
          .then(() => {
            this.loadMethod();
          });
      }
    },
    formatDate(dt) {
      dt = new Date(dt);
      return dt.toLocaleDateString("it");
    },
    setOldValues() {
      this.statisticalMethodLocal.id = this.statisticalMethod.id;
      this.statisticalMethodLocal.name = this.statisticalMethod.name;
      this.statisticalMethodLocal.description =
        this.statisticalMethod.description;
      this.statisticalMethodLocal.requirements =
        this.statisticalMethod.requirements;
      this.statisticalMethodLocal.assumptions =
        this.statisticalMethod.assumptions;
      this.statisticalMethodLocal.constraints =
        this.statisticalMethod.constraints;
      this.statisticalMethodLocal.notes = this.statisticalMethod.notes;
      this.statisticalMethodLocal.tags = this.statisticalMethod.tags;
      this.statisticalMethodLocal.version = this.statisticalMethod.version;
      //  this.statisticalMethodLocal.releaseDate =  this.statisticalMethod.releaseDate;

      this.statisticalMethodLocal.releaseDate = this.formatDate(
        this.statisticalMethod.releaseDate
      );
      this.releaseDate = this.formatDate(this.statisticalMethod.releaseDate);
      this.statisticalMethodLocal.standardIstat =
        this.statisticalMethod.standardIstat;
      this.checkStandardIstat = 1 == this.statisticalMethod.standardIstat;
    },
    backToList() {
      this.$router.push("/catalogue/metodi");
    },
        getDocumentation: function() {
      if (this.statisticalMethodLocal) {
        return this.statisticalMethodLocal.documentations.map(doc => {
          return {
            id: doc.id,
            name: doc.name,
            publisher: doc.publisher,
            documentType: doc.documentType.name,
            resource: doc.resource
          };
        });
      } else return [];
    },
    loadMethod: _.debounce(function () {
      this.$store
        .dispatch("methods/findById", this.$route.params.id)
        .then(() => {
          this.setOldValues();
        });
    }, 500),
  },
  created() {
    this.loadMethod();
  },
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
