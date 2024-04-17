<template>
  <div class="beer-card">
    <h2>{{ beer.name }}</h2>

    <img :src="beer.imageUrl" class="card-img-top" alt="...">
    <p class="beer-details"><strong>Style:</strong> {{ beer.style }}</p>
    <p class="beer-details"><strong>ABV:</strong> {{ beer.abv }}%</p>
    <p class="beer-details"><strong>IBU:</strong> {{ beer.ibu }}</p>
    <p class="beer-description"><strong>Description:</strong> {{ beer.description }}</p>
    
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService';


export default {
  data() {
    return {
      
    }
  },
  props: 
    {
    beer: {
      type: Object,
      required: true
    },
    breweryName: {
      type: String,
      required: true
    },
    
  },
  methods: {
    
}
};

</script>

<style scoped>
.beer-card {
  border: 2px solid #ccc;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  /* Add a subtle box shadow */
  padding-top: 20px;
  margin-bottom: 20px;
  background-color: #fff;
  /* Light background color */
  text-align: center;
  width: 28%;
  max-height: max-content;
  margin-right: 14px;
}

.card-img-top {
  width: 80%;
  height: 50%;
  /* Limit image width */
  border-radius: 8px;
  /* Add rounded corners to the image */
  margin-bottom: 15px;
  
  /* Add some spacing below the image */
  
}

.beer-card h2 {
  font-family: "Cinzel";
}

.beer-details {
  margin-bottom: 5px;
  /* Add spacing between details */
  font-family: "Balthazar";  
}

.beer-description {
  margin-top: 10px;
  /* Add spacing above the description */
  font-family: "Balthazar";
}</style>
