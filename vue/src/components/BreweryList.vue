<template>
  <section id="wholePage">
    <div id="banner">
      <h1>Brewery Results</h1>
      <p>Select a Brewery to find out more!</p>
    </div>
    <div class="brewery-container">
      <div class="brewery-item" v-for="brewery in breweries" :key="brewery.name">
        <BreweryCard :brewery="brewery" />
      </div>
    </div>
  </section>
</template>

<script>
import BreweryCard from './BreweryCard.vue';

export default {
  components: {
    BreweryCard
  },
  computed: {
    breweries() {
      return this.$store.state.breweryList;
    }
  },
  created() {
    this.$store.dispatch('getAllBreweries');
  },
}
</script>

<style scoped>
#banner {
  text-align: center;
  padding: 10px;
}

#wholePage {
  padding: 0; /* Remove padding to allow full width */
}

.brewery-container {
  display: flex;
  justify-content: center; /* Center the cards horizontally */
  flex-wrap: wrap;
}
</style>
