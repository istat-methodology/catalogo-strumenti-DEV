<template>
  <div v-if="designtypebyparentList">
    <CTitle
      :title="
        'View Process Design (' +
        bProcessDesignLocal.processDesignId +
        ') del process step ' +
        bProcessStep.name +
        ' (' +
        bProcessStep.id +
        ')'
      "
      buttonTitle="view process design "
      functionality=""
      :authenticated="isAuthenticated"
      :buttons="['salva', 'indietro']"
      @handleSubmit="handleSubmit"
      @handleBack="handleBack"
    />
    <div class="row">
      <Label
        >Process Specification
        <span>({{ bProcessDesignSpecificationLocal.id }})</span></Label
      >
    </div>
    <CCard>
      <CCardBody>
        <Label>Design Type</Label>
        <div class="col-12">
          <div class="row">
            <div class="form-group col-5" role="group">
              <label class="col-12">Tipo I/O</label>
              <v-select
                label="type"
                name="type"
                class="col-12 p-0"
                :options="designtypeList"
                placeholder="I/O Type"
                v-model="bProcessDesignSpecificationLocal.designType_Tipo_IO"
                @input="changeDesignTypeListByParent($event)"
              ></v-select>
            </div>
            <div class="form-group col-5" role="group">
              <label class="col-12">Dati I/O</label>
              <v-select
                label="type"
                name="type"
                class="col-12 p-0"
                :options="designtypebyparentList"
                placeholder="I/O Data"
                v-model="bProcessDesignSpecificationLocal.designType_Dati_IO"
              ></v-select>
            </div>
          </div>

          <div class="row">
            <Label class="col-12">information Object</Label>
            <div class="row">
              <CInput
                class="col-2"
                label="id"
                placeholder="id"
                v-model="bProcessDesignSpecificationLocal.informationObject.id"
              />
              <CInput
                class="col-8"
                label="name"
                placeholder="name"
                v-model="
                  bProcessDesignSpecificationLocal.informationObject.name
                "
              />
              <!--CInput
                class="col-2"
                label="csmAppRoleId"
                placeholder="csmAppRoleId"
                v-model="bProcessDesignSpecificationLocal.informationObject.csmAppRole.id"
              /-->
              <CTextarea
                class="col-12"
                label="description"
                placeholder="description"
                v-model="
                  bProcessDesignSpecificationLocal.informationObject.description
                "
              />
            </div>
          </div>
        </div>
      </CCardBody>
    </CCard>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import CTitle from "@/components/CTitle.vue";
export default {
  name: "CBusinessProcessDesignView",
  components: {
    CTitle,
  },
  data() {
    return {
      bProcessDesignLocal: {},
      bProcessDesignSpecificationLocal: {},
      designTypeParentSelected: {
        id: "",
        type: "",
        parent: "",
      },
      designTypeSelected: {
        id: "",
        type: "",
        parent: "",
      },
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
    bProcessDesignSpecification: {
      type: Object,
      required: true,
      default: () => {},
    },
  },
  methods: {
    handleSubmit() {
      //this.bProcessDesign = this.bProcessDesignLocal
      this.$emit("enableEditProcessDesign", this.bProcessDesignLocal);
    },
    handleBack() {
      this.$emit("enableBack");
    },
    changeDesignTypeListByParent(value) {
      this.$store.dispatch("designtypes/findByParent", value.id);
    },
  },
  created() {
    this.bProcessDesignLocal = this.bProcessDesign;
    this.bProcessDesignSpecificationLocal = this.bProcessDesignSpecification;
    this.$store.dispatch("designtypes/findAll");
    this.$store.dispatch("designtypes/findByParent",this.bProcessDesignSpecificationLocal.designType_Tipo_IO.id);
    /*
    this.$store
      .dispatch(
        "designtypes/findByParent",
        this.bProcessDesignSpecificationLocal.designType_Tipo_IO.id
      )
      .then(() => {
        console.log(this.designtypebyparentList);
      });
    */
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

