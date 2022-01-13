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
      <span class="brand">Catalogo Strumenti Metodologici</span>
    </CSidebarBrand>
    <ul class="c-sidebar-nav h-100 ps" style="position: relative">
      <li class="c-sidebar-nav-item">
        <router-link
          tag="a"
          :to="{ name: 'Home' }"
          class="c-sidebar-nav-link"
          :class="{ 'c-active': isHome }"
        >
          <CIcon name="cil-home" class="c-sidebar-nav-icon" />Home
          <span class="badge badge-primary">Alpha</span>
        </router-link>
      </li>
      <li class="c-sidebar-nav-title" v-if="isToolList">
        Classificazione GSBPM
      </li>
      <li class="c-sidebar-nav-item" v-if="isToolList">
        <div id="app-inputs" class="demo-tree">
          <tree
            v-if="gsbpmList"
            id="customtree-gray"
            :initial-model="getGsbpmList"
            :model-defaults="modelDefaults"
            ref="treeInputs"
            v-on:treeViewNodeCheckboxChange="refreshCheckedList"
          ></tree>
          <!-- <section id="checked-stuff-inputs">
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
              </section> -->
        </div>
      </li>
      <li class="c-sidebar-nav-title" v-if="isToolList">Tipo Strumento</li>
      <li class="c-sidebar-nav-item" v-if="isToolList">
        <div id="app-tree" class="demo-tree">
          <tree
            v-if="model"
            id="customtree-gray"
            :initial-model="model"
            :model-defaults="modelDefaults"
            ref="treeInputs"
            v-on:treeViewNodeCheckboxChange="refreshCheckedList"
          ></tree>
          <!-- <section id="checked-stuff-inputs">
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
              </section> -->
        </div>
      </li>
    </ul>
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
          label: "Statistical Service",
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
          label: "Desktop Application",
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
          label: "Procedure",
          treeNodeSpec: {
            input: {
              type: "checkbox"
            },
            state: {
              input: {
                value: false
              }
            }
          }
        },
        {
          id: "inputs-checkbox-3",
          label: "Metodi Statistici",
          treeNodeSpec: {
            input: {
              type: "checkbox"
            },
            state: {
              input: {
                value: false
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
      checkedNodes: [],
      prova: []
    };
  },
  methods: {
    refreshCheckedList() {
      let rbNodes = this.$refs.treeInputs.getCheckedRadioButtons();
      let cbNodes = this.$refs.treeInputs.getCheckedCheckboxes();
      this.checkedNodes = [...rbNodes, ...cbNodes];
    }
    /* getGsbpmList() {
      let rbNodes = this.$refs.treeInputs.getCheckedRadioButtons();
      let cbNodes = this.$refs.treeInputs.getCheckedCheckboxes();
      this.checkedNodes = [...rbNodes, ...cbNodes];
    } */
  },
  computed: {
    /* ...mapGetters("auth", ["isReviewer", "isSupervisor"]), */
    /* ...mapGetters("address", ["assignedId", "assignedName"]), */

    ...mapGetters("gsbpm", ["gsbpmList"]),
    ...mapGetters("coreui", ["isToolList"]),
    ...mapGetters("coreui", {
      show: "sidebarShow",
      minimize: "sidebarMinimize",
      isHome: "isHome"
      /* isDeskAppList: "isDeskAppList",
      isSoftProcList: "isSoftProcList",
      isStatServiceList: "isStatServiceList",
      isStatMethodList: "isStatMethodList" */
    }),
    getGsbpmList: function() {
      return this.gsbpmList.map(gsbpm => {
        return {
          // ...gsbpm,
          id: "id-" + gsbpm.id,
          label: gsbpm.name,
          children: gsbpm.gsbpmSubProcesses.map(gsbpmSubProcess => {
            return {
              id: "id-" + gsbpmSubProcess.id,
              label: gsbpmSubProcess.name,
              treeNodeSpec: {
                input: {
                  type: "checkbox"
                }

                //value: "aValueToSubmit",
              }
            };
          }),

          treeNodeSpec: {
            input: {
              type: "checkbox"
            },

            state: {
              expanded: false
            }

            //value: "aValueToSubmit",
          }
        };
      });
    }
  },
  created() {
    this.$store.dispatch("gsbpm/findAll");
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
