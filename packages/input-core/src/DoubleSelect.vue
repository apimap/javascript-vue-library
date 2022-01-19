<template>
  <div class="select">
    <h3>{{ label }}</h3>
    <p>It is only possible to select one of the options bellow. If none is matching please select "None of the above" from one of the dropdowns.</p>
    <div class="optionsgrid">
      <div class="optiongriditem">
        <h4>Implementation Language</h4>
        <p>Select the language the SDK has been developed with. This will tell any other developers what language to expect and thereby if the API is usable.</p>
        <select :name="name" v-model="localSelectedValue" ref="implementation">
        <Option
            v-for="option in options1"
            :key="option.value"
            :value="option.value"
            :label="option.label"
        />
        <option value="none" v-if="allowCustom">None of the above</option>
        </select>
      </div>
      <div class="optiongriditem">
        <h4>Specification Standard</h4>
        <p>Select the specification that the API uses to integrate with other systems. If the API supports multiple specifications please select the preferred option.</p>
        <select :name="name" v-model="localSelectedValue" ref="specification">
        <Option
            v-for="option in options2"
            :key="option.value"
            :value="option.value"
            :label="option.label"
        />
        <option value="none" v-if="allowCustom">None of the above</option>
        </select>
     </div>
    </div>
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
  name: "DoubleSelect",
  components: { Input, Option },
  props: {
    name: String,
    description: String,
    label: String,
    allowCustom: Boolean,
    customPlaceholder: String,
    options1: Array,
    options2: Array
  },
  computed: {
    localSelectedValue: {
      get() {
        return this.value;
      },
      set() {
        if (event.target.value === "none") {
          this.showCustomInput = true;
        } else if ( this.options1.filter((opt) => opt.value === event.target.value).length === 0
          && this.options2.filter((opt) => opt.value === event.target.value).length === 0 ) {
          this.showCustomInput = true;
          this.$emit(`input`, event.target.value);
        } else {
          if(this.options2.filter((opt) => opt.value === event.target.value).length !== 0){
            this.$refs.implementation.value = undefined
          }

          if(this.options1.filter((opt) => opt.value === event.target.value).length !== 0){
            this.$refs.specification.value = undefined
          }

          this.showCustomInput = false;
          this.$emit(`input`, event.target.value);
        }
      },
    },
  },
  data: function() {
    return {
      showCustomInput: false
    };
  },
};
</script>

<style scoped>

.optionsgrid {
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  align-items: center;
  justify-content: stretch;
  width: 100%;
}

select {
  margin-top: 20px;
  display: block;
  padding: 15px;
  font-size: 1em;
  padding-right: 4em;
  width: 100%;
  outline: none;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  background: url("assets/dropdown-icon.svg") 96% / 15% no-repeat;
  background-size: 30px;
  background-position-x: calc(100%- 10px);
  background-color: white;
}

select {
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
  border: 1px solid #dbd8e3;
  color: #5c5470;
}

.select {
  text-align: left;
  margin-bottom: 4em;
}

.optional-input {
  margin-top: 20px;
}
</style>
