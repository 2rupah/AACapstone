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
        breweries: [
          {
            name: "Seventh Son Brewing Co.",
            location: "Columbus, Ohio",
            established_year: 2010,
            description: "Craft brewery featuring a range of beers, including IPAs & stouts, plus a patio & food trucks."
          },
          {
            name: "Land-Grant Brewing Company",
            location: "Columbus, Ohio",
            established_year: 2014,
            description: "Industrial-chic taproom & beer garden serving craft brews, plus occasional food trucks & events."
          }
          // Add more breweries here
        ]
      };
    }
  }
  </script>
  