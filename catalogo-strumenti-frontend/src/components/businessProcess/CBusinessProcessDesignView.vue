<template>
  <div>
    <CTitle
      :title="
        'View Process Design (' +
        bProcessDesignLocal.nr +
        '.' +
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

    <Label>Process Design</Label>
    <CCard>
      <CCardBody>
        <div class="row">
          <CInput
            class="col-1"
            label="index"
            placeholder="index"
            v-model="bProcessDesignLocal.nr"
          />
          <CInput
            class="col-1"
            label="id"
            placeholder="id"
            v-model="bProcessDesignLocal.processDesignId"
          />
          <CTextarea
            class="col-10"
            label="Description"
            placeholder="process designs description"
            v-model="bProcessDesignLocal.processDesignDescription"
          />
        </div>
      </CCardBody>
    </CCard>
    <Label>Process Specification</Label>

    <CCard>
      <CCardBody>
        <div class="row">
          <CInput
            class="col-2"
            label="id"
            placeholder="id"
            v-model="bProcessDesignLocal.processSpecification.id"
          />
        </div>
      </CCardBody>
    </CCard>

    <div
      v-for="item of bProcessDesignLocal.processSpecification"
      :key="item.id"
    >
    <Label>Design Type</Label>
      <CCard>
        <CCardBody>
          <div class="row">
            <CInput
              class="col-2"
              label="id"
              placeholder="id"
              v-model="item.designType.id"
            />
            <div class="form-group col-5" role="group">
              <label class="col-12">Dati I/O</label>
              <v-select
                label="type"
                class="col-12 p-0"
                :options="designtypeList"
                placeholder="type"
                v-model="item.designType.type"
                @input="changeProcessDesignType"
              ></v-select>
            </div>
            <div class="form-group col-5" role="group">
              <label class="col-12">Tipo I/O</label>
              <v-select
                label="type"
                class="col-12 p-0"
                :options="designtypebyparentList"
                placeholder="type"
                v-model="designTypeSelected"
              ></v-select>
            </div>
          </div>
        </CCardBody>
      </CCard>
      <Label>information Object</Label>
      <CCard>
        <CCardBody>
          <div class="row">
            <CInput
              class="col-2"
              label="id"
              placeholder="id"
              v-model="item.informationObject.id"
            />
            <CInput
              class="col-8"
              label="name"
              placeholder="name"
              v-model="item.informationObject.name"
            />
            <!--CInput
              class="col-2"
              label="csmAppRoleId"
              placeholder="csmAppRoleId"
              v-model="
                item.informationObject.csmAppRole.id
              "
            /-->
            <CTextarea
              class="col-12"
              label="description"
              placeholder="description"
              v-model="item.informationObject.description"
            />
          </div>
        </CCardBody>
      </CCard>
    </div>
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
      designTypeSelected: { type: "" },
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("designtypes", [
      "designtype",
      "designtypeList",
      "designtypebyparentList",
    ]),
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
  },
  methods: {
    handleSubmit() {
      //this.bProcessDesign = this.bProcessDesignLocal
      this.$emit("enableEditProcessDesign", this.bProcessDesignLocal);
    },
    handleBack() {
      this.$emit("enableBack");
    },
    changeProcessDesignType(value) {
      this.bProcessDesignLocal.designType_id = value.id;
      this.$store.dispatch(
        "designtypes/findByParent",
        this.bProcessDesignLocal.designType_id
      );
    },
  },
  created() {
    this.bProcessDesignLocal = this.bProcessDesign;
    this.$store.dispatch("designtypes/findAll");
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
