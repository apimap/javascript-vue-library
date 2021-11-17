<template>
  <div class="code-example">
    <h3>{{ title }}</h3>
    <p v-if="description">{{ description }}</p>
    <pre v-html="content" class="content"/>
  </div>
</template>

<script>
export default {
  name: "CodeExample",
  props: {
    title: String,
    description: String,
    content: String
  }
};
</script>
<style scoped>

.code-example{
  text-align: left;
  margin-top: 2em;
  margin-bottom: 1em;
}

.code-example > .contecontent-table > table {
  border: 1px solid;
  width: 100%;
  border-spacing: 0.4em;
  border-collapse: separate;
}
</style>
