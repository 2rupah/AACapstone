<template>
  <div class=brewery-card @click="isFlipped = !isFlipped" :class="{ 'flipped': isFlipped }">
    
    <div class="front">
      <!-- <h2>{{ brewery.name }}</h2>
      <img :src="brewery.imageUrl" alt="image"> -->

      <div class="card" style="width: 18rem;">
        <img :src="brewery.imageUrl" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">{{ brewery.name }}</h5>
        </div>
      </div>
    </div>
    


    <div class="back">
      <!-- <p><strong>Description:</strong> {{ brewery.description }}</p>
      <p><strong>Location:</strong> {{ brewery.location }}</p>
      <p><strong>Established Year:</strong> {{ brewery.establishedYear }}</p> -->

      <div class="card" style="width: 18rem;">
        <div class="card-body">
          <h5 class="card-title"><strong>Location: </strong>{{ brewery.location }}</h5>
          <p class="card-text">{{ brewery.description }}</p>

          <router-link v-bind:to="{ name: 'home' }" class="btn btn-primary mr-2">See Our Beers!</router-link>
        </div>
        </div>
      </div>
    </div>
  
</template>

<script>
export default {
  props: {
    brewery: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      isFlipped: false
    };
  }
}
</script>

<style scoped>
.brewery-card {
  border: 1px solid #ffffff;
  padding: 10px;
  margin-bottom: 10px;
  position: relative;
  perspective: 1000px;
  width: 300px;
  /* Set the width of the card */
  height: 200px;
  /* Set the height of the card */
}

img {
  width: 150px;
  align-self: center;
}

.front,
.back {
  width: 100%;
  height: 100%;
  position: absolute;
  transition: transform 0.6s;
  backface-visibility: hidden;
  /* Hide the back face of the card */
  margin: 5px;
}

.front {
  z-index: 2;
  /* Ensure the front is on top */
}

.back {
  transform: rotateY(180deg);
  /* Initially hide the back face */
}

.flipped .front {
  transform: rotateY(180deg);
}

.flipped .back {
  transform: rotateY(0deg);
}

/* .front img {
  max-width: 100%;
  max-height: 100%
} */
</style>
