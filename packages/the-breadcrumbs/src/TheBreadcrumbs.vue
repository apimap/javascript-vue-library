<template>
  <div class="breadcrumbs">
    <div class="path">
      <div>
        <ul>
          <li
              v-for="(breadcrumb, idx) in breadcrumbList"
              :key="idx"
          >
            <a href="#" @click="goToBreadcrumb(idx)">{{ breadcrumb.name }}</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: "TheBreadcrumbs",
  props: {
    type: String,
  },
  data: function() {
    return {
      breadcrumbList: [],
      isDarkModeEnabled: false,
    };
  },
  methods: {
    goToBreadcrumb: function(key) {
      if (this.breadcrumbList[key].link)
        this.$router.push(this.breadcrumbList[key].link);
    },
    updateBreadcrumbs: function() {
      this.breadcrumbList = this.$route.meta.breadcrumb;
    }
  },
  mounted() {
    this.updateBreadcrumbs();
  },
  watch: {
    $route() {
      this.updateBreadcrumbs();
    },
  },
};
</script>

<style scoped>

.breadcrumbs {
  width: 100%;
  height: 3em;
  font-size: 0.9em;
  font-weight: bold;
  top: 0;
  padding-bottom: 0;
  margin-bottom: 1em;
}

.path {
  float: left;
  display: flex;
  flex-direction: row;
  font-size: 1em;
  align-items: center;
  height: 100%;
}

ul {
  list-style-type: none;
  padding-left: 0;
  margin: 0;
}

li {
  float: left;
}

li:after {
  content: "/";
  display: inline-block;
  width: 1.3em;
}

.separator {
  padding: 0;
}
</style>
