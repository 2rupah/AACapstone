<template>
  <div>
    <h1>List of Beers</h1>
    <BeerList :beers="beerList" />
  </div>
</template>

<script>
import BeerList from '../components/BeerList.vue';
import BreweryService from '../services/BreweryService';

export default {
  components: {
    BeerList
  },
  data() {
    return {
      beerList: []
    };
  },
  created() {
    const breweryIdFromUrlParams = this.$route.params.id;
    BreweryService.getBeersByBreweryId(breweryIdFromUrlParams)
      .then(response => {
        this.beerList = response.data;
      })
      .catch(err => console.error(err));
  }
};
</script>

<style scoped>
/* Add any necessary styles */
</style>
