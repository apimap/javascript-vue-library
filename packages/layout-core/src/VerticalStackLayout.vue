<template>
  <div class="vertical-stack-layout">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "VerticalStackLayout"
};
</script>

<style scoped>
.vertical-stack-layout {
  width: 100%;
  display: flex;
  flex-wrap: nowrap;
  flex-direction: row;
  justify-content: flex-start;
  padding-bottom: 1em;
  align-items: stretch;
}
</style>
