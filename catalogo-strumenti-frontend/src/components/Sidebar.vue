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
                v-if="gsbpmList"
                id="customtree-gray"
                :initial-model="getGsbpmList"
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
          id: gsbpm.id,
          label: gsbpm.name,
          children: function() {
            return gsbpm.gsbpmSubProcesses.map(gsbpmSubProcess => {
              return {
                id: "id-" + gsbpmSubProcess.id,
                label: gsbpmSubProcess.name,
                treeNodeSpec: {
                  input: {
                    type: "checkbox"
                  },

                  state: {
                    expanded: true
                  }

                  //value: "aValueToSubmit",
                }
              };
            });
          },

          treeNodeSpec: {
            input: {
              type: "checkbox"
            },

            state: {
              expanded: true
            }

            //value: "aValueToSubmit",
          }
        };
      });
    }
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
