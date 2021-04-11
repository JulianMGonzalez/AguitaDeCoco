<template>
  <v-app>
    <v-main>
      <navigation-global :messages="2"></navigation-global>
      <transition name="slide-fade" mode="out-in">
        <router-view />
      </transition>
      <global-tool></global-tool>
      <footer-global></footer-global>
    </v-main>
  </v-app>
</template>

<script>
import NavigationGlobal from "@/components/NavigationGlobal.vue";
import FooterGlobal from "./components/FooterGlobal.vue";
import GlobalTool from "./components/GlobalTool.vue";

export default {
  name: "App",

  components: {
    NavigationGlobal,
    FooterGlobal,
    GlobalTool,
  },

  data: () => ({
    //
  }),
};
</script>
<style>
.fade-enter-active,
.fade-leave-active {
  transition-property: opacity;
  transition-duration: 0.25s;
}

.fade-enter-active {
  transition-delay: 0.25s;
}

.fade-enter,
.fade-leave-active {
  opacity: 0;
}

.slide-fade-enter-active {
  transition: all 0.3s ease;
}
.slide-fade-leave-active {
  transition: all 0.2s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter,
.slide-fade-leave-to {
  transform: translateX(10px);
  opacity: 0;
}
</style>

