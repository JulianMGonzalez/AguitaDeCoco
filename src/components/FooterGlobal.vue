<template>
  <v-footer color="primary white--text">
    <v-container class="py-5">
      <v-row class="py-4">
        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
          <v-img src="TuDado.png" width="100" class="mb-3"></v-img>
          <p class="font-italic text-muted">
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
            eiusmod tempor incididunt."
          </p>
          <v-row class="py-4">
            <v-col cols="12">
              <v-btn :onclick="link.link" target="_blank" class="mx-1" fab dark x-small color="secondary" v-for="(link, i) in links" :key="i">
                <v-icon dark> {{link.icono}} </v-icon>
              </v-btn>
            </v-col>
          </v-row>
        </div>
        <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
          <h4 class="text-uppercase font-weight-bold mb-4 button">Soporte</h4>
          <v-list color="primary">
            <v-list-item-group>
              <v-list-item v-for="(item, i) in items" :key="i">
                <v-list-item-content>
                  <v-list-item-subtitle
                    v-text="item.text"
                    class="white--text"
                  ></v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </v-list-item-group>
          </v-list>
        </div>
        <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
          <h4 class="text-uppercase font-weight-bold mb-4 button">Pagina</h4>
          <v-list color="primary">
            <v-list-item-group>
              <v-list-item v-for="(item, i) in items1" :key="i">
                <v-list-item-content>
                  <v-list-item-subtitle
                    v-text="item.text"
                    class="white--text"
                  ></v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </v-list-item-group>
          </v-list>
        </div>
        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
          <h4 class="text-uppercase font-weight-bold mb-4 button">contacto</h4>
          <p class="text-muted mb-4">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. At itaque
            temporibus.
          </p>
          <v-text-field
            label="Correo@gmail.com"
            :rules="rules"
            hide-details="auto"
            color="white"
            rounded
            solo
          >
            <v-icon slot="append" color="primary" @click="enviar"
              >mdi-send</v-icon
            >
          </v-text-field>
        </div>
      </v-row>
      <v-divider></v-divider>
      <v-col class="text-center" cols="12">
        {{ new Date().getFullYear() }} — <strong>Aguita de coco</strong>
      </v-col>
    </v-container>
  </v-footer>
</template>

<script>
export default {
  data() {
    return {
      links: [
        {
          icono: "mdi-youtube",
          link: "window.open('https://www.youtube.com/', '_blank')",
        },
        {
          icono: "mdi-gmail",
          link: "location.href='mailto:aguitacoco@gmail.com'",
        },
        {
          icono: "mdi-linkedin",
          link: "window.open('https://www.linkedin.com', '_blank')",
        },
        {
          icono: "mdi-vuejs",
          link: "window.open('https://vuejs.org', '_blank')",
        },
      ],
      rules: [
        (value) => !!value || "Requerido.",
        (value) => (value || "").length <= 40 || "Maximo 40 caracteres",
        (value) => {
          const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
          return pattern.test(value) || "E-mail invalido";
        },
      ],
      items: [
        {
          text: "Juegos",
        },
        {
          text: "Mejorar Habilidades",
        },
        
      ],
      items1: [
        {
          text: "Desarrolla",
        },
        {
          text: "Blog",
        },
      ],
    };
  },
  methods: {
    enviar() {
      alert("funciona");
    },
  },
};
</script>

