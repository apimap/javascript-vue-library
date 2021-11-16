<template>
  <div
    class="vertical-separator"
    v-bind:class="{
      small: size === 'small',
      normal: !size || size === 'normal',
      large: size === 'large',
    }"
  ></div>
</template>
<script>
export default {
  name: "VerticalSeparator",
  props: { size: String },
};
</script>
<style scoped>
.separator {
  width: 100%;
  height: 100px;
}

.small {
  height: 50px;
}

.normal {
  height: 100px;
}

.large {
  height: 150px;
}
</style>