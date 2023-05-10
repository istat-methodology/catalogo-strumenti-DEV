<template>
  <div>
    <td title="Visualizza">
      <span class="icon-link" @click="handleView" title="Visualizza"
        ><view-icon title="Visualizza" class="text-info" />
      </span>
    </td>
    <td v-if="authenticated" title="Modifica">
      <span class="icon-link" @click="handleEdit" title="Modifica"
        ><edit-icon title="Modifica" class="text-info" />
      </span>
    </td>
    <td v-if="authenticated && !isItem">
      <button class="icon-link" @click="handleDelete"
        ><delete-icon title="Elimina" class="text-info" />
    </button>
    </td>
    <td v-if="authenticated && showDetails && isItem">
      <span class="icon-link" @click="handleDetails">...</span>
    </td>
  </div>
</template>

<script>
export default {
  name: "CTableLink",
  props: {
    message: {
      Type: String,
      default: () => ""
    },
    authenticated: {
      Type: Boolean,
      default: () => false
    },
    showDetails: {
      Type: Boolean,
      default: () => false
    },
    isItem: {
      Type: Boolean,
      default: () => false
    }
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
    handleDetails() {
      this.$emit("handleDetails");
    }
  }
};
</script>
