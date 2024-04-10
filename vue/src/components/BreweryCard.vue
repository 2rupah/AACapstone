<template>
  <div class="brewery-card" @click="isFlipped = !isFlipped" :class="{ 'flipped': isFlipped }">
    <div class="front">
      <div class="card" style="width: 28rem;">
        <img :src="brewery.imageUrl" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 id="name" class="card-title">{{ brewery.name }}</h5>
        </div>
      </div>
    </div>
    <div class="back">
      <div class="card" style="width: 28rem;">
        <div class="card-body">
          <h5 class="card-title"><strong>Location: </strong>{{ brewery.location }}</h5>
          <p class="card-text">{{ brewery.description }}</p>
          <router-link :to="{ name: 'brewery-detail', params: { id: brewery.breweryId } }" id="button" class="btn btn-primary mr-2">See Our Beers!</router-link>
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
<<<<<<< HEAD
=======
  
>>>>>>> f31e91324e8312daf72aedce6f01200cf4066dcb
  padding: 10px;
  margin-bottom: 10px;
  margin-left: 10px;
  position: relative;
  perspective: 1000px;
  width: 300px;
  height: 200px;
  box-sizing: content-box;
  
}

#name {
  text-align: center;
}
#name {
  text-align: center;
}
#button {
  background-color: #0A1823;
  border: #0A1823;
  color: #C4AD85;
  font-weight: bold;
}
img {
  /* width: 150px; */
  align-self: center;
  height: 125px;
  width: 140px;
}
img:hover {
  transform: scale(1.2); /* Scale the image on hover */
  cursor: pointer;
}
.front,
.back {
  /* width: 100%;
  height: 100%; */
  position: absolute;
  transition: transform 0.6s;
  backface-visibility: hidden;
  margin: 5px;
}
.front {
  z-index: 2;
}
.back {
  transform: rotateY(180deg);
}
.flipped .front {
  transform: rotateY(180deg);
}
.flipped .back {
  transform: rotateY(0deg);
}
</style>