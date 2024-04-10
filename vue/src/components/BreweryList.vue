<template>
  <section>
    <div id="banner">
      <h1>Brewery Results</h1>
      <P>Select a Brewery to find out more!</P>
    </div>
  </section>
  <section id="brewerylisting" class="row" >
    <div v-for="brewery in breweries" :key="brewery.name" class="col-lg-6 mb-4">
      <BreweryCard :brewery="brewery" />
    </div>
  </section>

</template>
<script>
import BreweryCard from './BreweryCard.vue';
export default {
  components: {
    BreweryCard,
  },
  data() {
    return {
    }
  },
  computed: {
    breweries() {
      return this.$store.state.breweryList
    }
  },
  created() {
    this.$store.dispatch('getAllBreweries')
  },
}
</script>
<style scoped>
div.breweries {
  display: grid;
  grid-template-columns: repeat(auto-fix, minmax(300px, 1fr));
  gap: 20px;
  justify-items: center;
}
#banner {
  text-align: center;
  padding-top: 15px;
}
</style>
  