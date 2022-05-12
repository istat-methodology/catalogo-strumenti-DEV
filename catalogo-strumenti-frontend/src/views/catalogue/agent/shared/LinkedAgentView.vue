<template>
  <div>
    <h2>Referenti associati</h2>
    <div class="columns">
      <div class="row">
        <div v-if="linkedAgents.length === 0">
                <span><i><h5>Nessun referente associato></h5></i></span>
        </div>  
        <div
          class="card col-md-3"
          v-for="linkedAgent of linkedAgents"
          :key="linkedAgent.id"
        >
          <div class="card-header">
            <strong>{{ linkedAgent.agentName }}</strong>
            <div class="card-header-actions">
              <router-link
                tag="a"
                :to="{
                  name: 'AgentDetails',
                  params: { id: linkedAgent.agentId },
                }"
              >
                <view-icon />
              </router-link>
            </div>
          </div>
          <div class="card-body">
            <div class="card-slot">
              <span><strong>Contatto: </strong></span>
              <span>{{ linkedAgent.agentContact }}</span>
            </div>
            <div class="card-slot">
              <span><strong>Ruolo: </strong></span>
              <span>{{ linkedAgent.agentRole }}</span>
            </div>
            <div class="card-slot">
              <span><strong>Organizzazione: </strong></span>
              <span>{{ linkedAgent.agentOrganization }}</span>
            </div>
            <div class="card-slot">
              <span><strong>Data: </strong></span>
              <span>{{ linkedAgent.referenceDate }}</span>
            </div>

            <div class="card-slot">
              <span><strong>Note: </strong></span>
              <span >{{ linkedAgent.notes }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "LinkedAgentView",
  props: {
    linkedAgents: {
      type: Array,
      required: true,
      default: () => [],
    },
  },
};
</script>


<style scoped>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 50%;
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