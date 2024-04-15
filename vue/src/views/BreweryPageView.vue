<template>
  <h1>{{ currentBrewery.name }}</h1>

  <h2>
    <router-link :to="{ name: 'brewery' }" class="btn btn-primary mr-2">Back</router-link>
  </h2>
  <div> {{ currentBrewery.imageUrl }}</div>
  <BeerList :beers="beerList" />
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
      currentBrewery: {}
    };
  },
  async created() {
    const breweryIdFromUrlParams = this.$route.params.id;
    try {
      // Fetch brewery info
      await this.fetchBreweryInfo(breweryIdFromUrlParams);
      // Fetch beer list
      await this.fetchBeerList(breweryIdFromUrlParams);
    } catch (err) {
      console.error(err);
    }
  },
  methods: {
    async fetchBreweryInfo(breweryId) {
      try {
        const response = await BreweryService.getBreweryInfo(breweryId);
        this.currentBrewery = response.data;
      } catch (err) {
        console.error(err);
        throw err; // Rethrow error to be caught by created() method
      }
    },
    async fetchBeerList(breweryId) {
      try {
        const response = await BreweryService.getBeersByBreweryId(breweryId);
        this.beerList = response.data;
      } catch (err) {
        console.error(err);
        throw err; // Rethrow error to be caught by created() method
      }
    },
  }
}
</script>

<style scoped>
/* Add any necessary styles */
.btn {

  background-color: #0A1823;
  width: 8%;
  float: right;
}

h2 {
  text-align: center;
  margin: 10px;

}

/* div {
  display: flex;
  flex-wrap: wrap;
} */
</style>
