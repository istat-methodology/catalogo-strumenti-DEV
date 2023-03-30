<template>
  <div>
    <CModal title="Attenzione!" :show="showModal">
      <template #footer>
        <CButton shape="square" size="sm" color="light" @click="closeModal">
          Chiudi
        </CButton>
        <CButton shape="square" size="sm" color="info" @click="handleDelete">
          Elimina
        </CButton>
      </template>
      {{ message }}
    </CModal>
  </div>
</template>

<script>
export default {
  name: "CModalDelete",
  props: {
    message: {
      Type: String,
      default: () => ""
    },
    showModal: {
      Type: Boolean,
      default: () => false
    }
  },
  methods: {
    handleDelete() {
      this.$emit("handleDelete");
    },
    closeModal() {
      //this.modalShow = false;
      this.$emit("closeModal");
    }
  }
};
</script>
<style>
.close {
  display: none !important;
}
</style>
