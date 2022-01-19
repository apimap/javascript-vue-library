<template>
  <div class="the-side-bar" :style="style">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "TheSideBar",
  props: {
    width: Number
  },
  computed: {
    style () {
      return 'width:' + this.width  + 'em';
    }
  }
};
</script>

<style scoped>

.the-side-bar {
  margin: auto;
  line-height: 1.2em;
  border-right-style: solid;
  border-right-width: 1px;
  flex-shrink: 0;
  position: fixed;
  top: 0;
  left: 0;
  height: 100vh;
  z-index: 1;
  overflow: scroll;
  padding-top: 2em;
}

</style>