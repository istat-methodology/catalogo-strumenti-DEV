<template>
  <div>
    <div class="ml-0 pl-0 pt-5 pb-0">
      <div class=" ml-0 col-md-12">
        <h4 class="text-left">
          <ul
            v-for="(subitem, index) of origins"
            v-bind:key="index"
            class="list-group"
          >

            <li class="list-group-item no-border cursor-pointer text-info p-0 pb-1">
              <div v-if="index == 0" >{{ subitem }}</div>
              <ul>
                <li
                  class="list-group-item no-border cursor-pointer text-info p-0 pb-1"
                >
                  <div v-if="index == 1">{{ subitem }}</div>
                  <ul>
                    <li
                      class="list-group-item no-border cursor-pointer text-info p-0"
                    >
                      <div v-if="index == 2">{{ subitem }}</div>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>


          </ul>
        </h4>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "COrigin",
  props: {
    origins: {
      Type: Array,
      required: false,
      default: () => [],
    },
  },
};
</script>
<style scoped>
.text-color-title {
  color: #0a83e6 !important;
  transition: color 0.5s !important;
}

ul {
  padding: 0 !important;
  margin: 0 !important;
  list-style-type: none !important;
  position: relative !important;
}
li {
  list-style-type: none !important;
  border-left: 2px solid #0a83e6 !important;
  margin-left: 1em !important;
}
li div {
  padding-left: 1em !important;
  position: relative !important;
}
li div::before {
  content:'' !important;
  position: absolute !important;
  top: 0 !important;
  left: -2px !important;
  bottom: 50% !important;
  width: 0.75em !important;
  border: 2px solid  #0a83e6 !important;
  border-top: 0 none transparent !important;
  border-right: 0 none transparent !important;
}
ul > li:last-child {
  border-left: 2px solid transparent !important;
}
</style>
