<template>
  <div class="input">
    <h3 v-show="label">{{ label }}</h3>
    <input
      :class="{
        small: size === 'small',
        normal: !size || size === 'normal',
        large: size === 'large',
      }"
      class="input"
      :placeholder="placeholder"
      type="text"
      v-model="localValue"
    />
    <div v-if="description" class="description">{{ description }}</div>
  </div>
</template>

<script>
/* eslint-disable */

export default {
  name: "Input",
  props: { label: String, size: String, placeholder: String, description: String, value: String },
  computed: {
    localValue: {
      get() {
        return this.value;
      },
      set() {
        this.$emit(`input`, event.target.value);
      },
    },
  },
};
</script>

<style scoped>
.description{
  padding: 1em;
  border-radius: 0.2em;
  margin-top: 0.1em;
  border: 1px solid #dbd8e3;
  color: #5c5470;
}

.input {
  display: flex;
  flex-direction: column;
  text-align: left;
}

.heading {
  font-size: 2em;
  font-weight: 500;
  padding-bottom: 0.2em;
}

.input > input {
  border: 2px solid;
  font-size: 1em;
  outline: none;
  padding: 1em;
  background-color: transparent;
}

input.normal {
  width: 60%;
}

input.small {
  width: 30%;
}
</style>
