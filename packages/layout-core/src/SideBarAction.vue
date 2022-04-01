<template>
  <div class="side-bar-action">
    <router-link :to="target">
      <div class="content">
        <img :src="image">
      </div>
    </router-link>
  </div>
</template>

<script>
export default {
  name: "SideBarAction",
  props: {
    target: String,
    image: String
  }
};
</script>

<style scoped>

.content{
  padding-left: 1em;
  padding-right: 1em;
  padding-top: 0.6em;
  padding-bottom: 0.6em;
}

</style>
