<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col sm="8" md="5" offset-md="2" lg="4" xl="4" offset-lg="3">
          <div>
            <v-row v-for="(product) in cart" :key="product.id">
              <v-card outlined min-width="100%" class="mb-5 pa-4">
                <div class="d-flex">
                  <div>
                    <v-img :src="product.imagen" width="120px" height="120px" />
                  </div>

                  <div class="d-flex flex-column justify-center">
                    <v-card-title class="pt-0">
                      {{ product.nombre }}
                    </v-card-title>

                    <v-card-subtitle>
                      ${{ product.precio}}
                    </v-card-subtitle>
                    <v-card-subtitle>
                      {{ product.stock }}
                    </v-card-subtitle>

                    <v-btn
                      color="error"
                      class="ml-4"
                      outlined
                      small
                      @click="eliminar(product.id)"
                    >
                      <v-icon small left>mdi-trash-can-outline</v-icon>
                      Eliminar
                    </v-btn>
                    
                  </div>
                  <div class="d-flex flex-column justify-center">
                      <v-btn class="mx-2" fab dark small color="primary" @click="aumentar(product.id)"> 
                        <v-icon small>mdi-plus</v-icon>
                      </v-btn>
                      <v-btn class="mx-2" fab small disabled v-if="product.stock === 0">
                      </v-btn>
                      <v-btn class="mx-2" fab dark small color="error" @click="disminuir(product.id)" v-else>
                        <v-icon small>mdi-minus</v-icon>
                      </v-btn>
                    </div>
                </div>
              </v-card>
            </v-row>
          </div>
        </v-col>
        <v-col sm="4" md="3" order="first" order-sm="last">
          <div>
            <v-card outlined>
              <v-card-title>Detalles del Pago</v-card-title>

              <v-card-text>
                <p v-for="(product, i) in cart" :key="i">
                  {{ product.nombre }}: {{ product.precio_venta }} * {{product.stock}} + envio
                </p>
                <v-divider></v-divider>
                <p>Total = {{total}}.00</p>
                <v-btn to="/" color="primary" v-if="cart == ''"> Agrega productos </v-btn>
              </v-card-text>
            </v-card>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
module.exports = {
  data() {
    return {
      checkoutForm: null,
      nameRules: [],
      name: "",
      emailRules: [],
      email: "",
      cart: [],
    };
  },
  computed:{
    total(){
      let total = 0
      for (let i=0; i<this.cart.length; i++){
        total += this.cart[i].precio*this.cart[i].stock
      }
      return total
    }
  },
  created() {
    if(JSON.parse(localStorage.getItem('products'))){
      let tienda = JSON.parse(localStorage.getItem('products'))
      for (let i = 0; i< tienda.length ; i++){
        tienda[i].stock = 1
      }
      this.cart = tienda

    }else{
      this.cart = []
    }
  },
  methods: {
    iniciar(){
      this.$router.push({ name: "Login"})
      
    },
    goToCheckout() {
      console.log("checkout");
      this.$router.push({ name: "Validacion" });
    },
    eliminar(id){
      for (let i = 0; i< this.cart.length ; i++){
        if(this.cart[i].id == id){
          this.cart.splice(i, 1)
          localStorage.setItem('products', JSON.stringify(this.cart))
        }
      }
      location.reload()

    },
    aumentar(id){
      for(let i = 0; i < this.cart.length ; i++){
        if (this.cart[i].id == id){
          this.cart[i].stock++
          localStorage.setItem('products', JSON.stringify(this.cart))
        }
      }
    },
    disminuir(id){
      for(let i = 0; i < this.cart.length ; i++){
        if (this.cart[i].id == id){
          this.cart[i].stock--
          localStorage.setItem('products', JSON.stringify(this.cart))
        }
      }
    }
    
  },
};
</script>