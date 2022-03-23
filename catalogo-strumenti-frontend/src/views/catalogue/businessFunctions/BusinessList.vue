<template>
  <div class="row">
    <div class="col-12">
      <div class="card fade-in">
        <header class="card-header">
          Elenco Business Functions
          <div class="card-header-actions">
            <router-link tag="a" :to="{ name: 'BusinessList' }">
              <add-icon />
            </router-link>
          </div>
        </header>
        <!--  <CCard>
          <CCardHeader>Elenco Strumenti</CCardHeader>
 -->
        <CCardBody>
          <CDataTable
            v-if="businessList"
            :items="getBusinessList"
            :fields="fields"
            column-filter
            :items-per-page="10"
            sorter
            hover
            pagination
            ><template #show_details="{item}">
              <td>
                <router-link
                  tag="a"
                  :to="{
                    name: 'BusinessDetails',
                    params: { id: item.id }
                  }"
                >
                  <view-icon />
                </router-link>
              </td>
              <td v-if="isAuthenticated">
                <router-link
                  tag="a"
                  :to="{ name: 'BusinessEdit', params: { id: item.id } }"
                >
                  <edit-icon />
                </router-link>
              </td>
              <td>
                <span class="icon-link" @click="modalOpen(item)"
                  ><delete-icon
                /></span>
              </td>

              <!-- <td v-if="isAuthenticated">
                <router-link tag="a" :to="{ name: 'ToolAdd' }">
                  <delete-icon />
                </router-link>
              </td> -->
            </template>
          </CDataTable>
        </CCardBody>
        <!--   </CCard> -->
      </div>
    </div>
    <CModal title="Warning!" :show.sync="warningModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="modalClose">
          Close
        </CButton>
        <!-- <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="deleteBusiness"
        >
          Delete
        </CButton> -->
      </template>
      Elimina Business Function '{{ selectedBusiness.name }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "businessList",
  data() {
    return {
      fields: [
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "name",
          label: "Nome",
          _style: "width:30%;"
        },
        {
          key: "descr",
          label: "Descrizione",
          _style: "width:60%;"
        },
        {
          key: "label",
          label: "Etichetta",
          _style: "width:30%;"
        },
        {
          key: "gsbpm",
          label: "Gsbpm",
          _style: "width:60%;"
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ],
      selectedBusiness: {},
      warningModal: false
    };
  },
  computed: {
    ...mapGetters("business", ["businessList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    getBusinessList: function() {
      return this.businessList.map(business => {
        return {
          name: business.name == null ? "" : business.name,
          descr: business.descr == null ? "" : business.descr.isnull,
          label: business.label == null ? "" : business.label,
          gsbpm: business.gsbpm == null ? "" : business.gsbpm
        };
      });
    }
  },

  methods: {
    deleteDocumentation() {
      this.$store.dispatch("business/delete", this.selectedBusiness.id);
      this.warningModal = false;
    },
    modalOpen(app) {
      this.selectedBusiness = app;
      this.warningModal = true;
    },
    modalClose() {
      this.warningModal = false;
    }
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.BusinessList);
    // if (this.params) {
    // this.$store.dispatch("tools/filter", this.params);
    this.$store.dispatch("business/findAll");
    // }
  }
};
</script>
