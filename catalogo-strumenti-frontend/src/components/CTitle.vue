<template>
  <div>
    <div class="row p-0">
      <div class="col-md-12 p-0 pl-2 pr-2">
        <h3 class="text-right text-info">
          <span>
            <div
              v-for="(subitem, index) of origins"
              v-bind:key="index"
              class="row"
            >
              <li>
                {{ subitem }}
              </li>
            </div>
          </span>
        </h3>
      </div>
    </div>
    <CCardHeader class="no-border p-0">
      <h1 class="uppercase text-right p-0 text-info" v-if="functionality != ''">
        <h4 class="text-right uppercase p-0">
          <span class="uppercase text-info pr-1 p-0 mt-1 mb-0">
            {{ functionality }}
          </span>
        </h4>
        <hr class="bg-info mt-0" />
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
              v-if="item == 'aggiungi' && authenticated == true"
              class="btn btn-outline-info pl-2"
              @click.prevent="handleNew"
              :title="getTitle(item, buttonTitle)"
            >
              <add-icon :title="getTitle(item, buttonTitle)" />
            </button>

            <button
              v-if="item == 'salva' && authenticated == true"
              class="btn btn-outline-info pl-2"
              @click.prevent="handleSubmit"
              :title="getTitle(item, buttonTitle)"
            >
              <floppy-icon :title="getTitle(item, buttonTitle)" />
            </button>
            <button
              v-if="item == 'modifica' && authenticated == true"
              class="btn btn-outline-info pl-2"
              @click.prevent="handleEdit"
              :title="getTitle(item, buttonTitle)"
            >
              <edit-icon :title="getTitle(item, buttonTitle)" />
            </button>
            <button
              v-if="item == 'indietro'"
              class="btn btn-outline-primary pl-2"
              @click.prevent="handleBack"
              :title="item"
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
      default: () => ""
    },
    title: {
      Type: String,
      default: () => ""
    },
    subtitle: {
      Type: String,
      default: () => ""
    },
    buttonTitle: {
      Type: String,
      default: () => ""
    },
    buttons: {
      Type: Array,
      default: () => []
    },
    authenticated: {
      Type: Boolean,
      default: () => false
    },
    origins: {
      Type: Array,
      required: false,
      default: () => []
    }
  },
  methods: {
    getTitle(functionType, buttonTitle) {
      return functionType + " " + buttonTitle;
    },
    handleBack() {
      this.$emit("handleBack");
    },
    handleSubmit() {
      this.$emit("handleSubmit");
    },
    handleEdit() {
      this.$emit("handleEdit");
    },
    handleNew() {
      this.$emit("handleNew");
    }
  }
};
</script>
<style scoped>
.text-color-title {
  color: #0a83e6 !important;
  transition: color 0.5s !important;
}
</style>
