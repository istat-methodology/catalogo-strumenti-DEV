<template>
  <div>
    <CTitle
      :title="'Edit Process Design di ' + bProcessStep.name"
      buttonTitle=" nuovo process design "
      functionality=""
      :authenticated="isAuthenticated"
      :buttons="['salva', 'indietro']"
      @handleSubmit="handleSubmit"
      @handleBack="handleBack"
    />
    <CCard>
      <!--
designType_id
designType_type

informationObject_csmAppRoleId
informationObject_description
informationObject_id
informationObject_name

processDesignDescription_description
processDesignDescription_id
processDesigns_descr
processDesigns_id
processDesigns_index

        -->
      <CCardBody>
        <div class="row mt-4">
          <label class="col-12">Process Design</label>
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
            <CInput
              class="col-8"
              label="description"
              placeholder="processDesigns_descr"
              v-model="bProcessDesignLocal.processDesigns_descr"
            />
          </div>
        </div>

        <div class="row mt-4">
          <label class="col-12">Design Type</label>
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
            <CInput
              class="col-4"
              label="designType_type"
              placeholder="designType_type"
              v-model="bProcessDesignLocal.designType_type"
            />
          </div>
        </div>
        <div class="row mt-4">
          <label class="col-12">information Object</label>
          <div class="row">
            <CInput
              class="col-3"
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
              class="col-7"
              label="name"
              placeholder="name"
              v-model="bProcessDesignLocal.informationObject_name"
            />
          </div>
          <CTextarea
            class="col-12 mt-2"
            label="description"
            placeholder="description"
            v-model="bProcessDesignLocal.informationObject_description"
          />
        </div>

        <div class="row mt-4">
          <label class="col-12">Process Design Description</label>
          <div class="row">
            <CInput
              class="col-2"
              label="id"
              placeholder="id"
              v-model="bProcessDesignLocal.processDesignDescription_id"
            />
            <CInput
              class="col-10"
              label="description"
              placeholder="description"
              v-model="bProcessDesignLocal.processDesignDescription_description"
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
  name: "CBusinessProcessDesignEdit",
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
      this.bProcessDesign = this.bProcessDesignLocal;
      this.$emit("enableEditProcessDesign", this.bProcessDesign);
    },
    handleBack() {
      this.$emit("enableBack");
    },
  },
  created() {
    this.bProcessDesignLocal = this.bProcessDesign;
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
