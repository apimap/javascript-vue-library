<template>
  <div class="content-section">
    <h2 v-show="title"> {{ title }}</h2>
    <slot></slot>
  </div>
</template>
<script>
  export default {
    name: "ContentSection",
    props: {
      title: String
    }
  };
</script>
<style scoped>

  .content-section{
    line-height: 1.4em;
    text-align: left;
  }

  p {
    margin-bottom: 2em;
  }

</style>
