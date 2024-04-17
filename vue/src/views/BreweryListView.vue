<template>
  <section id="brewerypage">
    <!-- Pass searchResults as a prop to BreweryList -->
    <BreweryList :searchResults="searchResults" />
    <TheFooter />
  </section>
</template>
  
<script>
import BreweryList from '../components/BreweryList.vue';
import TheFooter from '../components/TheFooter.vue';

export default {
  components: {
    BreweryList,
    TheFooter
  },
  data() {
    return {
      searchResults: [] // Initialize searchResults as an empty array
    };
  }
};
</script>

<style scoped>
section {
  padding-left: 0%;
  justify-content: center;
  width: 100vw;
}
div.brewery-container {
  justify-content: center;
}
</style>
