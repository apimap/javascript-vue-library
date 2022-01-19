<template>
  <div class="side-bar-section">
    <div class="title"><h3>{{ title }}</h3></div>
    <div class="options" v-for="section in sections" :key="section.title">
      <template v-if="section.sidebar">
        <div class="option-title" v-if="section.title!==undefined">{{ section.title }}</div>
        <ul>
          <li v-for="option in section.options" :key="option.title">
            <router-link :to="option.url" class="url" v-if="section.sidebar">{{ option.title }}</router-link>
          </li>
        </ul>
      </template>
    </div>
    <div class="actions">
      <slot/>
    </div>
  </div>
</template>

<script>
export default {
  name: "SideBarSection",
  props: {
    title: String,
    sections: Array,

  }
};
</script>

<style scoped>

.option-title{
  font-size: 0.8em;
  line-height: 2em;
}

.actions{
  padding-bottom: 1em;
  padding-top: 1em;
}

.side-bar-section{
  padding-top: 1em;
  padding-left: 1em;
  padding-right: 1em;
  padding-bottom: 1.4em;
  text-align: left;
  line-height: 1.2em;
}

li {
  line-height: 1.6em;
}

ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
  padding-bottom: 1em;
}

</style>
