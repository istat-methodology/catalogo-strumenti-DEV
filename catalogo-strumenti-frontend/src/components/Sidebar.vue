<template>
  <CSidebar
    fixed
    :minimize="minimize"
    :show="show"
    @update:show="
      value => $store.commit('coreui/set', ['sidebarShow', 'responsive'])
    "
  >
    <CSidebarBrand class="d-md-down-none" to="/">
      <CIcon name="cil-at" size="lg"></CIcon>
      <span class="brand">Catalogo-Strumenti Metodologici</span>
    </CSidebarBrand>
    <div class="row">
      <div class="col-12">
        <CCard>
          <CCardHeader>
            Classificazione GSBPM
          </CCardHeader>
          <CCardBody>
            <div id="app-inputs" class="demo-tree" v-if="!isHome">
              <tree
                id="customtree-gray"
                :initial-model="model"
                :model-defaults="modelDefaults"
                ref="treeInputs"
                v-on:treeViewNodeCheckboxChange="refreshCheckedList"
              ></tree>
              <section id="checked-stuff-inputs">
                <button
                  type="button"
                  class="tree-processor-trigger"
                  v-on:click="refreshCheckedList"
                >
                  What's been checked?
                </button>
                <ul id="checked-list-inputs">
                  <li v-for="checkedNode in checkedNodes" :key="checkedNode.id">
                    {{ checkedNode.label }}
                  </li>
                </ul>
              </section>
            </div>
          </CCardBody>
        </CCard>
      </div>
    </div>

    <!-- <ul class="c-sidebar-nav h-100 ps" style="position: relative;">
      <li class="c-sidebar-nav-item">
        <router-link
          :to="{ name: 'Home' }"
          class="c-sidebar-nav-link"
          :class="{ 'c-active': isHome }"
          custom
          v-slot="{ href, navigate }"
        >
          <a :href="href" @click="navigate">
            <CIcon name="cil-home" class="c-sidebar-nav-icon" />Strumenti
            <span class="badge badge-primary">Beta</span>
          </a>
        </router-link>
      </li>
      <template v-if="isSupervisor">
        <li class="c-sidebar-nav-title">
          Tipologia degli strumenti:
        </li>
        <li class="c-sidebar-nav-item">
          <router-link
            :to="{ name: 'DeskAppList' }"
            class="c-sidebar-nav-link"
            :class="{ 'c-active': isDeskAppList }"
            custom
            v-slot="{ href, navigate }"
          >
            <a :href="href" @click="navigate">
              <CIcon
                name="cil-terminal"
                class="c-sidebar-nav-icon"
              />Applicazioni Desktop
            </a>
          </router-link>
        </li>
        <li class="c-sidebar-nav-item">
          <router-link
            :to="{ name: 'SoftProcList' }"
            class="c-sidebar-nav-link"
            :class="{ 'c-active': isSoftProcList }"
            custom
            v-slot="{ href, navigate }"
          >
            <a :href="href" @click="navigate">
              <CIcon name="cil-layers" class="c-sidebar-nav-icon" />Procedure
              Software
            </a>
          </router-link>
        </li>
        <li class="c-sidebar-nav-item">
          <router-link
            :to="{ name: 'StatServiceList' }"
            class="c-sidebar-nav-link"
            :class="{ 'c-active': isStatServiceList }"
            custom
            v-slot="{ href, navigate }"
          >
            <a :href="href" @click="navigate">
              <CIcon name="cil-chart" class="c-sidebar-nav-icon" />Servizi
              Statistici
            </a>
          </router-link>
        </li>
        <li class="c-sidebar-nav-item">
          <router-link
            :to="{ name: 'StatMethodList' }"
            class="c-sidebar-nav-link"
            :class="{ 'c-active': isStatMethodList, params: { state: 4 } }"
            custom
            v-slot="{ href, navigate }"
          >
            <a :href="href" @click="navigate">
              <CIcon name="cil-chart" class="c-sidebar-nav-icon" />Metodi
              Statistici
            </a>
          </router-link>
        </li>
      </template>
    </ul> -->
  </CSidebar>
</template>
<script>
import { mapGetters } from "vuex";
import TreeView from "@grapoza/vue-tree";
//import progressMixin from "@/components/mixins/progress.mixin";

export default {
  name: "Sidebar",
  // mixins: [progressMixin],
  components: {
    tree: TreeView
  },
  data() {
    return {
      model: [
        {
          id: "inputs-checkbox-1",
          label: "My First Node",
          treeNodeSpec: {
            input: {
              type: "checkbox",
              name: "radio1",
              value: "aValueToSubmit",
              isInitialRadioGroupValue: true
            }
          }
        },
        {
          id: "inputs-radio-2",
          label: "My Second Node",
          children: [
            {
              id: "inputs-radio-2-sub-1",
              label: "This is a subnode",
              treeNodeSpec: {
                input: {
                  type: "checkbox",
                  name: "radio2"
                }
              }
            },
            {
              id: "inputs-radio-2-sub-2",
              label: "This is another subnode",
              treeNodeSpec: {
                input: {
                  type: "checkbox",
                  name: "radio2"
                }
              }
            }
          ],
          treeNodeSpec: {
            input: {
              type: "checkbox",
              name: "radio1"
            },
            state: {
              expanded: true
            }
          }
        },
        {
          id: "inputs-checkbox-2",
          label: "My third Node",
          treeNodeSpec: {
            input: {
              type: "checkbox"
            },
            state: {
              input: {
                value: true
              }
            }
          }
        }
      ],
      modelDefaults: {
        /* addChildTitle: "Add a new child node",
        deleteTitle: "Delete this node", */
        expanderTitle: "Expand this node",
        customizations: {
          classes: {
            treeViewNodeSelfExpander: "action-button",
            treeViewNodeSelfExpandedIndicator: "fas fa-chevron-right"
            //treeViewNodeSelfAction: "action-button"
            /* treeViewNodeSelfAddChildIcon: "fas fa-plus-circle",
            treeViewNodeSelfDeleteIcon: "fas fa-minus-circle" */
          }
        }
      },
      checkedNodes: []
    };
  },
  methods: {
    refreshCheckedList() {
      let rbNodes = this.$refs.treeInputs.getCheckedRadioButtons();
      let cbNodes = this.$refs.treeInputs.getCheckedCheckboxes();
      this.checkedNodes = [...rbNodes, ...cbNodes];
    }
  },
  computed: {
    ...mapGetters("auth", ["isReviewer", "isSupervisor"]),
    /* ...mapGetters("address", ["assignedId", "assignedName"]), */
    ...mapGetters("coreui", {
      show: "sidebarShow",
      minimize: "sidebarMinimize",
      isHome: "isHome",
      isDeskAppList: "isDeskAppList",
      isSoftProcList: "isSoftProcList",
      isStatServiceList: "isStatServiceList",
      isStatMethodList: "isStatMethodList"
    })
  }
};
</script>

<style scoped>
.card-header {
  background-color: #3c4b64;
}
div.card-body {
  background-color: #3c4b64;
}
.grtvn-self-expander {
  color: #ffffff;
}
.brand {
  font-size: 1.2em;
  padding-left: 1rem;
}
.c-active-primary {
  border-left: 3px solid#321fdb;
}
.c-active-success {
  border-left: 3px solid#2eb85c;
}
.c-active-warning {
  border-left: 3px solid#f9b115;
}
</style>
