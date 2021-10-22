<template>
  <!-- wait until service is loaded -->
  <div class="row">
    <div class="col-12">
      <CCard>
        <CCardHeader>Tool Details</CCardHeader>
        <CCardBody>
          <CTabs variant="pills" :active-tab="0">
            <CTab title="Desktop Applications" v-if="applications">
              <CDataTable
                :items="applications"
                :fields="fields"
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
                :fields="fields"
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
                :fields="fields"
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
                :items="applications"
                :fields="fields"
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
      fields: [
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
      ]
    };
  },
  computed: {
    ...mapGetters("applications", ["applications"])
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
  }
};
</script>
