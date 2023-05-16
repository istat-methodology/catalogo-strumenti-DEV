<template>
  <div>
    <CCardHeader class="no-border p-0 mt-2">

      <!--h5 class="text-right uppercase p-0">
          <span class="uppercase text-info pr-1 p-0 mt-0 mb-0">

            <div
                  v-for="subitem of items"
                  :key="subitem.id"
                >
                  <li>
                    {{ subitem }}
                  </li>
                </div>
          </span>
      </h5-->
      <h1 class="uppercase text-right p-0 text-info" v-if="functionality != ''">


        <!--span-->
        <!--span class="p-0">{{ maintitle }}</span-->
        <h4 class="text-right uppercase p-0">
          <span class="uppercase text-info pr-1 p-0 mt-2 mb-0">
            {{ functionality }}
          </span>
        </h4>
        <!--/span-->
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
    maintitle: {
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
    items:{
      Type: Array,
      required: false,
      default: () => []
    },
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
