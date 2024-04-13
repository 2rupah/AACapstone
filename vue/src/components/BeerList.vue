<template>
  <div>
    <section id="beerList">
      <BeerCard v-for="beer in beers" :key="beer.beerId" :beer="beer" :breweryName="breweryName" />
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
    },
    breweryName: {
      type: String,
      required: true
    },



  }
};
</script>

<style scoped></style>