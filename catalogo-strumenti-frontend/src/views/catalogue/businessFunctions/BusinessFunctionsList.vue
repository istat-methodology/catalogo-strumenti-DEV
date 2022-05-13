<template>
  <div class="row">
    <div class="col-12">
      <h2 class="pt-4">
        Elenco Processi
        <div class="card-header-actions">
          <router-link tag="a" :to="{ name: 'BusinessFunctionsAdd' }">
            <add-icon />
          </router-link>
        </div>
      </h2>
      <div class="card fade-in">
        <!--  <CCard>
          <CCardHeader>Elenco Strumenti</CCardHeader>
 -->
        <CCardBody>
          <CDataTable
            v-if="bFunctionList"
            :items="getBusinessFunctionList"
            :fields="fields"
            column-filter
            :items-per-page="10"
            sorter
            hover
            pagination
            ><template #show_details="{ item }">
              <td>
                <router-link
                  tag="a"
                  :to="{
                    name: 'BusinessFunctionsDetails',
                    params: { id: item.id }
                  }"
                >
                  <view-icon />
                </router-link>
              </td>
              <td v-if="isAuthenticated">
                <router-link
                  tag="a"
                  :to="{
                    name: 'BusinessFunctionsEdit',
                    params: { id: item.id }
                  }"
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
        <CButton
          shape="square"
          size="sm"
          color="primary"
          @click="deleteBusiness"
        >
          Delete
        </CButton>
      </template>
      Elimina Business Function '{{ selectedBusiness.name }}'?
    </CModal>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "BusinessFunctionsList",
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
          _style: "width:60%;"
        },
        {
          key: "label",
          label: "Etichetta",
          _style: "width:10%;"
        },
        {
          key: "gsbpm",
          label: "Gsbpm",
          _style: "width:30%;"
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
    ...mapGetters("bFunction", ["bFunctionList"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("filter", ["params"]),
    /* getBusinessList() {
      return this.businessList.map(item => {
        return Object.assign({}, item, {
          id: item.id,
          name: item.name == null ? "" : item.name,
          descr: item.descr == null ? "" : item.descr,
          label: item.label == null ? "" : item.label,
          gsbpm: item.gsbpmProcesses
            .map(gsbpmProcess => {
              return gsbpmProcess.name;
            })
            .join(", ")
        });
      });
    } */
    getBusinessFunctionList: function() {
      if (this.bFunctionList) {
        return this.bFunctionList.map(business => {
          return {
            id: business.id,
            name: business.name == null ? "" : business.name,
            descr: business.descr == null ? "" : business.descr,
            label: business.label == null ? "" : business.label,
            gsbpm:
              business.gsbpmProcesses == null
                ? ""
                : business.gsbpmProcesses
                    .map(gsbpmProcess => {
                      return gsbpmProcess.code + " " + gsbpmProcess.name;
                    })
                    .join(", ")
          };
        });
      } else {
        return [];
      }
    }
  },

  methods: {
    deleteBusiness() {
      this.$store
        .dispatch("bFunction/delete", this.selectedBusiness.id)
        .catch(() => {});
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
    this.$store
      .dispatch("coreui/setContext", Context.BusinessList)
      .catch(() => {});
    // if (this.params) {
    this.$store.dispatch("bFunction/filter", this.params).catch(() => {});
    //this.$store.dispatch("business/findAll");
    // }
  }
};
</script>
