<template>
  <label class="checkbox-container" :for="option">
    {{ label }}
    <input
      type="checkbox"
      class="checkbox"
      :id="option"
      :value="option"
      v-model="localSelectedValue"
    />
    <pre class="description">{{ description }}</pre>
    <span class="checkmark"></span>
  </label>
</template>
<script>
export default {
  name: "Checkbox",
  props: {
    label: String,
    value: Array,
    option: String,
    description: String,
  },
  methods: {
    showdescription: function () {
      this.descriptionVisible = true;
    },
    hidedescription: function () {
      this.descriptionVisible = false;
    },
  },
  data: function () {
    return {
      descriptionVisible: false,
    };
  },
  model: {
    prop: "value",
    event: "input",
  },
  computed: {
    localSelectedValue: {
      get() {
        return this.value;
      },
      set() {
        this.$emit(
          `input`,
          event.target.checked
            ? this.value.concat(event.target.value)
            : this.value.filter((el) => el !== event.target.value)
        );
      },
    },
  },
};
</script>
<style scoped>
.description {
  margin-top: 0.4em;
  font-size: 0.8em;
  white-space: pre-wrap;
  word-wrap: break-word;
  font-family: inherit;
  line-height: 1.2em;
  padding: 0.8em;
}

.checkbox-container {
  display: block;
  text-align: left;
  position: relative;
  padding-left: 50px;
  margin-top: 40px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.checkbox-container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

.checkbox-container > .checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 20px;
  width: 20px;
}

.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

.checkbox-container input:checked ~ .checkmark:after {
  display: block;
}

.checkbox-container .checkmark:after {
  left: 6px;
  top: 2px;
  width: 5px;
  height: 10px;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>
