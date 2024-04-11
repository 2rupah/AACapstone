<template>
  <h1>Hi</h1>
  <AddBeer />
</template>

<script>
import BreweryService from '../services/BreweryService';
import AddBeer from '../components/AddBeer.vue';

export default {
    
  components: {
    AddBeer
  },


  methods: {
    deleteBeer(beerId) {
      const breweryIdFromUrlParams = this.$route.params.id;
      BreweryService.getBeersByBreweryId(breweryIdFromUrlParams)
        .then(response => {
          this.beerList = response.data;

        })

        .catch(err => console.error(err));

    }
  }
}
</script>