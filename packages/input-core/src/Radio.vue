<template>
  <label class="radio-container">
    {{ label }}
    <input
      type="radio"
      class="radio"
      :id="option"
      :name="name"
      :value="option"
      v-model="localSelectedValue"
    />
    <p class="radio-description">{{ description }}</p>
    <span class="radio-button"></span>
  </label>
</template>
<script>

export default {
  name: "Radio",
  props: {
    label: String,
    value: String,
    option: String,
    name: String,
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
        this.$emit(`input`, event.target.value);
      },
    },
  },
};
</script>
<style scoped>

.radio-description {
  padding: 0.6em;
  border-radius: 0.2em;
  margin-top: 0.1em;
  border: 1px solid #dbd8e3;
}

.radio-container {
  display: block;
  position: relative;
  padding-left: 50px;
  margin-top: 40px;
  cursor: pointer;
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
  background: #5c5470;
}
</style>
