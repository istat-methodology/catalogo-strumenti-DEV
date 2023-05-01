<template>
  <div>
    <CTitle
      :title="
        'Process Step ' +
        bProcessStep.name +
        ' (' +
        bProcessStep.id +
        ') / ' +
        'Process Design (' +
        bProcessDesign.id +
        ') / ' +
        'Process Specification (' +
        bProcessSpecification.id +
        ') '
      "
      buttonTitle="view process design "
      functionality=""
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
                v-model="processSpecificationLocal.designType_Tipo_IO.id"
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
                v-model="processSpecificationLocal.designType_Dati_IO.id"
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
              v-model="processSpecificationLocal.informationObject.id"
            />
            <CInput
              class="col-10"
              label="name"
              placeholder="name"
              v-model="processSpecificationLocal.informationObject.name"
            />
            <!--CInput
                class="col-2"
                label="csmAppRoleId"
                placeholder="csmAppRoleId"
                v-model="processSpecificationLocal.informationObject.csmAppRole.id"
              /-->
          </div>
          <div class="row">
            <CTextarea
              class="col-12"
              label="description"
              placeholder="description"
              v-model="processSpecificationLocal.informationObject.descr"
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
  name: "CBusinessProcessDesignEdit",
  components: {
    CTitle,
  },
  data() {
    return {
      processDesignLocal: {},
      processSpecificationLocal: {
        id: "",
        processDesign: {
          id: "",
          descr: "",
        },
        designType: {
          id: "",
          type: "",
          parent: "",
        },
        informationObject: {
          id: "",
          name: "",
          descr: "",
          csmAppRoleId: "",
          businessService: {
            id: "",
            name: "",
            descr: "",
          },
        },
      },
      processSpecificationToSave: {
        id: "",
        processDesign: {
          id: "",
          descr: "",
        },
        designType: {
          id: "",
          type: "",
          parent: "",
        },
        informationObject: {
          id: "",
          name: "",
          descr: "",
          //csmAppRoleId: "",
          //businessService: {
          //  id: "",
          //  name: "",
          //  descr: "",
          //},
        },
      },
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("designtypes", ["designtypeList", "designtypebyparentList"]),
  },
  //emits: ["enableEditProcessDesign"],
  props: {
    bProcessStep: {
      type: Object,
      required: true,
      default: () => {},
    },
    bProcessDesign: {
      type: Object,
      required: true,
      default: () => {},
    },
    bProcessSpecification: {
      type: Object,
      required: true,
      default: () => {},
    },
    bDesignType: {
      type: Array,
      required: true,
      default: () => [],
    },
  },
  methods: {
    handleSubmit() {
      this.processSpecificationToSave.id = this.bProcessSpecification.id;

      this.processSpecificationToSave.processDesign.id = this.bProcessDesign.id;

      this.processSpecificationToSave.processDesign.descr =
        this.bProcessDesign.descr;

      if (this.processSpecificationLocal.designType_Dati_IO.type == "") {
        this.processSpecificationToSave.designType.id =
          this.bProcessSpecification.designType_Tipo_IO.id;
        this.processSpecificationToSave.designType.type =
          this.bProcessSpecification.designType_Tipo_IO.type;
        this.processSpecificationToSave.designType.parent = "";
      } else {
        this.processSpecificationToSave.designType.id =
          this.bProcessSpecification.designType_Dati_IO.id;
        this.processSpecificationToSave.designType.type =
          this.bProcessSpecification.designType_Dati_IO.type;
        this.processSpecificationToSave.designType.parent =
          this.bProcessSpecification.designType_Tipo_IO.id;
      }

      this.processSpecificationToSave.informationObject.id =
        this.processSpecificationLocal.informationObject.id;

      this.processSpecificationToSave.informationObject.name =
        this.processSpecificationLocal.informationObject.name;

      this.processSpecificationToSave.informationObject.descr =
        this.processSpecificationLocal.informationObject.descr;

      this.processSpecificationToSave.informationObject.csmAppRoleId =
        this.processSpecificationLocal.informationObject.csmAppRoleId;
      /*
      this.processSpecificationToSave.informationObject.businessService.id =
        this.processSpecificationLocal.informationObject.businessService.id;
      
      this.processSpecificationToSave.informationObject.businessService.name =      
        this.processSpecificationLocal.informationObject.businessService.name;

      this.processSpecificationToSave.informationObject.businessService.descr =
        this.processSpecificationLocal.informationObject.businessService.descr;
*/
      this.$store.dispatch(
        "processSpecification/update",
        this.processSpecificationToSave
      );
    },
    handleBack() {
      this.$emit("enableBack");
    },
    changeDesignTypeListByParent(event) {
      var id = event.target.value;

      this.processSpecificationToSave.designType.parent =
        this.processSpecificationLocal.designType.parent;
      this.processSpecificationToSave.designType.id =
        this.processSpecificationLocal.designType.id;
      this.processSpecificationToSave.designType.type = this.getDesignType(id);

      this.$store.dispatch("designtypes/findByParent", event.target.value);
      alert("parent=" + event.target.value);
      console.log(this.processSpecificationToSave);
    },
    onChangeDesignType_Data_IO(event) {
      var id = event.target.value;
      this.processSpecificationToSave.designType.parent =
        this.processSpecificationToSave.designType.id;
      this.processSpecificationToSave.designType.id = id;
      this.processSpecificationToSave.designType.type = this.getDesignType(id);
      console.log(this.bProcessSpecificationToSave);
    },
    getDesignType(id) {
      console.log(this.designTypeLocal);
      var dt = this.designTypeLocal[id];
      console.log(dt);
      return dt;
    },
  },
  created() {
    this.processDesignLocal = this.bProcessDesign;
    this.processSpecificationLocal = this.bProcessSpecification;
    this.$store.dispatch("designtypes/findAll");
    this.$store.dispatch(
      "designtypes/findByParent",
      parseInt(parseInt(this.bProcessSpecification.designType_Tipo_IO.id))
    );
    this.designTypeLocal = _.map(this.bDesignType, "type");
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
