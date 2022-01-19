<template>
  <div class="checkbox-group">
    <span
        class="heading"
        v-bind:class="{
        small: labelSize === 'small',
        normal: labelSize === 'normal',
      }"
    >{{ label }}</span
    >
    <slot></slot>
  </div>
</template>
<script>
export default {
  name: "CheckboxGroup",
  props: {
    label: String,
    labelSize: String,
  },
};
</script>
<style scoped>

.heading {
  line-height: 1.2em;
}

.normal {
  font-size: 2em;
  display: inline-block;
}

.small {
  font-size: 1em;
}
</style>
