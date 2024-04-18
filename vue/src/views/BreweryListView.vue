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
    }
  }
};
</script>

<style scoped>
section {
  padding-left: 0%;
  justify-content: center;
  width: 100vw;
  /* Add background properties */
  background-color: #fffefe;
  background-image: url('https://i.pinimg.com/originals/b7/ae/b1/b7aeb12c4365b11620cb9b6b2b773018.jpg');
  /* Set background size and position */
  background-size: cover;
  background-position: center;
  /* Set height of section */
  height: 100vh; /* Adjust as needed */
  padding: 0;
  position: static;
}

/* Additional sections with different background images */
div.brewery-container {
  justify-content: center;
}
</style>
