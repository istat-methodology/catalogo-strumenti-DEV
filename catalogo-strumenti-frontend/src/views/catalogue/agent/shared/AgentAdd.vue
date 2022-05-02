<template>
  <!-- wait until service is loaded -->
  <div>
    <div class="columns">
      <CInput label="Nome" placeholder="Nome" v-model="agentLocal.name" />
      <CInput
        label="Organizzazione"
        placeholder="Organizzazione"
        v-model="agentLocal.organization"
      />
      <CInput
        label="Contatto"
        placeholder="Contatto"
        v-model="agentLocal.contact"
      />

      <!--CInput label="Note" placeholder="Note" v-model="agentLocal.notes" /-->
      
        
        <CTextarea
        label="Note"                   
          placeholder="Note"
          v-model="agentLocal.notes"
        />                
      

      <div class="card-footer">
        <CButton
          shape="square"
          size="sm"
          color="primary"
          class="mr-2"
          @click.prevent="handleSubmit"
          >Aggiungi</CButton
        >
        <CButton shape="square" size="sm" color="light" @click.prevent="goBack"
          >Indietro</CButton
        >
      </div>
    </div>
  </div>
</template>
<script>
/* import { required } from "vuelidate/lib/validators"; */
//import { mapGetters } from "vuex";
export default {
  name: "AgentAdd",
  data() {
    return {
      agentLocal: {
        id: 0,
        name: "",
        organization: "",
        contact: "",
        notes: "",
      },
    };
  },
  emits: ["appClose"],
  props: {
    goBackClose: {
      type: Boolean,
      required: false,
      default: () => false,
    },
  },

  methods: {
    handleSubmit() {
      this.$store
        .dispatch("agent/save", this.agentLocal)
        .then(this.$store.dispatch("agent/findAll"))
        .then(this.goBack());
      /*   } */
    },
    goBack() {
      if (this.goBackClose) this.$emit("appClose", true);
      else this.$router.push("/catalogue/referenti");
    },
    onChange(event) {
      this.tipologia = event.target.value;
    },
  },
  created() {
    this.$store.dispatch("agent/findAll");
  },
};
</script>

<style scoped>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 50%;
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
h2 {
  font-size: 24px;
  color: #213547;
  margin-top: 10px !important;
  transition: color 0.5s;
  padding-top: 26px;
}
</style>


