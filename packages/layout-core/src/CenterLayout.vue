<template>
  <div class="center-layout" :style="style">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "CenterLayout",
  props: {
    width: Number,
    fullscreen: Boolean
  },
  computed: {
    style () {
      if(this.fullscreen) return 'width: 100%';
      return 'width:' + this.width  + 'em';
    }
  }
};
</script>

<style scoped>

.center-layout {
  margin: auto;
  margin-left: max(400px, 30%);
  line-height: 1.2em;
  align-items: stretch;
}

</style>