<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Tool</CCardHeader>
        <CCardBody>
          <CInput label="Nome" placeholder="Nome" v-model="tool.nome" />

          <CInput
            label="Descrizione"
            placeholder="Descrizione"
            v-model="tool.descrizione"
          />
        </CCardBody>
      </CCard>
      <CCard>
        <CCardHeader>Tool Details</CCardHeader>
        <CCardBody>
          <CTabs variant="pills" :active-tab="0">
            <CTab title="Desktop Applications">
              <CDataTable
                :items="applications"
                :fields="fieldsApps"
                column-filter
                :items-per-page="10"
                sorter
                hover
                pagination
                ><!-- <template #show_details="{item}">
                  <td>
                    <router-link
                      tag="a"
                      :to="{
                        name: 'ToolDetails',
                        params: { id: item.id }
                      }"
                    >
                      <text-icon />
                    </router-link>
                  </td>
                </template>
                <template #show_update="{item}">
                  <td>
                    <router-link
                      tag="a"
                      :to="{
                        name: 'ToolEdit',
                        params: { id: item.id }
                      }"
                    >
                      <edit-icon />
                    </router-link>
                  </td>
                </template>
                <template #show_delete="{item}">
                  <td>
                    <span class="icon-link" @click="modalOpen(item)"
                      ><delete-icon
                    /></span>
                  </td>
                </template> -->
              </CDataTable>
            </CTab>
            <CTab title="Software Procedures">
              <CDataTable
                :items="applications"
                :fields="fieldsProcs"
                column-filter
                :items-per-page="10"
                sorter
                hover
                pagination
              >
              </CDataTable>
            </CTab>
            <CTab title="Statistical Services">
              <CDataTable
                :items="applications"
                :fields="fieldsServs"
                column-filter
                :items-per-page="10"
                sorter
                hover
                pagination
              >
              </CDataTable>
            </CTab>
            <CTab title="Statistical Methods">
              <CDataTable
                :items="methods"
                :fields="fieldsMethods"
                column-filter
                :items-per-page="10"
                sorter
                hover
                pagination
              >
              </CDataTable>
            </CTab>
          </CTabs>
        </CCardBody>
        <CCardFooter>
          <!-- <CButton
            shape="square"
            size="sm"
            color="primary"
            class="mr-2"
            @click.prevent="handleSubmit"
            >Update</CButton
          > -->
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
/* import { required } from "vuelidate/lib/validators"; */
import { mapGetters } from "vuex";
export default {
  name: "ToolDetails",
  data() {
    return {
      fieldsApps: [
        {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        },
        {
          key: "dipendenze",
          label: "Dipendenze",
          _style: "width:10%;"
        },
        {
          key: "download",
          label: "Download",
          _style: "width:10%;"
        },
        {
          key: "licenza",
          label: "Licenza",
          _style: "width:10%;"
        },
        {
          key: "linguaggio",
          label: "Linguaggio",
          _style: "width:10%;"
        },
        {
          key: "pacchetto",
          label: "Pacchetto",
          _style: "width:10%;"
        },
        {
          key: "sistemaOperativo",
          label: "Sistema Operativo",
          _style: "width:10%;"
        },
        {
          key: "tool",
          label: "Tool",
          _style: "width:10%;"
        }
      ],
      fieldsProcs: [
        {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        },
        {
          key: "codice",
          label: "Codice",
          _style: "width:10%;"
        },
        {
          key: "sintassi",
          label: "Sintassi",
          _style: "width:10%;"
        },
        {
          key: "dipendenze",
          label: "Dipendenze",
          _style: "width:10%;"
        },
        {
          key: "linguaggio",
          label: "Linguaggio",
          _style: "width:10%;"
        },
        {
          key: "tool",
          label: "Tool",
          _style: "width:10%;"
        }
      ],
      fieldsServs: [
        {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        },
        {
          key: "metodiEsposti",
          label: "Metodi Esposti",
          _style: "width:10%;"
        },
        {
          key: "dipendenze",
          label: "Dipendenze",
          _style: "width:10%;"
        },
        {
          key: "protoollo",
          label: "Protoollo",
          _style: "width:10%;"
        },
        {
          key: "tool",
          label: "Tool",
          _style: "width:10%;"
        }
      ],
      fieldsMethods: [
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
          key: "autore",
          label: "Autore",
          _style: "width:10%;"
        },
        {
          key: "obietivo",
          label: "Obiettivo",
          _style: "width:10%;"
        },
        {
          key: "descrizione",
          label: "Descrizione",
          _style: "width:10%;"
        },
        {
          key: "generalita",
          label: "Generalità",
          _style: "width:10%;"
        },
        {
          key: "ipotesi",
          label: "Ipotesi",
          _style: "width:10%;"
        },
        {
          key: "limiti",
          label: "Limiti",
          _style: "width:10%;"
        },
        {
          key: "indicatoriQualita",
          label: "Inicatori Qualità",
          _style: "width:10%;"
        }
      ]
    };
  },
  computed: {
    ...mapGetters("applications", ["applications"]),
    ...mapGetters("methods", ["methods"]),
    ...mapGetters("tools", ["tool"])
  },
  methods: {
    /* handleSubmit() {
      this.$store.dispatch("tools/update", this.tool).then(() => {
        this.backToList();
      });
    }, */
    backToList() {
      this.$router.push("/catalogue/tools");
    }
  },
  created() {
    this.$store.dispatch(
      "applications/findApplications",
      this.$route.params.id
    );
    this.$store.dispatch("methods/findMethods", this.$route.params.id);
    this.$store.dispatch("tools/findById", this.$route.params.id);
  }
};
</script>
