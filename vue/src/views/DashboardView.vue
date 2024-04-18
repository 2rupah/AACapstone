<template>
  <ul class="nav nav-tabs">
    <router-link to="/add" class="nav-item" tag="li"> 
      <a class="nav-link active" aria-current="update">Add a Beer</a>
    </router-link>
    <router-link to="/delete" class="nav-item" tag="li">
      <a class="nav-link">Delete a Beer</a>
    </router-link>
    <router-link to="/update" class="nav-item" tag="li">
      <a class="nav-link">Update Your Brewery</a>
    </router-link>
    <router-link to="/new" class="nav-item" tag="li">
      <a class="nav-link">Add New Brewery</a>
    </router-link>
  </ul>
  <AddBeer />
  <TheFooter />
</template>


<script>

import BreweryService from '../services/BreweryService';
import AddBeer from '../components/AddBeer.vue';
import TheFooter from '../components/TheFooter.vue';

export default {
  computed: {
  isPopUpVisible() {
    // Check if the current route is the home screen
    const currentRouteName = this.$route.name;
    if (currentRouteName === 'home') {
      return this.$store.state.isPopUpVisible;
    }
    return false; // Don't show pop-up on other routes
  }
},

  components: {
    AddBeer,
    TheFooter
  },
}
  

</script>