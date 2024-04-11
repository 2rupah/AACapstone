<template>
  <section>
    <div id="banner">
      <h1>Brewery Results</h1>
      <P>Select a Brewery to find out more!</P>
    </div>
  </section>
  <section id="brewerylisting" class="row" >
    <!-- class="col-lg-6 mb-4" -->
    <div class="col-md-4" v-for="brewery in breweries" :key="brewery.name" >
      <BreweryCard :brewery="brewery" />
      
    </div>
  </section>
</template>
<script>
import BreweryCard from './BreweryCard.vue';

export default {
  components: {
    BreweryCard
    
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
@import url('https://fonts.googleapis.com/css2?family=Balthazar&family=Cinzel:wght@400..900&display=swap');
/* #brewerylisting {
  display: flex;
  grid-template-columns: repeat(auto-fix, minmax(300px, 1fr));
  gap: 10px;
  justify-items: center;
} */
#banner {
  text-align: center;
  padding-top: 15px;
  font-family: Balthazar;
}

#brewerylisting {
  background-image: url('../assets/Home.png');
}

/* div.col-md-4 {
  width: 300px;
  height: 300px;
  border: 1px solid black;
  border-radius: 10px;
  padding: 10px;
  margin: 10px;
  background-color: white;
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
  transition: all 0.3s ease-in-out;
  cursor: pointer;} */
</style>






