<template>
  <div>
    <CTitle
      :title="
        'Edit Process Design di ' +
        bProcessStep.name +
        ' (' +
        bProcessDesignLocal.processDesigns_id +
        ')'
      "
      buttonTitle=" nuovo process design "
      functionality=""
      :authenticated="isAuthenticated"
      :buttons="['salva', 'indietro']"
      @handleSubmit="handleSubmit"
      @handleBack="handleBack" />
    <!--
      
      //processDesigns_index
      processDesigns_id      
      processDesigns_descr
      
      designType_id
      designType_type
      
      informationObject_csmAppRoleId
      informationObject_description
      informationObject_id
      informationObject_name
      processDesignDescription_description
      processDesignDescription_id      
    -->
    <Label>Process Design</Label>
    <CCard>
      <CCardBody>
        <div class="row">
          <!--CInput
            class="col-2"
            label="index"
            placeholder="index"
            v-model="bProcessDesignLocal.processDesigns_index"
          /-->
          <CInput
            class="col-2"
            label="id"
            placeholder="id"
            v-model="bProcessDesignLocal.processDesigns_id" />
          <CTextarea
            class="col-10"
            label="description"
            placeholder="processDesigns_descr"
            v-model="bProcessDesignLocal.processDesigns_descr" />
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
            v-model="bProcessDesignLocal.processDesignDescription_id" />
          <CTextarea
            class="col-10"
            label="description"
            placeholder="description"
            v-model="
              bProcessDesignLocal.processDesignDescription_description
            " />
        </div>
      </CCardBody>
    </CCard>
    <Label>Design Type</Label>
    <CCard>
      <CCardBody>
        <div class="row">
          <CInput
            class="col-2"
            label="id"
            placeholder="id"
            v-model="bProcessDesignLocal.designType_id" />
          <div class="form-group col-5" role="group">
            <label class="col-12">Dati I/O</label>
            <v-select
              label="type"
              class="col-12 p-0"
              :options="designtypeList"
              placeholder="type"
              v-model="bProcessDesignLocal.designType_type"
              @input="changeProcessDesignType"></v-select>
          </div>
          <div class="form-group col-5" role="group">
            <label class="col-12">Tipo I/O</label>
            <v-select
              label="type"
              class="col-12 p-0"
              :options="designtypebyparentList"
              placeholder="type"
              v-model="designTypeSelected"></v-select>
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
            v-model="bProcessDesignLocal.informationObject_id" />
          <CInput
            class="col-8"
            label="name"
            placeholder="name"
            v-model="bProcessDesignLocal.informationObject_name" />
          <CInput
            class="col-2"
            label="csmAppRoleId"
            placeholder="csmAppRoleId"
            v-model="bProcessDesignLocal.informationObject_csmAppRoleId" />
          <CTextarea
            class="col-12"
            label="description"
            placeholder="description"
            v-model="bProcessDesignLocal.informationObject_description" />
        </div>
      </CCardBody>
    </CCard>
    <!--/CCardBody>
    </CCard-->
  </div>
</template>
<script>
import { mapGetters } from "vuex"
import CTitle from "@/components/CTitle.vue"
export default {
  name: "CBusinessProcessDesignEdit",
  components: {
    CTitle
  },
  data() {
    return {
      bProcessDesignLocal: {
        processDesigns_id: "",
        processDesigns_descr: "",

        processDesignDescription_id: "",
        processDesignDescription_description: "",

        designType_id: "",
        designType_type: "",

        informationObject_id: "",
        informationObject_name: "",
        informationObject_description: "",
        informationObject_csmAppRoleId: ""
      },
      bProcessDesignLocal_2: {
        id: "",
        description: "",
        name: "",
        label: "",
        processDesignDescription: {
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
          csmAppRoleId: ""
        }
      },
      designTypeSelected: { type: "" }
    }
  },
  computed: {
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("designtypes", ["designtypeList", "designtypebyparentList"])
  },
  //emits: ["enableEditProcessDesign"],
  props: {
    bProcessStep: {
      type: Object,
      required: true,
      default: () => {}
    },
    bProcessDesign: {
      type: Object,
      required: true,
      default: () => {}
    }
  },
  methods: {
    handleSubmit() {
      //this.bProcessDesign = this.bProcessDesignLocal
      this.$emit("enableEditProcessDesign", this.bProcessDesignLocal)
    },
    handleBack() {
      this.$emit("enableBack")
    },
    changeProcessDesignType(value) {
      this.bProcessDesignLocal.designType_id = value.id
      this.$store.dispatch(
        "designtypes/findByParent",
        this.bProcessDesignLocal.designType_id
      )
    }
  },
  created() {
    this.bProcessDesignLocal = this.bProcessDesign
    this.$store.dispatch("designtypes/findAll")
  }
}
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
