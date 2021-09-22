<template>
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>
          New Tool
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
                  <CInput label="Nome" placeholder="Nome" />
                  <!--  <div class="help-block" :class="{ show: $v.dug.name.$error }">
            This field is required
          </div> -->
                  <CInput label="Descrizione" placeholder="Descrizione" />
                  <CInput label="Autore" placeholder="Autore" />
                  <CInput label="Documentazione" placeholder="Documentazione" />
                  <CInput
                    label="Metodo Statistico"
                    placeholder="Metoo Statistico"
                  />
                  <CInput
                    label="Note di Compilazione"
                    placeholder="Note di Compilazione"
                  />
                  <CInput label="Standard" placeholder="Standard" />
                  <CInput label="Tags" placeholder="Tags" />
                  <CInput label="Versione" placeholder="Versione" />
                  <CInput label="Tipologia" placeholder="Tipologia" />
                  <CInput label="Riferimenti" placeholder="Riferimenti" />
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
      tool: [
        {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        },
        {
          key: "nome",
          label: "Nome",
          _style: "width:10%;"
        },
        {
          key: "descrizione",
          label: "Descrizione",
          _style: "width:10%;"
        },
        {
          key: "autore",
          label: "Autore",
          _style: "width:10%;"
        },
        {
          key: "data",
          label: "Data",
          _style: "width:10%;"
        },
        {
          key: "documentazione",
          label: "Documentazione",
          _style: "width:10%;"
        },
        {
          key: "metodoStatistico",
          label: "Metodo Statistico",
          _style: "width:10%;"
        },
        {
          key: "show_update",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        },
        {
          key: "show_delete",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ]
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
        .then(this.$router.push("/catalogue/tool"));
      /*   } */
    },
    goBack() {
      this.$router.push("/catalogue/tool");
    }
  }
};
</script>
