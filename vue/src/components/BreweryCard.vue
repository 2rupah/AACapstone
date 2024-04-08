<template>
  <div class="brewery-card" @click="isFlipped = !isFlipped" :class="{ 'flipped': isFlipped }">
    <div class="front">
      <h2>{{ brewery.name }}</h2>
      <img :src="brewery.imageUrl" alt="image">
    </div>
    <!-- <div class="front" style="width: 18rem;">
      <img :src="brewery.imageUrl" class="card-img-top" alt="image">
    </div> -->

    <div class="back">
      <p><strong>Description:</strong> {{ brewery.description }}</p>
      <p><strong>Location:</strong> {{ brewery.location }}</p>
      <p><strong>Established Year:</strong> {{ brewery.establishedYear }}</p>
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
  width: 300px; /* Set the width of the card */
  height: 200px; /* Set the height of the card */
}

.front, .back {
  width: 100%;
  height: 100%;
  position: absolute;
  transition: transform 0.6s;
  backface-visibility: hidden; /* Hide the back face of the card */
  margin: 5px;
}

.front {
  z-index: 2; /* Ensure the front is on top */
}

.back {
  transform: rotateY(180deg); /* Initially hide the back face */
}

.flipped .front {
  transform: rotateY(180deg);
}

.flipped .back {
  transform: rotateY(0deg);
}
.front img {
width: 100%;

}
</style>
