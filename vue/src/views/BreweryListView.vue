<template>
  <div class="page-container">
    
    <section id="brewerypage">
      <button class="other">
      <router-link :to="{ name: 'map' }" class="back button">Brewery Crawl</router-link></button>
      <button>
      <router-link :to="{ name: 'roulette' }" class="back button">Brewery Roulette</router-link></button>
      
      <!-- Pass searchResults as a prop to BreweryList -->
      <BreweryList :searchResults="searchResults" />
    </section>
    <section id="brewerypage-bottom">
      <!-- Add the same background image here -->
    </section>
    <TheFooter />
  </div>
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
  },
  mounted() {
    // Add event listener for scroll
    window.addEventListener('scroll', this.handleScroll);
  },
  unmounted() {
    // Remove event listener when component is destroyed
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    handleScroll() {
      // Get scroll position
      const scrollPosition = window.scrollY;

      // Set background position for parallax effect
      document.getElementById('brewerypage').style.backgroundPositionY = -scrollPosition * 0.5 + 'px';
      document.getElementById('brewerypage-bottom').style.backgroundPositionY = -scrollPosition * 0.5 + 'px';
    }
  }
};
</script>

<style scoped>
button {
    color: white !important;
    margin: 5px;
    padding: 13px 25px;
    background-color: #0A1823;
    border-radius: 6px;
    text-decoration: none;
    cursor: pointer; 
    font-family: 'Cinzel';
    float:right;
  
}
.page-container {
  min-height: 100vh;
  overflow-x: hidden;
}

#brewerypage, #brewerypage-bottom {
  width: 100vw;
  background-color: #fffefe;
  /* background-image: url('https://i.pinimg.com/originals/b7/ae/b1/b7aeb12c4365b11620cb9b6b2b773018.jpg'); */
  background-image: url('../assets/Home.png');
  background-size: cover;
  background-position: center;
  height: calc(140vh - 10px); /* Adjust as needed, subtracting the footer height */
  padding: 0;
  position: static;
  background-attachment: fixed; /* Make the background image fixed */
}
#brewerypage-bottom {
  height: 200vh; /* Adjust the height to repeat the image as needed */
}

/* Additional sections with different background images */
div.brewery-container {
  justify-content: center;
}

</style>
