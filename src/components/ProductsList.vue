<template>
  <div>
    <v-container class="pa-4 text-center mt-16">
      <v-switch
        v-model="switch1"
        class="container"
        label="Mostrar descuentos"
      ></v-switch>
      <div v-if="switch1 == false">
        <v-row class="fill-height mb-10" align="center" justify="center">
          <template v-for="(item, i) in productos">
            <v-col :key="i" cols="12" md="4">
              <v-hover v-slot="{ hover }">
                <v-card
                  class="mx-auto"
                  color="grey lighten-4"
                  max-width="600"
                  elevation="10"
                  rounded="xl"
                >
                  <v-img :aspect-ratio="16 / 9" :src="item.imagen">
                    <v-expand-transition>
                      <div
                        v-if="hover"
                        class="d-flex justify-center align-center transition-fast-in-fast-out primary darken-2 v-card--reveal white--text"
                        style="height: 100%"
                      >
                        <p class="mx-5">{{ item.descripcion }}</p>
                      </div>
                    </v-expand-transition>
                  </v-img>
                  <v-row>
                    <v-col cols="7">
                      <v-card-title> {{ item.nombre }} </v-card-title>
                    </v-col>
                    <v-col cols="5">
                      <v-card-title
                        class="d-flex justify-end"
                        v-if="item.descuento >= 1"
                      >
                        ${{ item.precio }}
                      </v-card-title>
                      <v-card-title class="d-flex justify-end" v-else>
                        ${{ item.precio }}
                      </v-card-title>
                    </v-col>
                  </v-row>

                  <v-card-actions>
                    <v-btn
                      color="orange lighten-2"
                      rounded
                      medium
                      text
                      @click="agregarItem(item)"
                    >
                      Comprar
                    </v-btn>

                    <v-spacer></v-spacer>

                    <p v-if="item.descuento >= 1" class="red--text">
                      Descuento!
                    </p>
                  </v-card-actions>
                </v-card>
              </v-hover>
            </v-col>
          </template>
        </v-row>
      </div>
      <div v-else>
        <v-row class="fill-height mb-10" align="center" justify="center">
          <template v-for="(item, i) in filtrarDescuento">
            <v-col :key="i" cols="12" md="4">
              <v-hover v-slot="{ hover }">
                <v-card
                  class="mx-auto"
                  color="grey lighten-4"
                  max-width="600"
                  elevation="10"
                  rounded="xl"
                >
                  <v-img :aspect-ratio="16 / 9" :src="item.imagen">
                    <v-expand-transition>
                      <div
                        v-if="hover"
                        class="d-flex justify-center align-center transition-fast-in-fast-out primary darken-2 v-card--reveal white--text"
                        style="height: 100%"
                      >
                        <p class="mx-5">{{ item.descripcion }}</p>
                      </div>
                    </v-expand-transition>
                  </v-img>
                  <v-row>
                    <v-col cols="7">
                      <v-card-title> {{ item.nombre }} </v-card-title>
                    </v-col>
                    <v-col cols="5">
                      <v-card-title
                        class="d-flex justify-end"
                        v-if="item.descuento >= 1"
                      >
                        ${{ item.precio }}
                      </v-card-title>
                      <v-card-title class="d-flex justify-end" v-else>
                        ${{ item.precio }}
                      </v-card-title>
                    </v-col>
                  </v-row>

                  <v-card-actions>
                    <v-btn
                      color="orange lighten-2"
                      rounded
                      medium
                      text
                      @click="agregarItem(item)"
                    >
                      Comprar
                    </v-btn>

                    <v-spacer></v-spacer>

                    <p v-if="item.descuento >= 1" class="red--text">
                      Descuento!
                    </p>
                  </v-card-actions>
                </v-card>
              </v-hover>
            </v-col>
          </template>
        </v-row>
      </div>
    </v-container>
  </div>
</template>

<script>
import productos from "@/logic/ApiProductos.js";

export default {
  data: () => ({
    productos: [],
    switch1: false,
  }),
  created() {
    this.mostrar();
  },
  computed: {
    filtrarDescuento() {
      return this.productos.filter((item) => item.descuento >= 1);
    },
  },
  methods: {
    async mostrar() {
      let response = await productos.post(1);
      for (let i = 0; i < response.data.length; i++) {
        if (response.data[i].estado == 1) {
          if (response.data[i].descuento >= 1) {
            response.data[i].precio = Math.round(
              response.data[i].precio -
                (response.data[i].descuento / 100) * response.data[i].precio
            );
          }
          this.productos.push(response.data[i]);
        }
      }
    },
    agregarItem(item) {
      let cart = [];
      if (JSON.parse(localStorage.getItem("products"))) {
        cart = JSON.parse(localStorage.getItem("products"));
      } else {
        cart = [];
      }
      cart.push(item);
      localStorage.setItem("products", JSON.stringify(cart));
      location.reload()
    },
  },
};
</script>

<style>
</style>
