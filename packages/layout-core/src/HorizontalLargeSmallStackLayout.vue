<template>
  <div class="horizontal-large-small-stack-layout">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "HorizontalLargeSmallStackLayout"
};
</script>

<style scoped>

.horizontal-large-small-stack-layout {
  display: flex;
  flex-direction: row;
  align-items: flex-start;
  text-align: left;
  justify-content: center;
  margin-top: 4em;
}

.horizontal-large-small-stack-layout > div {
  width: 44em;
}

.horizontal-large-small-stack-layout > div:last-child {
  width: 15em;
  margin: 1em;
}

</style>