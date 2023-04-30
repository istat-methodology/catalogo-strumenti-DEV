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
        bProcessDesignLocal.id +
        ') / ' +
        'Process Specification (' +
        //bProcessSpecificationLocal.id +
        ') '
      "
      buttonTitle=" process specification "
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
                v-model="bProcessSpecificationLocal.designType.id"
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
                v-model="bProcessSpecificationLocal.designType.id"
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
              v-model="bProcessSpecificationLocal.informationObject.id"
            />
            <CInput
              class="col-10"
              label="name"
              placeholder="name"
              v-model="bProcessSpecificationLocal.informationObject.name"
            />
            <!--CInput
                class="col-2"
                label="csmAppRoleId"
                placeholder="csmAppRoleId"
                v-model="bProcessSpecificationLocal.informationObject.csmAppRole.id"
              /-->
          </div>
          <div class="row">
            <CTextarea
              class="col-12"
              label="description"
              placeholder="description"
              v-model="bProcessSpecificationLocal.informationObject.description"
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
export default {
  name: "CBusinessProcessDesignNew",
  components: {
    CTitle,
  },
  data() {
    return {
      bProcessDesignLocal: {},
      bProcessSpecificationToSave: {
        id: 0,
        processDesign: 0,
        designType: 0,
        informationObject: 0,
      },

      bProcessSpecificationLocal: {
        id: 0,
        processDesign: {
          id: 0,
          descr: "string",
        },
        designType: {
          id: 0,
          type: "string",
          parent: 0,
        },
        informationObject: {
          id: 0,
          name: "string",
          descr: "string",
          csmAppRoleId: "string",
          businessService: {
            id: 0,
            name: "string",
            descr: "string",
          },
        },
      },
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("designtypes", ["designtypeList", "designtypebyparentList"]),
  },
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
  },
  methods: {
    handleSubmit() {
      //this.bProcessDesign = this.bProcessDesignLocal
      this.$emit("enableNewProcessSpecification", this.bProcessDesignLocal);
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
    this.$store.dispatch("designtypes/findAll");
    this.$store.dispatch("designtypes/findByParent", parseInt(parseInt(1)));
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
