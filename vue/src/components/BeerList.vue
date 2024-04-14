<template>
  <div id="mainPage">
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

<style scoped>
div.mainPage {
  padding: 5%;
  display: inline-block;
}
section#beerList {
  padding: 5%;
  width: 100vw;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin: 10px 10px 10px 10px;
}
</style>