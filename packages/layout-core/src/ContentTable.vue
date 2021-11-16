<template>
  <div class="content-table">
    <h3 v-show="title"> {{ title }}</h3>
    <slot></slot>
    <table>
      <thead>
        <tr>
          <th v-for="heading in headings" :key="heading" scope="col">
            {{ heading }}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in items" :key="item">
          <td v-for="element in item" :key="element.version">
            {{ element }}
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
export default {
  name: "ContentTable",
  props: {
    title: String,
    items: Array,
    headings: Array
  }
};
</script>
<style scoped>

.content-table{
  text-align: left;
}

.content-table > table {
  border: 1px solid;
  width: 100%;
  border-spacing: 0.4em;
  border-collapse: separate;
}

td,th {
  line-height: 1.6em;
  padding: 0.2em;
  vertical-align: top;
}

.content-table > thead {
  font-size: 0.8em;
}

</style>
