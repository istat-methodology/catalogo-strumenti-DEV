<template>
  <div>
    <CTitle
      :title="
        'Process Step ' +
          pProcessStep.name +
          ' (' +
          pProcessStep.id +
          ') / ' +
          'Process Design (' +
          pProcessDesign.id +
          ') / ' +
          'Process Specification (' +
          pProcessSpecification.id +
          ')'
      "
      buttonTitle="view process specification "
      functionality="dettaglio process specification"
      :authenticated="isAuthenticated"
      :buttons="['indietro']"
      @handleBack="handleBack"
    />
    <CCard v-if="designtypebyparentList">
      <CCardBody>
        <div class="col-12">
          <div class="row mt-1">
            <Label>Design Type</Label>
          </div>
          <div class="row">
            <div class="form-group col-6" role="group">
              <label class="col-12">Tipo I/O</label>
              <select
                disabled
                class="p-1 ml-0 col-12 form-control"
                @change="changeDesignTypeListByParent($event)"
                v-model="lProcessSpecification.designType_Tipo_IO.id"
              >
                <option
                  v-for="option in designtypeList"
                  v-bind:value="option.id"
                  :key="option.id"
                >
                  {{ option.type }}
                </option>
              </select>
            </div>
            <div class="form-group col-6" role="group">
              <label class="col-12">Dati I/O</label>
              <select
                disabled
                class="p-1 ml-0 col-12 form-control"
                @change="onChangeDesignType_Data_IO($event)"
                v-model="lProcessSpecification.designType_Dati_IO.id"
              >
                <option
                  v-for="option in designtypebyparentList"
                  v-bind:value="option.id"
                  :key="option.id"
                >
                  {{ option.type }}
                </option>
              </select>
            </div>
          </div>
          <div class="row mt-4">
            <Label>Information Object</Label>
          </div>
          <div class="row">
            <CInput
              disabled
              class="col-2"
              label="id"
              placeholder="id"
              v-model="lProcessSpecification.informationObject.id"
            />
            <CInput
              disabled
              class="col-10"
              label="name"
              placeholder="name"
              v-model="lProcessSpecification.informationObject.name"
            />
            <!--CInput
                class="col-2"
                label="csmAppRoleId"
                placeholder="csmAppRoleId"
                v-model="lProcessSpecification.informationObject.csmAppRole.id"
              /-->
          </div>
          <div class="row">
            <CTextarea
              disabled
              class="col-12"
              label="description"
              placeholder="description"
              v-model="lProcessSpecification.informationObject.description"
            />
          </div>
        </div>
      </CCardBody>
    </CCard>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
var _ = require("lodash");
export default {
  name: "CBusinessProcessSpecificationView",
  components: {
    CTitle
  },
  data() {
    return {
      lProcessDesign: {},
      lProcessSpecification: {
        id: "",
        processDesign: {
          id: "",
          descr: ""
        },
        designType: {
          id: "",
          type: "",
          parent: ""
        },
        informationObject: {
          id: "",
          name: "",
          descr: "",
          csmAppRoleId: "",
          businessService: {
            id: "",
            name: "",
            descr: ""
          }
        }
      }
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("designtypes", ["designtypeList", "designtypebyparentList"])
  },
  //emits: ["enableEditProcessDesign"],
  props: {
    pProcessStep: {
      type: Object,
      required: true,
      default: () => {}
    },
    pProcessDesign: {
      type: Object,
      required: true,
      default: () => {}
    },
    pProcessSpecification: {
      type: Object,
      required: true,
      default: () => {}
    },
    pDesignType: {
      type: Array,
      required: true,
      default: () => []
    }
  },
  methods: {
    handleBack() {
      this.$emit("enableBack");
    },
    changeDesignTypeListByParent(event) {
      this.$store.dispatch("designtypes/findByParent", event.target.value);
    },
    onChangeDesignType_Data_IO(event) {
      alert(event.target.value);
    },
    getDesignType(id) {
      console.log(this.lDesignType);
      var dt = this.lDesignType[id];
      console.log(dt);
      return dt;
    }
  },
  created() {
    this.lProcessDesign = this.pProcessDesign;
    this.lProcessSpecification = this.pProcessSpecification;
    this.$store.dispatch("designtypes/findAll");
    this.$store.dispatch(
      "designtypes/findByParent",
      parseInt(parseInt(this.lProcessSpecification.designType_Tipo_IO.id))
    );
    this.lDesignType = _.map(this.pDesignType, "type");
  }
};
</script>
<style scoped>
h5 {
  margin-bottom: 0.1rem;
}
.card-border {
  border: 1px solid #d8dbe0 !important;
  box-shadow: none !important;
}
.bg-lighter {
  background-color: #f8f8f8 !important;
}
.material-design-icon {
  margin-bottom: 0.2rem;
}
* {
  box-sizing: border-box;
}
body {
  font-family: Arial, Helvetica, sans-serif;
}
/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}
/* Remove extra left and right margins, due to padding in columns */
.row {
  margin: 0 -5px;
}
/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* this adds the "card" effect */
  padding: 12px;
  text-align: left;
  background-color: #f1f1f1;
  margin-left: 5px;
}
/* Responsive columns - one column layout (vertical) on small screens */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}
.ucase {
  font: upper-case;
}
</style>
