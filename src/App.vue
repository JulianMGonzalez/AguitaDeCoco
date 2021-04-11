<template>
  <v-app>
    <v-main>
      <navigation-global></navigation-global>
      <router-view />
      <global-tool></global-tool>
      <footer-global></footer-global>
    </v-main>
  </v-app>
</template>

<script>
import NavigationGlobal from '@/components/NavigationGlobal.vue';
import FooterGlobal from './components/FooterGlobal.vue';
import GlobalTool from './components/GlobalTool.vue';

export default {
  name: 'App',

  components: {
    NavigationGlobal,
    FooterGlobal,
    GlobalTool
  },

  data: () => ({
    //
  }),
};
</script>
