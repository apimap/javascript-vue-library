<template>
  <div class="content-header">
    <div class="title"><h1>{{ title }}</h1></div>
    <div class="introduction" v-if="introduction">{{ introduction }}</div>
  </div>
</template>
<script>
export default {
  name: "ContentHeader",
  props: {
    title: String,
    introduction: String
  }
};
</script>
<style scoped>

.content-header {
  width: 100%;
  display: flex;
  flex-wrap: nowrap;
  flex-direction: row;
  justify-content: flex-start;
  align-items: stretch;
  margin-top: 0.2em;
  text-align: left;
  padding-top: 1em;
  padding-bottom: 2em;
  gap: 4em;
}

.title {
  width: 40%;
}

.introduction {
  font-size: 1.2em;
  line-height: 1.4em;
  width: 60%;
  white-space: pre-wrap;
}

</style>
