<template>
    <div class="brewery-list">
      <h1>Breweries</h1>
      <div v-if="breweries.length === 0">No breweries found</div>
      <div v-else>
        <brewery-card v-for="brewery in breweries" :key="brewery.name" :brewery="brewery" />
      </div>
    </div>
  </template>
  
  <script>
  import BreweryCard from './BreweryCard.vue';
  import BreweryService from '../services/BreweryService'
  
  export default {
    components: {
      BreweryCard
    },
    data() {
        return {
            breweries: []
        }
    },
    created() {
        const promise = BreweryService.listAllBreweries()
        .then(response => {
            this.breweries = response.data;
        })
        .catch(err => console.error(err));
        
    }
  }
  </script>
  
  <style scoped>
  .brewery-list {
    margin-top: 20px;
  }
  </style>
  