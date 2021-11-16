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
  flex-wrap: wrap;
  flex-direction: row;
  align-items: flex-start;
  justify-content: center;
  padding-bottom: 1em;
}
</style>
