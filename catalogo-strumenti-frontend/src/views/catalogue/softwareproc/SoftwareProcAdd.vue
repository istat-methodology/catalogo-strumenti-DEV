<template>
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>
          New Software Procedure
        </CCardHeader>
        <CCardBody>
          <div class="row">
            <div class="col-6">
              <CCard class="card-no-border">
                <CCardBody>
                  <CInput
                    label="Codice"
                    placeholder="Codice"
                    v-model="softproc.codice"
                  />
                  <CInput
                    label="Sintassi"
                    placeholder="Sintassi"
                    v-model="softproc.sintassi"
                  />
                  <CInput
                    label="Dipendenze"
                    placeholder="Dipendenze"
                    v-model="softproc.dipendenze"
                  />
                  <CInput
                    label="Linguaggio"
                    placeholder="Linguaggio"
                    v-model="softproc.linguaggio"
                  />
                  <label>Tool</label>
                  <v-select
                    label="nome"
                    :options="toolscatalog"
                    :reduce="option => option.id"
                    v-model="softproc.toolId"
                    placeholder="Tool"
                    :class="{
                      'is-invalid': $v.softproc.toolId.$error
                    }"
                  ></v-select>

                  <!-- <v-select
                    v-model="selected"
                    :reduce="option => option.id"
                    :options="[
                      { label: 'One', id: 1 },
                      { label: 'Two', id: 2 }
                    ]"
                  /> -->

                  <!-- <CInput
                    label="Tool"
                    placeholder="Tool"
                    v-model="deskapp.tool"
                  /> -->
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
  name: "DeskAppAdd",
  computed: {
    ...mapGetters("tools", ["toolscatalog"]),
    ...mapGetters("procedures", ["procedure"])
  },
  data() {
    return {
      softproc: {
        id: 0,
        codice: "",
        sintassi: "",
        dipendenze: "",
        linguaggio: "",
        toolId: ""
      }
    };
  },
  validations: {
    softproc: {
      toolId: {
        required
      }
    }
  },
  methods: {
    handleSubmit() {
      if (!this.$v.softproc.toolId.$invalid) {
        this.$store
          .dispatch("procedures/save", this.softproc)
          .then(this.$router.push("/catalogue/softwareproclist"));
      }
    },
    goBack() {
      this.$router.push("/catalogue/softpoclist");
    }
  },
  created() {
    this.$store.dispatch("tools/findAll");
  }
};
</script>
