<template>
  <div>
    <v-navigation-drawer temporary v-model="sideNav" app right>
      <v-list>
        <v-list-item
          v-for="item in menuItems"
          :key="item.title"
          :to="item.link"
          color="primary"
        >
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>{{ item.title }}</v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-system-bar height="45">
      <v-container class="d-flex justify-start">
        <v-spacer></v-spacer>
        <v-btn
          v-for="(icon, i) in icons"
          :key="i"
          :onclick="icon.onclick"
          target="_blank"
          class="mx-4 white--text hidden-sm-and-down"
          icon
          color="white"
        >
          <v-icon size="20px" color="primary">
            {{ icon.p }}
          </v-icon>
        </v-btn>
      </v-container>
    </v-system-bar>
    <v-app-bar app color="white" dark hide-on-scroll>
      <v-container class="d-flex justify-center">
        <v-btn icon small to="/">
          <v-img height="55" src="@/assets/coco.svg" min-height="40"></v-img>
        </v-btn>
        <a href="/" class="hidden-sm-and-down ml-5">
          <h4
            class="titulo font-weight-black headline black--text text-decoration-overline"
          >
            Aguita de Coco
          </h4></a
        >
        <v-spacer></v-spacer>
        <v-app-bar-nav-icon
          @click.stop="sideNav = !sideNav"
          class="hidden-lg-and-up"
          ><v-icon color="primary" large
            >mdi-microsoft-xbox-controller-menu</v-icon
          ></v-app-bar-nav-icon
        >
        <v-btn
          small
          rounded
          color="primary"
          text
          class="hidden-md-and-down"
          v-for="(item, i) in menuItems"
          :key="i"
          :to="item.link"
        >
          {{ item.title }}
        </v-btn>
        <v-divider vertical></v-divider>
        <v-btn small icon to="/carrito">
          <v-badge :content="count" :value="count" color="green" overlap>
            <v-icon color="primary" small> mdi-cart-outline </v-icon>
          </v-badge>
        </v-btn>
      </v-container>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  data: () => ({
    count: 0,
    sideNav: false,
    menuItems: [
      {
        icon: "mdi-forum",
        title: "Sobre Nosotros",
        link: "/nosotros",
      },
      {
        icon: "mdi-forum",
        title: "Crud",
        link: "/crud",
      },
    ],
    icons: [
      {
        p: "mdi-facebook",
        onclick: "window.open('https://www.facebook.com/', '_blank')",
      },
      {
        p: "mdi-instagram",
        onclick: "window.open('https://www.instagram.com/', '_blank')",
      },
      {
        p: "mdi-twitter",
        onclick: "window.open('https://www.twitter.com/', '_blank')",
      },
      {
        p: "mdi-github",
        onclick: "window.open('https://github.com/JulianMGonzalez', '_blank')",
      },
    ],
  }),
  created() {
    this.countProductos();
  },
  methods: {
    countProductos() {
      if (JSON.parse(localStorage.getItem("products"))) {
        let tienda = JSON.parse(localStorage.getItem("products"));
        for (let i = 0; i < tienda.length; i++) {
          this.count = this.count + 1
        }
      }
    },
  },
};
</script>
<style scoped>
.titulo {
  font-family: Georgia, "Times New Roman", Times, serif;
  font-style: italic;
}
</style>