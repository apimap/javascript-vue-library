<template>
  <div class="horizontal-stack-layout">
    <slot></slot>
  </div>
</template>
<script>
export default {
  name: "HorizontalStackLayout"
};
</script>
<style scoped>

.horizontal-stack-layout {
  text-align: left;
}

.horizontal-stack-layout > div {
  width: 100%;
  margin: 1em;
}

</style>
