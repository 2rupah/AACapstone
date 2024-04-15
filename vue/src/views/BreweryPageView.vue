<template>
  
    <h2>
      <router-link :to="{ name: 'brewery' }" class="btn btn-primary mr-2">Back</router-link>
    </h2>
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

  },
  methods: {
    getBreweryById() {
      BreweryService.getBreweryInfo
    }
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
