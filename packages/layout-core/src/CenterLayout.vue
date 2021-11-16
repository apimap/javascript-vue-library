<template>
  <div class="center-layout">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "CenterLayout"
};
</script>

<style scoped>

.center-layout {
  margin: auto;
  line-height: 1.2em;
  width: 60em;
  padding-top: 6em;
}

</style>