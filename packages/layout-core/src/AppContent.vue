<template>
  <div class="app-content" :style="style">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "AppContent",
  props: {
    offset: Number,
  },
  computed: {
    style () {
      return 'left:' + this.offset  + 'em';
    }
  }
};
</script>

<style scoped>
.app-content{
  position: fixed;
  top: 0;
  overflow: visible;
  height: 100%;
}
</style>