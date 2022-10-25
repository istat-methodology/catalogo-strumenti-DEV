<template>
  <div>
    <td title="Visualizza">
      <span
        class="icon-link"
        @click="handleView(item)"
        title="Visualizza"
        ><view-icon title="Visualizza" />
      </span>
    </td>
    <td v-if="authenticated" title="Modifica">
      <span
        class="icon-link"
        @click="handleEdit"
        title="Modifica"
        ><edit-icon title="Modifica" />
      </span>
    </td>
    <td v-if="authenticated">
      <span class="icon-link" @click="handleDelete"
        ><delete-icon title="Elimina" />
      </span>
    </td>
  </div>
</template>

<script>
export default {
  name: "CTableLink",
  props: {
    message: {
      Type: String,
      default: () => "",
    },
    authenticated: {
      Type: Boolean,
      default: () => false,
    },
  },
  methods: {
    handleView() {
      this.$emit("handleView");
    },
    handleEdit() {
      this.$emit("handleEdit");
    },
    handleDelete() {
      this.$emit("handleDelete");
    },
  },
};
</script>
