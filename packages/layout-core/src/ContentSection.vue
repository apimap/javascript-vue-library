<template>
  <div class="content-section">
    <h3 v-show="title"> {{ title }}</h3>
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
