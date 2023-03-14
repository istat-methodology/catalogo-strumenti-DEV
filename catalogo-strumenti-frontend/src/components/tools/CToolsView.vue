<template>
  <div>
    <h2>
      <span>{{ index }}</span> Strumenti metodologici
    </h2>
    <div class="description-fields col-12">
      {{ descriptionLabel }}
    </div>
    <div class="columns">
      <div class="row">
        <div v-if="tools.length === 0">
          <span
            ><i><h5>Nessun strumento metodologico utilizzato</h5></i></span
          >
        </div>
        <div class="card col-md-3" v-for="tool of tools" :key="tool.id">
          <div class="card-header">
            {{ tool.name }}
            <div class="card-header-actions">
              <router-link
                tag="a"
                :to="{
                  name: 'ToolDetails',
                  params: { id: tool.id }
                }">
                <view-icon />
              </router-link>
            </div>
          </div>
          <div class="card-body">
            <p class="card-text">{{ tool.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "CToolsView",
  props: {
    tools: {
      type: Array,
      required: true,
      default: () => []
    },
    index: {
      type: String,
      required: false,
      default: () => ""
    },
    descriptionLabel: {
      type: String,
      required: false,
      default: () => ""
    }
  }
}
</script>
<style scoped>
h5 {
  margin-bottom: 0.1rem;
}
.card-border {
  border: 1px solid #d8dbe0 !important;
  box-shadow: none !important;
}
.bg-lighter {
  background-color: #f8f8f8 !important;
}
.material-design-icon {
  margin-bottom: 0.2rem;
}

* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding in columns */
.row {
  margin: 0 -5px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* this adds the "card" effect */
  padding: 12px;
  text-align: left;
  background-color: #f1f1f1;
  margin-left: 5px;
}

/* Responsive columns - one column layout (vertical) on small screens */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}
</style>
