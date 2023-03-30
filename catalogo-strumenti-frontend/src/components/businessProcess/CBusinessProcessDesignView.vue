<template>
  <div>
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
    <CCard v-if="designtypebyparentList">
      <CCardBody>
        <Label>Design Type ()</Label>
        <div class="col-12">
          <div class="row">
            <div class="form-group col-5" role="group">
              <label class="col-12">Tipo I/O</label>
              <select
                class="p-1 ml-0 col-12 form-control"
                @change="changeDesignTypeListByParent($event)"
                v-model="bProcessDesignSpecification.designType_Tipo_IO.id"
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
            <div class="form-group col-5" role="group">
              <label class="col-12">Dati I/O</label>
              <select
                class="p-1 ml-0 col-12 form-control"
                @change="onChangeDesignType_Data_IO($event)"
                v-model="bProcessDesignSpecification.designType_Dati_IO.id"
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
          <div class="row">
            <Label class="col-12">Information Object</Label>
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
    changeDesignTypeListByParent(event) {
      this.$store.dispatch("designtypes/findByParent", event.target.value);
    },
    onChangeDesignType_Data_IO(event) {
      alert(event.target.value);
    },
  },
  created() {
    this.bProcessDesignLocal = this.bProcessDesign;
    this.bProcessDesignSpecificationLocal = this.bProcessDesignSpecification;
    this.$store.dispatch("designtypes/findAll");
    this.$store.dispatch(
      "designtypes/findByParent",
      parseInt(parseInt(this.bProcessDesignSpecification.designType_Tipo_IO.id))
    );
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
