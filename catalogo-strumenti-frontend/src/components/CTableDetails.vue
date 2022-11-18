<template>
  <div v-if="items.length > 0">
    <div v-if="isShow()">
      <label class="m-2 "><i>{{ title }}</i></label>
      <ul class="list-group list-group-horizontal-sm border p-3">
        <li class="list-item mr-2" v-for="item in  items" :key="item.name">         
          {{ item.name }}        
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  name: "CTableDetails",

  props: {
    index: {
      Type: String,
      default: () => -1,
    },
    activeIndex: {
      Type: String,
      default: () => -1,
    },
    title: {
      Type: String,
      default: () => "",
    },
    items: {
      Type: Array,
      default: () => [],
    },    
  },
  methods: {
    isShow() {
      return this.activeIndex == this.index ? true: false;      
    },
  }
};

</script>
<style scoped>
.list-item {
    border: 1px solid #b4b4b4 !important;
    list-style: none !important;
    border-radius: 5px !important;
    padding: 10px !important;
    font-size: smaller;
  }
</style>
