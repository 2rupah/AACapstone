<template>
    <div>
      <h1>Search Results</h1>
      <div v-if="searchResults.length > 0">
        <!-- <ul>
          <li v-for="(result, index) in searchResults" :key="index"> -->
            <BreweryList v-bind:searchResults="searchResults"/>
            <!-- <router-link :to="{ name: 'brewery-detail', params: { id: result.breweryId } }">{{ result.name }}</router-link> -->
          <!-- </li>
        </ul> -->
      </div>
      <div v-else>
        <p>No results found</p>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import BreweryCard from '../components/BreweryCard.vue';
  import BreweryList from '../components/BreweryList.vue';
  
  export default {
    components: {
      BreweryList,
    },

    data() {
      return {
        searchResults: [],
      };
    },

    computed: {

      query() {
        return this.$route.params.query;
      }
    },

    methods: {
      fetchSearchResults() {

        axios.get(`/api/search/breweries?searchTerm=${this.query}`)
          .then(response => {
            console.log('Response data:', response.data); 
            this.searchResults = response.data;
          })
          .catch(error => {
            console.error(error);
          });
      },
      navigateToBreweryDetail(breweryId) {
      // Navigate to the specific brewery page using Vue Router
      this.$router.push({ name: 'brewery-detail', params: { id: breweryId } });
    },
    },
    mounted() {
      this.fetchSearchResults();
    },
  };
  </script>

  <style scoped>
    h1 {
      padding-bottom: 25px;
    }
    #banner {
      margin: 0 !important;
    }
  </style>
  