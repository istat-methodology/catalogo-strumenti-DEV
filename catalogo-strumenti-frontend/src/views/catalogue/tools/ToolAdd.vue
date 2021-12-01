<template>
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>
          Nuovo Strumento Metodologico
        </CCardHeader>
        <CCardBody>
          <div class="row">
            <div class="col-6">
              <CCard class="card-no-border">
                <CCardBody>
                  <!-- <CInput
                    label="Dug"
                    placeholder="Dug"
                    :class="{ 'is-invalid': $v.dug.name.$error }"
                    v-model="dug.name"
                  />
                  <div class="help-block" :class="{ show: $v.dug.name.$error }">
                    This field is required
                  </div> -->
                  <CInput label="Nome" placeholder="Nome" v-model="tool.nome" />
                  <!--  <div class="help-block" :class="{ show: $v.dug.name.$error }">
            This field is required
          </div> -->
                  <CInput
                    label="Descrizione"
                    placeholder="Descrizione"
                    v-model="tool.descrizione"
                  />
                  <CInput
                    label="Autore"
                    placeholder="Autore"
                    v-model="tool.autore"
                  />
                  <CInput
                    label="Documentazione"
                    placeholder="Documentazione"
                    v-model="tool.documentazione"
                  />
                  <CInput
                    label="Metodo Statistico"
                    placeholder="Metodo Statistico"
                    v-model="tool.metodoStatistico"
                  />
                  <CInput
                    label="Note di Compilazione"
                    placeholder="Note di Compilazione"
                    v-model="tool.note"
                  />
                  <CInput
                    label="Standard"
                    placeholder="Standard"
                    v-model="tool.standard"
                  />
                  <CInput label="Tags" placeholder="Tags" v-model="tool.tags" />
                  <CInput
                    label="Versione"
                    placeholder="Versione"
                    v-model="tool.versione"
                  />
                  <CInput
                    label="Tipologia"
                    placeholder="Tipologia"
                    v-model="tool.tipologia"
                  />
                  <CInput
                    label="Riferimenti"
                    placeholder="Riferimenti"
                    v-model="tool.riferimenti"
                  />
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
export default {
  name: "ToolAdd",
  data() {
    return {
      tool: {
        id: "",
        data: "",
        descrizione: "",
        homepage: "",
        download: "",
        metodoStatistico: "",
        nome: "",
        note: "",
        standard: "",
        tags: "",
        versione: "",
        tipologia: "",
        riferimenti: ""
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
        .dispatch("tools/save", this.tool)
        .then(this.$router.push("/catalogue/tools"));
      /*   } */
    },
    goBack() {
      this.$router.push("/catalogue/tools");
    }
  }
};
</script>
