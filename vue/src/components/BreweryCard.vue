<template>
  
  <div class="brewery-card" @click="isFlipped = !isFlipped">
    <div class="card" :class="{ 'flipped': isFlipped }">
      <div class="front">
        <div class="card-image">
          <img :src="brewery.imageUrl" class="card-img-top" alt="Brewery Image">
        </div>
        <div class="card-details">
          <h3 class="card-title">{{ brewery.name }}</h3>
        </div>
      </div>
      <div class="back">
        <div class="card-details">
          <h3 class="card-title">{{ brewery.name }}</h3>
          <p class="card-text"><strong>Location:</strong> {{ brewery.location }}</p>
          <p class="card-text"><strong>Description:</strong> {{ brewery.description }}</p>
          <router-link :to="{ name: 'brewery-detail', params: { id: brewery.breweryId } }" class="btn">See Brewery!</router-link>
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
  border: 2px solid black;
  border-radius: 10px;
  width: 100%;
  height: 450px;
  margin: 10px;
  cursor: pointer;
  perspective: 1000px;
}

.card {
  width: 100%;
  height: 100%;
  position: relative;
  transform-style: preserve-3d;
  transition: transform 0.6s;
  border-radius: 10px;
}

.back {
  width: 100%;
  height: 100%;
  position: absolute;
  backface-visibility: hidden;
}

.front {
  background-color: #f8f9fa;
  transform: rotateY(0deg);
}

.back {
  background-color: #ffffff;
  transform: rotateY(180deg);
  display: none;
}

.flipped .front {
  transform: rotateY(-180deg);
  transition-delay: 0.3s; /* slight delay for a smoother effect */
}

.flipped .back {
  transform: rotateY(0deg);
  display: block;
  transition-delay: 0s; /* no delay for the back side */
}

.card-image {
  width: 100%; /* Set the width to 100% to fill the container */
  height: 70%; /* Adjust the height as needed */
  overflow: hidden;
  display: flex; /* Use flexbox for centering */
  justify-content: center; /* Center the image horizontally */
  align-items: center; /* Center the image vertically */
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}
.card-image img {
  max-width: 80%; /* Ensure the image doesn't exceed the container width */
  max-height: 100%; /* Ensure the image doesn't exceed the container height */
  object-fit: cover; /* Maintain aspect ratio and cover the container */
}

.card-details {
  padding: 20px;
  text-align: center; /* Center the content horizontally */
  font-family: "Balthazar"
}


.btn {
  padding: 8px 16px;
  background-color: #0A1823;
  color: #ffffff;
  text-decoration: none;
  border-radius: 5px;
  transition: background-color 0.3s;
  position: center;
}

.btn:hover {
  background-color: #192c46;
}


</style>
