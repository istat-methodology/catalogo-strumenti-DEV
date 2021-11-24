<template>
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>
          New Statistical Service
        </CCardHeader>
        <CCardBody>
          <div class="row">
            <div class="col-6">
              <CCard class="card-no-border">
                <CCardBody>
                  <CInput
                    label="Metodi Esposti"
                    placeholder="metodiEposti"
                    v-model="statservice.metodiEsposti"
                  />
                  <CInput
                    label="Dipendenze"
                    placeholder="Dipendenze"
                    v-model="statservice.dipendenze"
                  />
                  <CInput
                    label="Potocollo"
                    placeholder="Protocollo"
                    v-model="statservice.protocollo"
                  />
                  <label>Tool</label>
                  <v-select
                    label="nome"
                    :options="toolscatalog"
                    :reduce="option => option.id"
                    v-model="statservice.toolId"
                    placeholder="Tool"
                    :class="{
                      'is-invalid': $v.statservice.toolId.$error
                    }"
                  ></v-select>
                </CCardBody>
                <CCardFooter>
                  <CButton
                    shape="square"
                    size="sm"
                    color="primary"
                    class="mr-2"
                    @click.prevent="handleSubmit"
                    >Save</CButton
                  >
                  <CButton
                    shape="square"
                    size="sm"
                    color="light"
                    @click="goBack"
                    >Back</CButton
                  >
                </CCardFooter>
              </CCard>
            </div>
          </div>
        </CCardBody>
      </CCard>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
import { required } from "vuelidate/lib/validators";
export default {
  name: "StatServiceAdd",
  computed: {
    ...mapGetters("tools", ["toolscatalog"]),
    ...mapGetters("services", ["services"])
  },
  data() {
    return {
      statservice: {
        id: 0,
        metodiEsposti: "",
        dipendenze: "",
        protocollo: "",
        toolId: ""
      }
    };
  },
  validations: {
    statservice: {
      toolId: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      if (!this.$v.statservice.toolId.$invalid) {
        this.$store
          .dispatch("services/save", this.statservice)
          .then(this.$router.push("/catalogue/statservicelist"));
      }
    },
    goBack() {
      this.$router.push("/catalogue/statservicelist");
    }
  },
  created() {
    this.$store.dispatch("tools/findAll");
  }
};
</script>
