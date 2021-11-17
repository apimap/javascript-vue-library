<template>
  <div class="select">
    <h3>{{ label }}</h3>
    <select :name="name" v-model="localSelectedValue" :value="localSelectedValue">
      <option disabled value="">Please select one</option>
      <Option
        v-for="option in options"
        :key="option.name"
        :value="option.value"
        :label="option.label"
      />
      <option value="none" v-if="allowCustom">None of the above</option>
    </select>
    <Input
      v-show="showCustomInput"
      class="optional-input"
      size="normal"
      v-model="localSelectedValue"
      :placeholder="customPlaceholder"
    />
    <div v-if="description" class="description">{{ description }}</div>
  </div>
</template>

<script>

import Input from "@/Input";
import Option from "@/Option";

export default {
  name: "Select",
  components: { Input, Option },
  props: {
    name: String,
    description: String,
    label: String,
    allowCustom: Boolean,
    customPlaceholder: String,
    options: Array,
  },
  computed: {
    localSelectedValue: {
      get: function() {
        return this.value;
      },
      set: function(newValue) {
        if (newValue === "none") {
          this.showCustomInput = true;
        } else if (this.options.filter((opt) => opt.value === newValue).length === 0) {
          this.showCustomInput = true;
        } else {
          this.showCustomInput = false;
        }
        this.value = newValue;
        this.$emit(`input`, newValue);
      },
    },
  },
  data: function() {
    return {
      showCustomInput: false,
      value: ""
    };
  },
};
</script>

<style scoped>
.select > select {
  margin-top: 20px;
  display: block;
  padding: 15px;
  font-size: 1em;
  padding-right: 4em;
  width: 100%;
  background: transparent;
  border: 2px solid;
  outline: none;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  background: url("assets/dropdown-icon.svg") 96% / 15% no-repeat;
  background-size: 30px;
  background-position-x: calc(100%- 10px);
}

.description{
  width: 95%;
  display: inline-block;
  padding: 1em;
  border-radius: 0.2em;
  margin-top: 0.1em;
}

.select {
  text-align: left;
  margin-bottom: 4em;
}

.optional-input {
  margin-top: 20px;
}
</style>
