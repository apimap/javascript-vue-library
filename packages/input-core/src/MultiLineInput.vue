<template>
  <div class="multiline-input">
    <h3 v-show="label">{{ label }}</h3>
    <textarea
        :class="{
        small: size === 'small',
        normal: !size || size === 'normal',
        large: size === 'large',
      }"
        class="input"
        :placeholder="placeholder"
        v-model="localValue"
        rows="10"
        maxlength="700"
    />
    <div v-if="description" class="description">{{ description }}</div>
  </div>
</template>
<script>
export default {
  name: "MultiLineInput",
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

.multiline-input {
  display: flex;
  flex-direction: column;
  text-align: left;
}

.multiline-input > textarea {
  border: 2px solid;
  font-size: 1.2em;
  outline: none;
  padding: 1em;
  background-color: transparent;
}

</style>
