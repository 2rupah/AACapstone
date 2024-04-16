<template>
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" aria-current="page" href="#">Add A Beer</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="delete">Delete A Beer</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="update">Update Your Brewery</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="new-brewery-page">Add New Brewery</a>
    </li>
  </ul>
  <AddBeer />

</template>

<script>

import BreweryService from '../services/BreweryService';
import AddBeer from '../components/AddBeer.vue';


export default {

  components: {
    AddBeer,

  },
  
  }

</script>