<template>
  <div class="radio-group">
    <h3>{{ label }}</h3>
    <Radio
      v-for="option in options"
      :key="option.value"
      :label="option.label"
      :option="option.value"
      :description="option.description"
      :name="name"
      v-model="localSelectedValue"
    />
    <label v-show="allowCustom" class="radio-container">
      None of the above
      <input
        type="radio"
        class="radio"
        id="none"
        :name="name"
        @change="setChecked"
        value="none"
      />
      <span class="radio-button"></span>
    </label>
    <Input
      v-show="showCustomInput"
      class="optional-input"
      size="normal"
      v-model="localSelectedValue"
      :placeholder="customPlaceholder"
    />
  </div>
</template>
<script>
import Radio from "@/Radio";
import Input from "@/Input";

export default {
  name: "RadioGroup",
  props: {
    label: String,
    name: String,
    allowCustom: Boolean,
    options: Array,
    value: String,
    customPlaceholder: String,
  },
  components: { Radio, Input },
  data: function () {
    return { showCustomInput: false };
  },
  methods: {
    setChecked: function (el) {
      if (el.target.value === "none") {
        this.showCustomInput = true;
      }
    },
  },
  model: {
    prop: "value",
    event: "input",
  },
  computed: {
    localSelectedValue: {
      get: function() {
        return this.value;
      },
      set: function(newValue) {
        if (this.options.filter((opt) => opt.name === newValue).length > 0 ) {
          this.showCustomInput = false;
        }
        this.$emit(`input`, newValue);
      },
    },
  },
};
</script>
<style scoped>

.radio-group {
  text-align: left;
  margin-bottom: 2em;
  margin-top: 2em;
}

.radio-container {
  display: block;
  position: relative;
  padding-left: 2em;
  margin-top: 1.4em;
  cursor: pointer;
  font-size: 1.4em;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.radio-container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

.radio-container > .radio-button {
  position: absolute;
  margin-top: 3px;
  top: 0;
  left: 0;
  height: 20px;
  width: 20px;
  border: 2px solid;
  border-radius: 50%;
}

.radio-button:after {
  content: "";
  position: absolute;
  display: none;
}

.radio-container input:checked ~ .radio-button:after {
  display: block;
}

.radio-container .radio-button:after {
  top: 5px;
  left: 5px;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: #19aaf8;
}

.optional-input {
  margin-top: 20px;
}
</style>
