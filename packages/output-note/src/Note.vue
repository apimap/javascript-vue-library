<template>
  <div class="note">
    <p><img :src="icon" alt="note"/>Note</p>
    <p>{{ text }}</p>
  </div>
</template>

<script>
import icon from "./assets/note-icon.svg";

export default {
  name: "Note",
  props: {
    text: String,
  },
  data: function() {
    return {
      icon,
    };
  },
};
</script>
<style scoped>
.note {
  padding-left: 1.4em;
  padding-right: 1.4em;
  padding-top: 0.4em;
  padding-bottom: 0.4em;
  border-radius: 0.3em;
  margin-top: 1em;
  margin-bottom: 1em;
}

img {
  padding-right: 0.2em;
  vertical-align: middle;
}
</style>
