<template>
  <div>
    <div class="row p-0">
      <div class="col-md-12 p-0 pl-0 pt-3">
        <h4 class="uppercase text-left">
          <ul
            v-for="(subitem, index) of origins"
            v-bind:key="index"
            class="list-group"
          >
            <li
              class="list-group-item list-group-item-action p-0 p-1 no-border cursor-pointer  text-info"
            >
              {{ subitem }}
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
  padding: 0;
  margin: 0;
  list-style-type: none;
  position: relative;
}
li {
  list-style-type: none;
  border-left: 2px solid #000;
  margin-left: 1em;
}
li div {
  padding-left: 1em;
  position: relative;
}
li div::before {
  content:'';
  position: absolute;
  top: 0;
  left: -2px;
  bottom: 50%;
  width: 0.75em;
  border: 2px solid #000;
  border-top: 0 none transparent;
  border-right: 0 none transparent;
}
ul > li:last-child {
  border-left: 2px solid transparent;
}

</style>
