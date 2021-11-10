<template>
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>
          New Desktop Application
        </CCardHeader>
        <CCardBody>
          <div class="row">
            <div class="col-6">
              <CCard class="card-no-border">
                <CCardBody>
                  <CInput
                    label="Dipendenze"
                    placeholder="Dipendenze"
                    v-model="deskapp.dipendenze"
                  />
                  <CInput
                    label="Download"
                    placeholder="Download"
                    v-model="deskapp.download"
                  />
                  <CInput
                    label="Licenza"
                    placeholder="Liceenza"
                    v-model="deskapp.licenza"
                  />
                  <CInput
                    label="Linguaggio"
                    placeholder="Linguaggio"
                    v-model="deskapp.linguaggio"
                  />
                  <CInput
                    label="Pacchetto"
                    placeholder="Pacchetto"
                    v-model="deskapp.pacchetto"
                  />
                  <CInput
                    label="Sistema Operativo"
                    placeholder="Sistema Operativo"
                    v-model="deskapp.sistemaOperativo"
                  />
                  <label>Tool</label>
                  <v-select
                    label="nome"
                    :options="toolscatalog"
                    v-model="deskapp.tool"
                    :reduce="option => option.id"
                    placeholder="Tool"
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
export default {
  name: "DeskAppAdd",
  computed: {
    ...mapGetters("tools", ["toolscatalog"])
  },
  data() {
    return {
      deskapp: {
        id: "",
        dipendenze: "",
        download: "",
        licenza: "",
        linguaggio: "",
        pacchetto: "",
        sistemaOperativo: "",
        tool: ""
      }
    };
  },
  /* validations: {
    tool: {
      name: {
        required
      }
    }
  }, */
  methods: {
    handleSubmit() {
      /*  this.$v.$touch(); //validate form data
      if (!this.$v.tool.$invalid) {*/
      this.$store
        .dispatch("applications/save", this.deskapp)
        .then(this.$router.push("/catalogue/deskapplist"));
      /*   } */
    },
    goBack() {
      this.$router.push("/catalogue/deskapplist");
    }
  }
};
</script>
