<template>
  <option :value="value">{{ label }}</option>
</template>

<script>
/* eslint-disable */

export default {
  name: "Option",
  props: {
    label: String,
    value: String
  }
};
</script>