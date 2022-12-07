<template>
  <div>
    <CTitle
      :title="'New Process Design di ' + bProcessStep.name"
      buttonTitle=" nuovo process design "
      functionality=""
      :authenticated="isAuthenticated"
      :buttons="['salva', 'indietro']"
      @handleSubmit="handleSubmit"
      @handleBack="handleBack"
    />
    <!--CCard>
      <CCardBody-->
    <Label>Process Design</Label>
    <CCard>
      <CCardBody>
        <div class="row">
          <CInput
            class="col-2"
            label="index"
            placeholder="index"
            v-model="bProcessDesignLocal.processDesigns_index"
          />
          <CInput
            class="col-2"
            label="id"
            placeholder="id"
            v-model="bProcessDesignLocal.processDesigns_id"
          />
          <CTextarea
            class="col-8"
            label="description"
            placeholder="processDesigns_descr"
            v-model="bProcessDesignLocal.processDesigns_descr"
          />
        </div>
      </CCardBody>
    </CCard>
    <Label>Process Design Description</Label>
    <CCard>
      <CCardBody>
        <div class="row">
          <CInput
            class="col-2"
            label="id"
            placeholder="id"
            v-model="bProcessDesignLocal.processDesignDescription_id"
          />
          <CTextarea
            class="col-10"
            label="description"
            placeholder="description"
            v-model="bProcessDesignLocal.processDesignDescription_description"
          />
        </div>
      </CCardBody>
    </CCard>
    <Label>Design Type</Label>
    <CCard>
      <CCardBody>
        <div class="row">
          <CInput
            class="col-2"
            label="Index"
            placeholder="index"
            v-model="bProcessDesignLocal.index"
          />
          <CInput
            class="col-2"
            label="id"
            placeholder="id"
            v-model="bProcessDesignLocal.designType_id"
          />
          <!--CCInput
            class="col-8"
            label="type"
            placeholder="type"
            v-model="bProcessDesignLocal.designType_type"
          /-->

          <div class="form-group col-4" role="group">
            <label class="col-12">type</label>
            <v-select
              label="type"
              class="col-12 p-0"
              :options="bProcessDesignLocal.designType_type"
              placeholder="type"
              v-model="bProcessDesignLocal.designType_type"
            ></v-select>
          </div>
          <div class="form-group col-4" role="group">
            <label class="col-12">subtype</label>
            <v-select
              label="type"
              class="col-12 p-0"
              :options="bProcessDesignLocal.designType_type"
              placeholder="type"
              v-model="bProcessDesignLocal.designType_type"
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
            label="csmAppRoleId"
            placeholder="csmAppRoleId"
            v-model="bProcessDesignLocal.informationObject_csmAppRoleId"
          />
          <CInput
            class="col-2"
            label="id"
            placeholder="id"
            v-model="bProcessDesignLocal.informationObject_id"
          />
          <CInput
            class="col-8"
            label="name"
            placeholder="name"
            v-model="bProcessDesignLocal.informationObject_name"
          />
          <CTextarea
            class="col-12"
            label="description"
            placeholder="description"
            v-model="bProcessDesignLocal.informationObject_description"
          />
        </div>
      </CCardBody>
    </CCard>
    <!--/CCardBody>
    </CCard-->
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
    };
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
  },
  //emits: ["enableNewProcessDesign"],
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
      this.bProcessDesign = this.bProcessDesignLocal;
      this.$emit("enableNewProcessDesign", this.bProcessDesign);
    },
    handleBack() {
      this.$emit("enableBack");
    },
  },
  created() {},
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
