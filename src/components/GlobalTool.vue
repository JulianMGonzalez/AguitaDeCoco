<template>
  <v-card>
    <!--  -->
    <v-speed-dial
      fixed
      v-model="fab"
      bottom
      right
      direction="top"
      open-on-hover
      transition="slide-y-reverse-transition"
    >
      <template v-slot:activator>
        <v-btn v-model="fab" color="blue darken-2" dark fab>
          <v-icon v-if="fab"> mdi-close </v-icon>
          <v-icon v-else> mdi-help </v-icon>
        </v-btn>
      </template>
      <v-btn fab dark small color="indigo" v-scroll="onScroll" @click="toTop">
        <v-icon>mdi-arrow-up</v-icon>
      </v-btn>
      <v-btn
        fab
        dark
        small
        color="green"
        onclick="window.open('https://wa.me/573232477487', '_blank')"
      >
        <v-icon>mdi-whatsapp</v-icon>
      </v-btn>
    </v-speed-dial>
  </v-card>
</template>

<script>
export default {
  data: () => ({
    fab: false,
  }),
  methods: {
    onScroll(e) {
      if (typeof window === "undefined") return;
      const top = window.pageYOffset || e.target.scrollTop || 0;
      this.fab = top > 60;
    },

    toTop() {
      this.$vuetify.goTo(0);
    },
  },
};
</script>

<style>
</style>