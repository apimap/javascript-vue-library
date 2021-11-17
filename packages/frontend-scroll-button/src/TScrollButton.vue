<template>
  <div class="scroll-button">
    <img
        class="button"
        :src="upwardsScrollIcon"
        v-on:click="toTop"
    />
  </div>
</template>

<script>

import upwardsScrollIcon from "./assets/page-scroll-upwards.svg";
import downwardsScrollIcon from "./assets/page-scroll-downwards.svg";

export default {
  name: "TScrollButton",
  data: function() {
    return {
        pageScrollIcon
    };
  },
  methods: {
    toTop: function() {
        window.scroll({ top: 0, left: 0, behavior: "smooth" });
    },
    toBottom: function(){
        window.scroll({ top: 0, left: 0, behavior: "smooth" });
    }
  },
};

</script>

<style scoped>

.button {
  cursor: pointer;
}

</style>
