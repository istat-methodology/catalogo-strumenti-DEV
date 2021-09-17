<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Tool</CCardHeader>
        <CCardBody>
          <CInput label="Name" placeholder="Name" />
          <!--  <div class="help-block" :class="{ show: $v.dug.name.$error }">
            This field is required
          </div> -->
        </CCardBody>
        <CCardFooter>
          <CButton
            shape="square"
            size="sm"
            color="primary"
            class="mr-2"
            @click.prevent="handleSubmit"
            >Next</CButton
          >
          <CButton
            shape="square"
            size="sm"
            color="light"
            @click.prevent="backToList"
            >Back</CButton
          >
        </CCardFooter>
      </CCard>
    </div>
  </div>
</template>
<script>
/* import { mapGetters } from "vuex";
import { required } from "vuelidate/lib/validators"; */
export default {
  name: "ToolEdit",
  /*  computed: {
    ...mapGetters("dug", ["dug"])
  },
  validations: {
    dug: {
      name: {
        required
      }
    }
  }, */
  methods: {
    handleSubmit() {
      this.$v.$touch(); //validate form data
      if (!this.$v.dug.$invalid) {
        this.$store.dispatch("tool/update", this.dug).then(() => {
          this.backToList();
        });
      }
    },
    backToList() {
      //this.$router.push("/catalogue/tools");
    }
  },
  created() {
    //this.$store.dispatch("tool/findById", this.$route.params.id);
  }
};
</script>
