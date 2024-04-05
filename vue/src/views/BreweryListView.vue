<template>
    <div>
      <BreweryList :breweries="breweries" />
    </div>
  </template>
  
  <script>
  import BreweryList from '@/components/BreweryList.vue';
  
  export default {
    components: {
      BreweryList
    },
    data() {
        
    return {

    };
  },

};
  </script>
  