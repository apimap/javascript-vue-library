<template>
  <div class="command-line">
    <h3>{{ title }}</h3>
    <ul>
      <li v-for="v in available" :key="v" class="available-version">Available in: {{ v }}</li>
      <li v-for="v in deprecated" :key="v" class="deprecated-version">Not available in: {{ v }}</li>
    </ul>
    <div class="terminal"><div v-on:click="copyToClipboard()" class="copy-button">COPY</div></div>
    <div class="terminal-command">{{ this.content() }}</div>
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
  },
  methods: {
    copyToClipboard: function() {
      navigator.clipboard.writeText(this.content());
    },
    content: function () {
      return this.command
          .replace(/&amp;/g, "&")
          .replace(/&lt;/g, "<")
          .replace(/&gt;/g, ">")
          .replace(/&#34;/g, "\"");
    }
  }
};
</script>
<style scoped>

.copy-button {
  border: 2px solid #5c5470;
  color:  #5c5470;
  font-size: 0.6em;
  padding-left: 0.6em;
  padding-right: 0.6em;
  padding-top: 0.2em;
  padding-bottom: 0.2em;
  width: min-content;
  border-radius: 0.2em;
  margin-left: auto;
  margin-right: 1em;
  margin-top: 0.4em;
}

.copy-button:hover {
  cursor: pointer;
  background-color: #5c5470;
  color: #dbd8e3;
}

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
  white-space: nowrap
}

.deprecated-version {
  border: 1px solid red;
  color: red;
  white-space: nowrap
}

.command-line {
  padding-bottom: 1em;
  line-height: 1.6em;
}

.terminal-command {
  text-align: left;
  background-color: #2a2438;
  color: #dbd8e3;
  margin-bottom: 1em;
  padding: 1em;
  font-family: "Courier New", Courier, monospace;
  font-weight: lighter;
  border: 2px solid #dbd8e3;
  white-space: pre-wrap;
}

.terminal {
  margin-top: 1em;
  height: 40px;
  border: 2px solid #dbd8e3;
  border-radius: 0.6em 0.6em 0 0;
  background-color: #dbd8e3;
  text-align: right;
}

</style>
