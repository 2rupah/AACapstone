<template>
  <div class="beer-card">
    <h2>{{ beer.name }}</h2>
    <img :src="beer.imageUrl" class="card-img-top" alt="...">
    <p><strong>Style:</strong> {{ beer.style }}</p>
    <p><strong>ABV:</strong> {{ beer.abv }}%</p>
    <p><strong>IBU:</strong> {{ beer.ibu }}</p>
    <p><strong>Description:</strong> {{ beer.description }}</p>
  </div>

</template>

<script>
export default {
  props: {
    beer: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped>
.beer-card {
  border: 1px solid #ccc;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add a subtle box shadow */
  padding: 20px;
  margin-bottom: 20px;
  background-color: #fff; /* Light background color */
  text-align: center;
  
}

img {
  width: 500px;
}

</style>
