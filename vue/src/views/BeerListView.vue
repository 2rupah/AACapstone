<template>
  <div>
    

    <h2>
      
      <router-link :to="{ name: 'brewery' }" class="btn btn-primary mr-2">Back</router-link>
    </h2>
    
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
.btn {
  float: right;
  background-color: #0A1823;
}

h2 {
  text-align: center;
  margin: 10px;
}
</style>
