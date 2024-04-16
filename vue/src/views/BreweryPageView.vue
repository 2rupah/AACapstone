<template>
  <div>
    <h2 class="header">
      <router-link :to="{ name: 'brewery' }" class="back button">Back</router-link>
    </h2>
    <h1>{{ currentBrewery.name }}</h1>
    <div class="row">
      <div class="col-md-6">
        <div class="carousel-container">
          
          <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="https://media-cdn.tripadvisor.com/media/photo-s/1a/c6/a4/f8/front-area.jpg" class="d-block w-100 border-box" alt="...">
              </div>
              <div class="carousel-item">
                <img src="https://i.ytimg.com/vi/szglL4L4Zxw/maxresdefault.jpg" class="d-block w-100 border-box" alt="...">
              </div>
              <!-- Add more carousel items here -->
            </div>
            <button class="carousel-control-prev btn btn-primary btn-sm" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next btn btn-primary btn-sm" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="map-container">
          <iframe :src="currentBrewery.mapUrl" width="100%" height="100%" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
      </div>
    </div>
    <BeerList :beers="beerList" />
  </div>
</template>

<script>
import BeerList from '../components/BeerList.vue';
import BreweryService from '../services/BreweryService';

export default {
  components: {
    BeerList,
  },
  data() {
    return {
      beerList: [],
      currentBrewery: {},
    };
  },
  async created() {
    const breweryIdFromUrlParams = this.$route.params.id;
    try {
      // Fetch brewery info
      await this.fetchBreweryInfo(breweryIdFromUrlParams);
      // Fetch beer list
      await this.fetchBeerList(breweryIdFromUrlParams);
    } catch (err) {
      console.error(err);
    }
  },
  methods: {
    async fetchBreweryInfo(breweryId) {
      try {
        const response = await BreweryService.getBreweryInfo(breweryId);
        this.currentBrewery = response.data;
      } catch (err) {
        console.error(err);
        throw err; // Rethrow error to be caught by created() method
      }
    },
    async fetchBeerList(breweryId) {
      try {
        const response = await BreweryService.getBeersByBreweryId(breweryId);
        this.beerList = response.data;
      } catch (err) {
        console.error(err);
        throw err; // Rethrow error to be caught by created() method
      }
    },
  }
}
</script>

<style scoped>
.border {
  border: 2px solid #ccc; /* Adjust border color and thickness */
  border-radius: 10px; /* Adjust border radius */
  padding: 5px; /* Add padding for inner content */
}
.header {
  display: flex;
  justify-content: flex-end; /* Align the button to the right */
  margin-bottom: 20px; /* Add some margin for spacing */
}

.header .back.button {
  margin: 2px;
  padding: 8px 15px; /* Adjust padding to make the button smaller */
  background-color: #0A1823;
  color: white !important;
  border-radius: 6px;
  text-decoration: none;
  cursor: pointer; 
  font-size: 20px;
}

.header .back.button:hover {
  text-decoration: underline !important;
}
body {
  overflow-x: hidden;
}
#container {
  max-width: 100%;
  overflow-x: hidden;
}
.carousel-container {
  margin-bottom: 20px;
}
.map-container {
   /* Adjust the margin to move the map down */
  width: 100%;
  height: 450px;
  margin-bottom: 20px;
  padding: 5px; /* Add padding for inner content */
  color: white !important;
  
}
.map-container iframe {
  margin: 0; /* Remove default margin */
}
.back-button {
  text-align: center;
}
.carousel-item img {
  height: 400px;
  object-fit: cover;
}
.carousel-control-prev,
.carousel-control-next {
  width: 30px; /* Adjust button size */
  height: 30px; /* Adjust button size */
  border-radius: 50%;
  background-color: rgba(0, 0, 0, 0.5);
  margin-top: -15px; /* Adjust vertical alignment */
}
.btn {
  background-color: #0a1823;
}
iframe {
  width: 100%;
  height: 90%;
}
</style>
