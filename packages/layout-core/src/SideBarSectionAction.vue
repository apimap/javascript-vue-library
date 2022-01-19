<template>
  <div class="side-bar-section-action">
    <router-link :to="target">
      <div class="button">
        {{ title }}
      </div>
    </router-link>
  </div>
</template>

<script>
export default {
  name: "SideBarSectionAction",
  props: {
    title: String,
    target: String,
  }
};
</script>

<style scoped>

.button {
  border-radius: 0.2em;
  padding-left: 1em;
  padding-right: 1em;
  padding-top: 0.6em;
  padding-bottom: 0.6em;
  text-align: center;
  font-weight: bolder;
  font-size: 0.8em;
}

.button:hover {
  text-decoration: none;
  cursor: pointer;
}

</style>
