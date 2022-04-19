<template>
  <div class="row">
    <div class="col-12" v-if="isLoading">
      <tile></tile>
    </div>
    <div class="col-12" v-else>
      
        <h2>
          Elenco Strumenti
          <div class="card-header-actions">
            <router-link tag="a" :to="{ name: 'ToolAdd' }"  v-if="isAuthenticated">
              <button class="btn btn-primary" type="button">
              <add-icon /> Nuovo
              </button>
            </router-link>
          </div>
        </h2>
        <!--  <CCard>
          <CCardHeader>Elenco Strumenti</CCardHeader>
 -->
      <div class="card fade-in">
        <CCardBody>
          <CDataTable
            v-if="toolscatalog"
            :items="computedItems"
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
                  :to="{ name: 'ToolDetails', params: { id: item.id } }"
                >
                  <view-icon />
                </router-link>
              </td>
              <td v-if="isAuthenticated">
                <router-link
                  tag="a"
                  :to="{ name: 'ToolEdit', params: { id: item.id } }"
                >
                  <edit-icon />
                </router-link>
              </td>
              <td v-if="isAuthenticated">
                <router-link tag="a" :to="{ name: 'ToolAdd' }">
                  <delete-icon />
                </router-link>
              </td>
            </template>
          </CDataTable>
        </CCardBody>
        <!--   </CCard> -->
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { Context } from "@/common";
export default {
  name: "ToolList",
  data() {
    return {
      /*
      fields: [
        {
          key: "name",
          label: "Nome",
          _style: "width:20%;"
        },
        {
          key: "description",
          label: "Descrizione",
          _style: "width:20%;"
        },
        {
          key: "standardIstat",
          label: "Standard Istat",
          _style: "width:10%;"
        },
        {
          key: "tags",
          label: "Tags",
          _style: "width:30%;"
        },
        {
          key: "version",
          label: "Versione",
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
      */
      fields: [
        /*  {
          key: "id",
          label: "Identificativo",
          _style: "width:10%;"
        }, */
        {
          key: "name",
          label: "Nome",
          _style: "width:20%;"
        },
        {
          key: "tooltype",
          label: "Tipologia",
          _style: "width:20%;"
        },
        {
          key: "gsbpm",
          label: "Gsbpm",
          _style: "width:30%;"
        },
        {
          key: "methods",
          label: "Metodi",
          _style: "width:30%;"
        },
        {
          key: "show_details",
          label: "",
          _style: "width:1%",
          sorter: false,
          filter: false
        }
      ]
    };
  },
  computed: {
    ...mapGetters("coreui", ["isLoading"]),
    ...mapGetters("tools", ["toolscatalog"]),
    ...mapGetters("auth", ["isAuthenticated"]),
    ...mapGetters("filter", ["params"]),
    computedItems() {
      if (this.toolscatalog) {
        return this.toolscatalog.map(item => {
          return Object.assign({}, item, {
            tooltype: item.toolType.name,
            gsbpm: item.gsbpmProcesses
              .map(gsbpmProcess => {                
                return gsbpmProcess.code + " " +  gsbpmProcess.name;

              })
              .join(", "),
            methods: item.statisticalMethods
              .map(method => {
                return method.name;
              })
              .join(", ")
          });
        });
      } else {
        return [];
      }
    }
  },
  created() {
    this.$store.dispatch("coreui/setContext", Context.ToolList);
    // if (this.params) {
    this.$store.dispatch("tools/filter", this.params);
    //this.$store.dispatch("tools/findAll");
    // }
  }
};
</script>
<style scoped>
.card-header {
  font-weight: 600;
}
label {
  font-weight: bold;
  display: inline;
  padding: 15px;
}
.container {
  display: flex;
}
.container-rigth {
  position: -webkit-sticky;
  position: sticky;
  top: 110px;
  display: -ms-flexbox;
  display: flex;
  -ms-flex: 0 1 306px;
  flex: 0 1 306px;
  height: 100%;
  margin: 0 80px 0 0;
  font-family: cousine, monospace;
  font-size: 14px;
  line-height: 16px;
}

/******************************/
.menu {
  font-size: 1rem;
  margin-bottom: 2rem;
  padding: 0;
  position: relative;
}
.menu-heading {
  font: var(--type-heading-h6);
  letter-spacing: 1.5px;
  margin: 0 0 1rem;
  text-transform: uppercase;
}
.list-item {
  border-left: 2px solid #aebad1;
  list-style: none;
}
.list-item:hover,
.list-item-hover {
  border-left: 2px solid #1a1a1af6;
  list-style: none;
}

.item-link {
  display: block;
  padding: 0.5rem 1rem;
  font: var(--type-body-m);
  color: gray;
  font-weight: 600;
  text-decoration: none;
  cursor: pointer;
}

ol,
ul {
  list-style: none;
  padding: 0;
}
ul {
  list-style-type: disc;
}
a {
  text-decoration: none;
  color: gray;
}
.card:hover,
.card-hover {
  position: relative !important;
  display: flex !important;
  flex-direction: column !important;
  min-width: 0 !important;
  margin-bottom: 1.5rem !important;
  word-wrap: break-word !important;
  background-clip: border-box !important;
  border-radius: 0.25rem !important;
  background-color: #f9f9f9 !important;
  border: 1px solid #bbbbbb !important;
  box-shadow: none !important;
  transition: background-color 0.5s !important;
}
.card {
  position: relative !important;
  display: flex !important;
  flex-direction: column !important;
  min-width: 0 !important;
  margin-bottom: 1.5rem !important;
  word-wrap: break-word !important;
  background-clip: border-box !important;
  border-radius: 0.25rem !important;
  background-color: #f9f9f9 !important;
  border: none !important;
  box-shadow: none !important;
  transition: background-color 0.5s !important;
}
.border {
  border: 2px solid rgb(197, 197, 197) !important
  
  ;
}
.no-border {
  border: 0 !important;
}
.center {
  text-align: center;
}
.bold {
  font-weight: 700;
}
.list-group,
.list-group-horizontal,
.list-group-item {
  border-radius: 0 !important;
  border: 0 !important;
}
.list-group-active {
  border-color: rgba(255, 255, 255) !important ;
  
  border: 1px dotted #d8dbe0 !important;
  
}
.list-group-item {
  border-color: rgba(255, 255, 255) !important ;
  border-bottom: 1px solid #d8dbe0 !important;
  padding-top: 0.25em !important;
  padding-bottom: 0.25em !important;
  min-height: 3.5em !important;
}
.list-group-active-item {
  border: 0 !important;
  padding-top: 1.25em !important;
  padding-bottom: 1.25em !important;
  min-height: 3.5em !important;
}
.padding-description {
  padding-bottom: 1.6em !important;
}
h1 {
  font-size: 38px;
}

h1,
h2,
h3 {
  font-weight: 600;
  line-height: 1;
  letter-spacing: -0.02em;
}

h1 {
  margin: 0;
  font-size: 2em;
  margin: 0.67em 0;
  display: block;
  font-size: 2em;
  margin-block-start: 0.67em;
  margin-block-end: 0.67em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  font-weight: bold;
}

h2 {
  font-size: 24px;
  color: #213547;
  margin: 36px 0;
  transition: color 0.5s;
  padding-top: 36px;
  border-top: 1px solid rgba(60, 60, 60, 0.12);
}

a {
  display: block;
  position: relative;
}
</style>

