<template>
  <div class="container">
  <div class="row">

    <div id="one" class="col">
      <h2>{{ beer.name }}</h2>
      <img :src="beer.imageUrl" class="card-img-top" alt="...">
      <p class="beer-details"><strong>Style:</strong> {{ beer.style }}</p>
      <p class="beer-details"><strong>ABV:</strong> {{ beer.abv }}%</p>
      <p class="beer-details"><strong>IBU:</strong> {{ beer.ibu }}</p>
      <p class="beer-description"><strong>Description:</strong> {{ beer.description }}</p>
      
    </div>

    <div class="col">
      <div v-for="review in beer.listOfReviews" :key="review.reviewId">
      
      <img src="../assets/beer.png" v-bind:title="review.rating + ' Star Review'" class="rating-star"
        v-for="n in review.rating" v-bind:key="n" />
        <p><strong>{{ review.reviewer }}:</strong></p>
        <p>{{ review.review }}</p>
      </div>
  </div>

  </div>
  </div>

  <!-- <div class="card" style="width: 18rem;" >
      <ul class="list-group list-group-flush" v-for="review in beer.listOfReviews" :key="review.reviewId">
      <li>{{ review.reviewer }} says: {{ review.review }}</li>
      <img
        src="../assets/star.png"
        v-bind:title="review.rating + ' Star Review'" class="rating-star"
        v-for="n in review.rating" v-bind:key="n"/>
      </ul>
    </div> -->
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
    }
  },

  
};

</script>

<style scoped>
/* .beer-card {
  border: 2px solid #ccc;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
  /* Add a subtle box shadow */
  /* padding-top: 20px;
  margin-bottom: 20px;
  background-color: #fff; */
  /* Light background color */
  /* text-align: center;
  width: 28%;
  max-height: max-content;
  margin-right: 14px;
} */



.card-img-top {
  width: 40%;
  height: 50%;
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
}

.container {
    max-width: 100%;
    padding: 5px;
}

.rating-star {
  width: 10%;
  padding-bottom: 5px;
}
</style>
