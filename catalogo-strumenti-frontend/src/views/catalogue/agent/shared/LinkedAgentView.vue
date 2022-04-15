<template>
  <div class="card w-100">
    <div class="card-header">
      <h5>Referenti</h5>
    </div>
    <div class="card-body">
      <div class="card-columns">
        <div
          class="card card-border bg-lighter mb-3"
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
                  params: { id: linkedAgent.agentId }
                }"
              >
                <view-icon />
              </router-link>
            </div>
          </div>
          <div class="card-body">
             <div class="mb-2">
              <span><strong>Ruolo</strong></span>
            </div>
            <div class="card-slot">
              <span>{{ linkedAgent.agentRole }}</span>
            </div>
                <div class="mb-2">
              <span><strong>Contatto</strong></span>
            </div>
            <div class="card-slot">
              <span>{{ linkedAgent.agentContact }}</span>
            </div>
                 <div class="mb-2">
              <span><strong>Data</strong></span>
            </div>
            <div class="card-slot">
              <span>{{ linkedAgent.referenceDate}}</span>
            </div>
                     <div class="mb-2">
              <span><strong>Note</strong></span>
            </div>
            <div class="card-slot">
              <span>{{ linkedAgent.notes}}</span>
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
      default: () => []
    }
  }
};
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
</style>