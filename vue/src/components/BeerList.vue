<template>
  <div id="mainPage">
    <section id="beerList">
      <BeerCard v-for="beer in beers" :key="beer.beerId" :beer="beer" :breweryName="breweryName"  />
    
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
      type: Object,
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

  padding-left: 3%;
  padding-right: 5%;
  width: 100vw;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  margin: 10px 10px 10px 10px;
 
}

#mainPage {
  background-image: url('../assets/Home.png');
}
</style>