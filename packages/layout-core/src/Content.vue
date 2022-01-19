<template>
  <div class="content">
    <div class="title" v-if="title">{{ title }}</div>
    <slot/>
  </div>
</template>
<script>
export default {
  name: "Content",
  props: {
    title: String
  }
};
</script>
<style scoped>

.content {
  width: 100%;
  padding-top: 1em;
  padding-bottom: 2em;
  text-align: left;
}

</style>
