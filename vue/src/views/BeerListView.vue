<template>
  <div>
    
    <h2>List of Beers</h2>
    <BeerList :beers="beerList" />
    
  </div>
</template>
<!-- TODO : Display Brewery Name at the top of page -->
<script>
import BeerList from '../components/BeerList.vue';
import BreweryService from '../services/BreweryService';




export default {
  components: {
    BeerList,
    
    
  },
  data() {
    return {
      beerList: [],
      breweryName: ''
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
