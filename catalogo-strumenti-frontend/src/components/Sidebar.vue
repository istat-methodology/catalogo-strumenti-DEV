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
      <!--  <li class="c-sidebar-nav-title" v-if="isToolList">
        Classificazione GSBPM
      </li>
      <li class="c-sidebar-nav-item" v-if="isToolList">
        <div id="app-inputs" class="demo-tree">
          <tree
            v-if="gsbpmList"
            id="customtree-gray"
            :initial-model="getGsbpmList"
            :model-defaults="modelDefaults"
            v-on:treeViewNodeCheckboxChange="checkboxChange($event)"
            ref="treeGsbpm"
          ></tree>
        </div>
      </li> -->
      <li class="c-sidebar-nav-title" v-if="isToolList">
        Classificazione GSBPM
      </li>
      <li class="c-sidebar-nav-item" v-if="isToolList">
        <div id="app-inputs" class="demo-tree">
          <treeselect
            v-model="value"
            :multiple="true"
            :options="getGsbpmList"
            :disable-branch-nodes="true"
            :show-count="true"
            @select="onNodeCheckedGsbpm"
            @deselect="onNodeUncheckedGsbpm"
          />
        </div>
      </li>
      <li class="c-sidebar-nav-title" v-if="isToolList">Tipo Strumento</li>
      <li class="c-sidebar-nav-item" v-if="isToolList">
        <div id="app-tree" class="demo-tree">
          <tree
            :data="getTooltypeList"
            :options="treeOptions"
            @node:checked="onNodeCheckedType"
            @node:unchecked="onNodeUncheckedType"
            class="tree--small"
          ></tree>
        </div>
      </li>
    </ul>
  </CSidebar>
</template>
<script>
import { mapGetters } from "vuex";
//import TreeView from "@grapoza/vue-tree";
import LiquorTree from "liquor-tree";
import Treeselect from "@riophae/vue-treeselect";
// import the styles
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
//import progressMixin from "@/components/mixins/progress.mixin";

export default {
  name: "Sidebar",
  // mixins: [progressMixin],
  components: {
    tree: LiquorTree,
    Treeselect
  },
  data() {
    return {
      value: null,
      // define options

      model: [
        {
          id: "inputs-checkbox-1",
          text: "Statistical Service",
          children: [
            { text: "Selecting DOM Elements" },
            {
              text: "Using jQuery to Work with the DOM Tree",
              children: [
                { text: "Loading jQuery on Your HTML Page" },
                { text: "Replacing the Heading Text Using jQuery" }
              ]
            }
          ],
          state: {
            selected: false,
            selectable: true,
            checked: false,
            expanded: false,
            disabled: false,
            visible: true,
            indeterminate: false,
            matched: false,
            editable: true,
            dragging: false,
            draggable: true,
            dropable: true
          }
        },
        {
          id: "inputs-radio-2",
          text: "Desktop Application",
          state: {
            selected: false,
            selectable: true,
            checked: false,
            expanded: false,
            disabled: false,
            visible: true,
            indeterminate: false,
            matched: false,
            editable: true,
            dragging: false,
            draggable: true,
            dropable: true
          }
        },
        {
          id: "inputs-checkbox-2",
          text: "Procedure",
          state: {
            selected: false,
            selectable: true,
            checked: false,
            expanded: false,
            disabled: false,
            visible: true,
            indeterminate: false,
            matched: false,
            editable: true,
            dragging: false,
            draggable: true,
            dropable: true
          }
        },
        {
          id: "inputs-checkbox-3",
          text: "Metodi Statistici",
          state: {
            selected: false,
            selectable: true,
            checked: false,
            expanded: false,
            disabled: false,
            visible: true,
            indeterminate: false,
            matched: false,
            editable: true,
            dragging: false,
            draggable: true,
            dropable: true
          }
        }
      ],
      treeOptions: {
        checkbox: true,
        propertyNames: {
          text: "text",
          children: "children"
        }
      },
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
      checkedNodesGsbpm: [],
      checkedNodesType: [],
      prova: [],
      payload: [
        {
          gsbpm: null,
          type: null
        }
      ]
    };
  },
  methods: {
    refreshCheckedList() {
      let gsbpmNodes = this.$refs.treeGsbpm.getCheckedCheckboxes();
      let typeNodes = this.$refs.treeType.getCheckedCheckboxes();
      this.checkedNodes = [...gsbpmNodes, ...typeNodes];
    },
    // checkboxChange(event) {
    //   let gsbpmNodes = this.$refs.treeGsbpm.getCheckedCheckboxes();
    //   let typeNodes = this.$refs.treeType.getCheckedCheckboxes();
    //   this.checkedNodes = [...gsbpmNodes, ...typeNodes];
    //   let pippo = event;
    //   console.log(pippo);
    // },
    /*  onNodeSelected(node) {
      console.log(node.text);
    }, */
    onNodeCheckedGsbpm(node) {
      this.checkedNodesGsbpm.push(node.id);
      console.log(node.text);
      this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
      this.$store
        .dispatch("filter/setParams", this.payload)
        .then(this.$store.dispatch("tools/filter", this.params));
    },
    onNodeCheckedType(node) {
      this.checkedNodesType.push(node.id);
      console.log(node.text);
      this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
      this.$store
        .dispatch("filter/setParams", this.payload)
        .then(this.$store.dispatch("tools/filter", this.params));
    },
    onNodeUncheckedGsbpm(node) {
      if (this.checkedNodesGsbpm.indexOf(node.id) >= 0) {
        this.checkedNodesGsbpm.splice(
          this.checkedNodesGsbpm.indexOf(node.id),
          1
        );
        console.log(node.text + "- unchecked");
        this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
        this.$store
          .dispatch("filter/setParams", this.payload)
          .then(this.$store.dispatch("tools/filter", this.params));
      } else {
        this.$store.dispatch("tools/filter", this.params);
      }
    },
    onNodeUncheckedType(node) {
      if (this.checkedNodesType.indexOf(node.id) >= 0) {
        this.checkedNodesType.splice(this.checkedNodesType.indexOf(node.id), 1);
        console.log(node.text + "- unchecked");
        this.filter(this.checkedNodesGsbpm, this.checkedNodesType);
        this.$store
          .dispatch("filter/setParams", this.payload)
          .then(this.$store.dispatch("tools/filter", this.params));
      } else {
        this.$store.dispatch("tools/filter", this.params);
      }
    },
    filter(gsbpm, type) {
      this.payload.gsbpm = gsbpm;
      this.payload.type = type;
      //this.$store.dispatch("tools/filter", this.payload);
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
    ...mapGetters("tooltype", ["tooltypeList"]),
    ...mapGetters("filter", ["params"]),
    ...mapGetters("coreui", ["isToolList"]),
    ...mapGetters("coreui", {
      show: "sidebarShow",
      minimize: "sidebarMinimize",
      isHome: "isHome"
    }),

    getGsbpmList: function() {
      return this.gsbpmList.map(gsbpm => {
        return {
          // ...gsbpm,
          id: "id-" + gsbpm.id,
          label: gsbpm.name,
          children: gsbpm.gsbpmSubProcesses.map(gsbpmSubProcess => {
            return {
              id: gsbpmSubProcess.id,
              label: gsbpmSubProcess.name
            };
          }),

          state: {
            selected: false,
            selectable: false,
            checked: false,
            expanded: false,
            disabled: false,
            visible: true,
            indeterminate: false,
            matched: false,
            editable: true,
            dragging: false,
            draggable: true,
            dropable: true
          }
        };
      });
    },
    /* getTooltypeList: function() {
      return this.tooltypeList.map(tool => {
        return {
          // ...gsbpm,
          id: tool.id,
          label: tool.name,
          treeNodeSpec: {
            input: {
              type: "checkbox"
            }
          }
        };
      });
    } */
    getTooltypeList: function() {
      return this.tooltypeList.map(tool => {
        return {
          // ...gsbpm,
          id: tool.id,
          text: tool.name,
          state: {
            selected: false,
            selectable: false,
            checked: false,
            expanded: false,
            disabled: false,
            visible: true,
            indeterminate: false,
            matched: false,
            editable: true,
            dragging: false,
            draggable: true,
            dropable: true
          }
        };
      });
    }
  },
  created() {
    this.$store.dispatch("gsbpm/findAll");
    this.$store.dispatch("tooltype/findAll");
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

.app-tree.div.ul.li.tree-node.has-child.selected.draggable.indeterminate.div.span.span {
  color: #edeef1;
}

/* .grtvn-self-expander {
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
} */
</style>
