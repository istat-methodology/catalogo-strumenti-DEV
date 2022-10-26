<template>
  <div>
    <CCardHeader class="no-border p-0 mt-4">
      <h1 class="uppercase text-right p-0 text-info">
        <span>
          <span class="p-0">{{ maintitle }}</span>
          <h4
            class="bg-secondary p-0 text-right uppercase "
          >
            <span class="mt-4 pr-1 uppercase text-info">
              {{ functionality }}
            </span>
          </h4>
        </span>
      </h1>
      <h2 class="text-info">
        {{ title }}
        <div class="card-header-actions pr-2">
          <div
            class="btn-group"
            role="group"
            aria-label="Basic"
            v-for="item in buttons"
            :key="item"
          >
            <button
              v-if="item == 'nuovo' && authenticated == true"
              class="btn btn-outline-info pl-2"
              @click.prevent="handleNew"
              :title="getTitle(item, buttonTitle)"
            >
              <add-icon :title="getTitle(item, buttonTitle)" />
            </button>

            <button
              v-if="item == 'salva'"
              class="btn btn-outline-info pl-2"
              @click.prevent="handleSubmit"
              :title="getTitle(item, buttonTitle)"
            >
              <floppy-icon :title="getTitle(item, buttonTitle)" />
            </button>
            <button
              v-if="item == 'modifica'"
              class="btn btn-outline-info pl-2"
              @click.prevent="handleEdit"
              :title="getTitle(item, buttonTitle)"
            >
              <edit-icon :title="getTitle(item, buttonTitle)" />
            </button>
            <button
              v-if="item == 'indietro'"
              class="btn btn-outline-info pl-2"
              :title="item"
              @click.prevent="$router.back()"
            >
              <close-icon :title="item" />
            </button>
          </div>
        </div>
      </h2>
    </CCardHeader>
  </div>
</template>

<script>
export default {
  name: "CTitle",
  props: {
    functionality: {
      Type: String,
      default: () => "",
    },
    maintitle: {
      Type: String,
      default: () => "",
    },

    title: {
      Type: String,
      default: () => "",
    },
    subtitle: {
      Type: String,
      default: () => "",
    },
    buttonTitle: {
      Type: String,
      default: () => "",
    },
    buttons: {
      Type: Array,
      default: () => [],
    },
    authenticated: {
      Type: Boolean,
      default: () => false,
    },
  },
  methods: {
    getTitle(functionType, buttonTitle) {
      return functionType + " " + buttonTitle;
    },
    handleSubmit() {
      this.$emit("handleSubmit");
    },
    handleEdit() {
      this.$emit("handleEdit");
    },
    handleNew() {
      this.$emit("handleNew");
    },
  },
};
</script>
<style scoped>
.text-color-title {
  color: #0a83e6 !important;
  transition: color 0.5s !important;
}
</style>
