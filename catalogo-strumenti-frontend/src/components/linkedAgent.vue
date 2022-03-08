<template>
  <div>
    <input type="checkbox" id="todo-item" />
    <label for="todo-item">My Todo Item</label>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
export default {
  name: "Sidebar",
  // mixins: [progressMixin],
  data() {
    return {
      value: null,
      // define options
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
  methods: {},
  computed: {
    ...mapGetters("agent", ["agentList"]),

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
    }
  },
  created() {
    this.$store.dispatch("agent/findAll");
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
</style>
