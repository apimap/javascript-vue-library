<template>
  <div class="command-line">
    <h3>{{ title }}</h3>
    <ul>
      <li v-for="v in deprecated" :key="v" class="deprecated-version">{{ v }}</li>
      <li v-for="v in available" :key="v" class="available-version">{{ v }}</li>
    </ul>
    <div class="terminal-command">{{ command }}</div>
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: "CommandLine",
  props: {
    command: String,
    title: String,
    deprecated: Array,
    available: Array
  }
};
</script>
<style scoped>

ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

li {
  font-size: 0.8em;
  padding-top: 0.2em;
  padding-bottom: 0.2em;
  padding-left: 1em;
  padding-right: 1em;
  width: 4em;
  border-radius: 0.2em;
  margin-right: 1em;
  display: inline;
  font-weight: bold;
}

.available-version {
  border: 1px solid;
}

.deprecated-version {
  border: 1px solid red;
  color: red;
}

.command-line {
  padding-bottom: 1em;
  line-height: 1.6em;
}

.terminal-command {
  text-align: left;
  background-color: black;
  color: #4AF626;
  margin-top: 1em;
  margin-bottom: 1em;
  padding: 1em;
  font-family: "Courier New", Courier, monospace;
  border-radius: 0.4em;
}
</style>
