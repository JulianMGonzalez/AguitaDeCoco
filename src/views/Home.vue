<template>
  <div class="home">
    <products-list></products-list>
  </div>
</template>

<script>
import ProductsList from '../components/ProductsList.vue'
// @ is an alias to /src

export default {
  name: 'Home',
  components: {
    ProductsList
  }
}
</script>

    ProductsList