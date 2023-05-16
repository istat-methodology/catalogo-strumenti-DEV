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
        'Process Specification ()'
      "
      buttonTitle=" process specification "
      functionality="nuovo process specification"
      :authenticated="isAuthenticated"
      :buttons="['salva', 'indietro']"
      @handleSubmit="handleSubmit"
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
                class="p-1 ml-0 col-12 form-control"
                @change="changeDesignTypeListByParent($event)"
                v-model="designType_Tipo_IO.id"
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
                class="p-1 ml-0 col-12 form-control"
                @change="onChangeDesignType_Data_IO($event)"
                v-model="designType_Dati_IO.id"
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
              class="col-2"
              label="id"
              placeholder="id"
              v-model="lInformationObject.id"
            />
            <CInput
              class="col-10"
              label="name"
              placeholder="name"
              v-model="lInformationObject.name"
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
              class="col-12"
              label="description"
              placeholder="description"
              v-model="lInformationObject.descr"
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
  name: "CBusinessProcessDesignNew",
  components: {
    CTitle,
  },
  data() {
    return {
      designType_Tipo_IO: {
        id: "",
        type: "",
        parent: "",
      },
      designType_Dati_IO: {
        id: "",
        type: "",
        parent: "",
      },
      lProcessSpecification: {
        processDesign: 0,
        designType: 0,
        informationObject: 0,
      },
      processSpecificationToSave: {
        processDesign: 0,
        designType: 0,
        informationObject: 0,
      },

      lInformationObject: {
        name: "",
        descr: "",
      },
      informationObjectToSave: {
        name: "",
        descr: "",
        csmAppRoleId: "999",
        businessService: "999",
      },
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("designtypes", ["designtypeList", "designtypebyparentList"]),
    ...mapGetters("informationObjects", ["informationObjectList"]),
  },
  props: {
    pProcessStep: {
      type: Object,
      required: true,
      default: () => {},
    },
    pProcessDesign: {
      type: Object,
      required: true,
      default: () => {},
    },
    pProcessSpecification: {
      type: Object,
      required: true,
      default: () => {},
    },
    pDesignType: {
      type: Array,
      required: true,
      default: () => [],
    },
  },
  methods: {
    handleSubmit() {
      if (this.designType_Dati_IO.type == "") {
        this.lProcessSpecification.designType = this.designType_Tipo_IO.id;
      } else {
        this.lProcessSpecification.designType = this.designType_Dati_IO.id;
      }

      this.informationObjectToSave.name = this.lInformationObject.name;
      this.informationObjectToSave.descr = this.lInformationObject.descr;

      this.$store
        .dispatch("informationObjects/save", this.informationObjectToSave)
        .then(() => {
          this.processSpecificationToSave.processDesign =
            this.pProcessDesign.id;

          this.processSpecificationToSave.designType =
            this.lProcessSpecification.designType;

          this.processSpecificationToSave.informationObject =
            this.informationObjectList.id;

          this.$store.dispatch(
            "processSpecification/save",
            this.processSpecificationToSave
          );
        });
    },
    handleBack() {
      this.$emit("enableBack");
    },
    changeDesignTypeListByParent(event) {
      console.log(event);
      this.$store.dispatch("designtypes/findByParent", event.target.value);
    },
    onChangeDesignType_Data_IO(event) {
      console.log(event);
    },
    getDesignType(id) {
      console.log(this.lDesignType);
      var dt = this.lDesignType[id];
      console.log(dt);
      return dt;
    },
  },
  created() {
    this.lProcessDesign = this.pProcessDesign;
    this.$store.dispatch("designtypes/findAll");
    this.$store.dispatch("designtypes/findByParent", parseInt(parseInt(1)));
    this.lDesignType = _.map(this.pDesignType, "type");
  },
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
</style>
