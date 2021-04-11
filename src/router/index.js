import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Crud from '../views/Crud.vue'
import About from '../views/About.vue'
import Cart from '../views/ShoppingCart'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/nosotros',
    name: 'Nosotros',
    component: About
  },
  {
    path: '/crud',
    name: 'Crud',
    component: Crud
  },
  {
    path: '/carrito',
    name: 'Carrito',
    component: Cart
  }
  
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
