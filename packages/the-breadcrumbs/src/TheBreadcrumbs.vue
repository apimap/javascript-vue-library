<template>
  <div class="breadcrumbs">
    <div class="path">
      <HomeIcon alt="home"/>
      <Spacer alt="separator" class="separator"/>
      <div>
        <ul>
          <li
              v-for="(breadcrumb, idx) in breadcrumbList"
              :key="idx"
              @click="goToBreadcrumb(idx)"
              :class="{ linked: !!breadcrumb.link }"
          >
            {{ breadcrumb.name }}
          </li>
        </ul>
      </div>
    </div>
    <div class="mode">
      <p v-if="isDarkModeEnabled">We support light mode</p>
      <p v-else>We support dark mode</p>
      <Spacer alt="separator" class="separator"/>
      <LightModeIcon
          class="mode-icon"
          alt="Switch to light mode"
          v-if="isDarkModeEnabled"
      />
      <DarkModeIcon
          class="mode-icon"
          alt="Switch to dark mode"
          v-else
      />
    </div>
  </div>
</template>

<script>

import HomeIcon from "@/HomeIcon";
import DarkModeIcon from "@/DarkModeIcon";
import LightModeIcon from "@/LightModeIcon";
import Spacer from "@/Spacer";

export default {
  name: "TheBreadcrumbs",
  props: {
    type: String,
  },
  components: {
    HomeIcon,
    DarkModeIcon,
    LightModeIcon,
    Spacer
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
    },
    mediaUpdated: function() {
      const darkMediaQuery = window.matchMedia("(prefers-color-scheme: dark)");
      this.isDarkModeEnabled = darkMediaQuery.matches;
    },
    addEventListeners: function() {
      window
          .matchMedia("(prefers-color-scheme: dark)")
          .addEventListener("change", () => this.mediaUpdated());
    },
    removeEventListeners: function() {
      window
          .matchMedia("(prefers-color-scheme: dark)")
          .removeEventListener("change", () => this.mediaUpdated());
    },
  },
  mounted() {
    this.updateBreadcrumbs();
    this.mediaUpdated();
    this.addEventListeners();
  },
  beforeDestroy() {
    this.removeEventListeners();
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
  background-color: #fff;
  height: 3em;
  font-size: 0.9em;
  font-weight: bold;
  top: 0;
}

.mode {
  float: right;
  display: flex;
  flex-direction: row;
  align-items: center;
  height: 100%;
}

.linked {
  color: #00a3fa;
}

.mode > .mode-icon {
  padding-right: 0.5em;
}

.path {
  float: left;
  display: flex;
  flex-direction: row;
  font-size: 1em;
  align-items: center;
  height: 100%;
}

.path > .home-icon {
  padding-left: 0.5em;
}

ul {
  list-style-type: none;
  padding-left: 0;
  margin: 0;
}

li {
  float: left;
  cursor: pointer;
}

li:after {
  content: "/";
  display: inline-block;
  width: 1.3em;
}

li:hover {
  text-decoration: underline;
}

.separator {
  padding: 0;
}
</style>
