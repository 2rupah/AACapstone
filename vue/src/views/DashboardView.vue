<template>
  <h1>Hi</h1>
</template>

<script>
import BreweryService from '../services/BreweryService';

export default {
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