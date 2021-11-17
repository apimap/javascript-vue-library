<template>
  <option :value="value">{{ label }}</option>
</template>

<script>
export default {
  name: "Option",
  props: {
    label: String,
    value: String
  }
};
</script>