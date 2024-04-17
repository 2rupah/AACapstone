<template>
    <div>
      <select v-model="selectedBrewery" @change="handleChange">
        <option value="">Select a brewery:</option>
        <option v-for="brewery in breweries" :key="brewery.breweryId" :value="brewery.name">{{ brewery.name }}</option>
      </select>
    </div>
  </template>
  
  <script>
  import BreweryService from '../services/BreweryService';
  
  export default {
    data() {
      return {
        breweries: [],
        selectedBrewery: ''
      };
    },
    mounted() {
      this.fetchBreweries();
    },
    methods: {
      fetchBreweries() {
        BreweryService.listAllBreweries()
          .then(response => {
            this.breweries = response.data;
          })
          .catch(error => {
            console.error('Error fetching breweries:', error);
          });
      },
      handleChange() {
        this.$emit('brewery-selected', this.selectedBrewery);
      }
    }
  }
  </script>
  