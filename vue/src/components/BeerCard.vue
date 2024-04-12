<template>
  <div class="beer-card">
    <h2>{{ beer.name }}</h2>

    <img :src="beer.imageUrl" class="card-img-top" alt="...">
    <p class="beer-details"><strong>Style:</strong> {{ beer.style }}</p>
    <p class="beer-details"><strong>ABV:</strong> {{ beer.abv }}%</p>
    <p class="beer-details"><strong>IBU:</strong> {{ beer.ibu }}</p>
    <p class="beer-description"><strong>Description:</strong> {{ beer.description }}</p>
    <button @click="deleteBeer()">Delete</button>
  </div>
</template>

<script>
import BreweryService from '../services/BreweryService';
import axios from 'axios';

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
    // deleteBeer: {
    //   type: Function,
    //   required: true
    // }
  },
  methods: {
    deleteBeer() {
    
    console.log("In delete beer of beer card.vue: ", this.beer.beerId)
      BreweryService.deleteBeer( this.beer.beerId)
      .then(response => {
          if (response.status === 201 || response.status === 200) {
            this.$router.push({
              name: 'brewery-detail'
            });
          }
        })

        .catch(err => console.error(err));
     
        
  }
}
};

</script>

<style scoped>
.beer-card {
  border: 1px solid #ccc;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  /* Add a subtle box shadow */
  padding: 20px;
  margin-bottom: 20px;
  background-color: #fff;
  /* Light background color */
  text-align: center;

}

.card-img-top {
  width: 50%;
  height: 2%;
  /* Limit image width */
  border-radius: 8px;
  /* Add rounded corners to the image */
  margin-bottom: 15px;
  /* Add some spacing below the image */
}

.beer-details {
  margin-bottom: 5px;
  /* Add spacing between details */
}

.beer-description {
  margin-top: 10px;
  /* Add spacing above the description */
}</style>
