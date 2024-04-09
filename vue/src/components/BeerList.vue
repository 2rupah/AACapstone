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
.beer-card-container {
  display: flex;
  flex-wrap: wrap; /* Allow beer cards to wrap to the next row */
  justify-content: space-between; /* Distribute beer cards evenly along the row */
}
</style>