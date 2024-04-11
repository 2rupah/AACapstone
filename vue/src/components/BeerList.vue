<template>
    <div>
      <section id="beerList">
        <BeerCard v-for="beer in beers" :key="beer.beerId" :beer="beer" />
      </section>
    </div>
  </template>
  <script>
  import BeerCard from './BeerCard.vue';

  export default {
    components: {
      BeerCard
    
    },
    props: {
      beers: {
        type: Array,
        required: true
      }
    }
  }
  </script>
  <style scoped>
  /* Add your styling here */
  </style>