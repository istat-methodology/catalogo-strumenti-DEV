<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Nuova Documentazione</CCardHeader>
        <CCardBody>
          <CInput
            label="Nome"
            placeholder="Nome"
            v-model="documentationLocal.name"
          />
          <CInput
            label="Editore"
            placeholder="Editore"
            v-model="documentationLocal.publisher"
          />
          <CInput
            label="Documento"
            placeholder="Documento"
            v-model="documentationLocal.documentType"
          />
          <CInput
            label="Note"
            placeholder="Note"
            v-model="documentationLocal.notes"
          />
          <CInput
            label="Fonti"
            placeholder="Fonti"
            v-model="documentationLocal.resource"
          />
          <div>
            <label>Strumento Statistico</label>
          </div>

          <v-select
            label="name"
            :options="toolscatalog"
            placeholder="Strumento Statistico"
            @input="changeTool"
          ></v-select>
        </CCardBody>
      </CCard>

      <CCardFooter>
        <CButton
          shape="square"
          size="sm"
          color="primary"
          class="mr-2"
          @click.prevent="handleSubmit"
          >Aggiungi</CButton
        >
        <CButton shape="square" size="sm" color="light" @click.prevent="goBack"
          >Back</CButton
        >
      </CCardFooter>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
export default {
  name: "documentationlAdd",
  data() {
    return {
      documentationLocal: {
        id: "",
        name: "",
        publisher: "",
        documentType: "",
        notes: "",
        resource: "",
        tool: ""
      }
    };
  },
  computed: {
    ...mapGetters("tools", ["toolscatalog"])
  },
  methods: {
    changeTool(value) {
      this.documentationLocal.tool = value.id;
    },
    handleSubmit() {
      this.$store
        .dispatch("documentation/save", this.documentationLocal)
        .then(this.$router.push("/catalogue/documentazione"));
      /*   } */
    },
    goBack() {
      this.$router.push("/catalogue/documentazione");
    },
    onChange(event) {
      this.tipologia = event.target.value;
    }
  },
  created() {
    this.$store.dispatch("documentation/findAll");
    this.$store.dispatch("tools/findAll");
  }
};
</script>
