<template>
  <div class="center-layout" :style="style">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "CenterLayout",
  props: {
    width: String,
    fullscreen: Boolean,
    offset: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    style () {
      let returnValue = "";

      if (this.fullscreen){ returnValue = 'width: 100%;';
      } else { returnValue = 'width:' + this.width + ';' }

      if(this.offset){ returnValue += "margin-left: max(260px, 24%);" }

      return returnValue;
    }
  }
};
</script>

<style scoped>

.center-layout {
  margin: auto;
  line-height: 1.2em;
  align-items: stretch;
}

</style>