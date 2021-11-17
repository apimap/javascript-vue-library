<template>
  <div class="code-view">
    <h3 v-if="title">{{ title }}</h3>
    <p v-if="description">{{ description }}</p>
    <div class="content-container">
      <pre
          class="json-container"
          :id="uniqueId"
          v-html="rawContent"
          v-bind:class="{ interactive: isInteractive }"
      />
    </div>
    <a :href="uriEncodedContent" :download="filename" class="download-link" v-if="filename">
      <DownloadIcon alt="Download" />Download this example</a
    >
  </div>
</template>

<script>
import { v4 as uuidv4 } from "uuid";
import DownloadIcon from "@/DownloadIcon";

export default {
  name: "CodeDisplay",
  components:{
    DownloadIcon
  },
  props: {
    title: String,
    description: String,
    isInteractive: Boolean,
    objectContent: Object,
    stringContent: String,
    prefix: String,
    filename: String,
    scrollFunction: Function,
  },
  methods: {
    itemSelected: function (el) {
      this.scrollFunction(el.detail.key);
    },
    addEventListeners: function () {
      this.jsonView.addEventListener("json-view", (e) => this.itemSelected(e));
    },
    removeEventListeners: function () {
      this.jsonView.removeEventListener("json-view", () => this.itemSelected());
    },
  },
  mounted() {
    this.addEventListeners();
  },
  beforeDestroy() {
    this.removeEventListeners();
  },
  computed: {
    uniqueId: function () {
      return uuidv4();
    },
    jsonView: function () {
      return document.getElementById(this.uniqueId);
    },
    rawContent: function () {
      if (this.stringContent !== undefined) {
        return this.stringContent;
      }

      if (this.objectContent !== undefined) {
        const localPrefixCopy = this.prefix;
        const localUniqueIdCopy = this.uniqueId;
        var returnValue = JSON.stringify(this.objectContent, null, 2);
        returnValue = returnValue
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;");
        return returnValue.replace(
            /("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\\-]?\d+)?)/g,
            function (value) {
              if (/^"/.test(value)) {
                if (/:$/.test(value)) {
                  const itemId = value.slice(1).slice(0, -2).split(" ").join("-");
                  const lookupKey = localPrefixCopy + "-" + itemId;
                  return `<span class="key" onclick="document.getElementById('${localUniqueIdCopy}').dispatchEvent(new CustomEvent('json-view', {bubbles: false, cancelable: true, detail: {key:'${lookupKey}'}}));">${value}</span>`;
                }
              }
              return `<span>${value}</span>`;
            }
        );
      }

      return undefined;
    },
    uriEncodedContent: function () {
      if (this.stringContent !== undefined) {
        return ("data:text/plain;charset=utf-8," + encodeURIComponent(this.stringContent));
      } else {
        return ("data:text/plain;charset=utf-8," + encodeURIComponent(JSON.stringify(this.objectContent, null, 2)));
      }
    },
  },
};
</script>

<style scoped>

.code-view > .download-link > img {
  vertical-align: middle;
  padding-right: 0.2em;
}

.code-view > .download-link {
  border: 1px solid var(--primary-link-color);
  padding: 1em;
  padding-top: 0.6em;
  padding-bottom: 0.6em;
  color: var(--primary-link-color);
}

.code-view > .download-link > a {
  color: var(--secondary-link-color);
}

.code-view {
  text-align: left;
  padding-bottom: 4em;
  padding-top: 2em;
}

</style>

<style>

.code-view > .content-container {
  background-color: var(--code-background-color);
  display: block;
  color: var(--code-color);
  padding: 1em;
  margin-bottom: 1.6em;
  line-height: 1.4em;
  text-align: left;
  overflow: auto;
  font-size: 1em;
}

.code-view > .content-container > .json-container {
  margin: 0;
}

.code-view > .content-container > .interactive > .key {
  background-color: var(--secondary-link-background-color);
}
</style>
