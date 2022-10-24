<template>
  <div>
    <CCardHeader class="no-border p-0 pt-4 mt-4">
      <h2>
        <h4 class="bg-secondary p-0 mb-4 text-right uppercase">
          <span class="mt-4 pr-1 text-primary"> {{ functionality }} </span>
        </h4>
        {{ title }}
        <div
          class="card-header-actions pr-2"
          v-for="item in buttons"
          :key="item"
        >
          <button
            v-if="item == 'nuovo' && actions == true"
            class="btn btn-outline-primary"
            @click.prevent="handleNew"
            :title="getTitle(item, buttonTitle)"
          >
            <add-icon :title="getTitle(item, buttonTitle)" />
          </button>

          <button
            v-if="item == 'salva'"
            class="btn btn-outline-primary"
            @click.prevent="handleSubmit"
            :title="getTitle(item, buttonTitle)"
          >
            <floppy-icon :title="getTitle(item, buttonTitle)" />
          </button>
          <button
            v-if="item == 'indietro'"
            class="btn btn-outline-primary"
            :title="item"
            @click.prevent="$router.back()"
          >
            <close-icon :title="item" />
          </button>
        </div>
      </h2>
    </CCardHeader>
  </div>
</template>

<script>
export default {
  name: "apptitle",
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
    actions: {
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
    handleNew() {
      this.$emit("handleNew");
    },

    /*
    getSubTitle(title) {
      return title
    },
    getFunction(title) {
      return title
    },    
    download(type) {
      switch (type) {

        case "json":
        case "csv":
        case "jpeg":
        case "png":
        case "pdf":
        default:
          break
      }
    }
    */
  },
};
</script>