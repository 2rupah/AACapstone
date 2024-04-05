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
  
  export default {
    components: {
      BreweryCard
    },
    props: {
      breweries: {
        type: Array,
        required: true
      }
    }
  }
  </script>
  
  <style scoped>
  .brewery-list {
    margin-top: 20px;
  }
  </style>
  