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
  border: 5px solid #020101;
  padding: 10px;
  margin-bottom: 10px;
  
}

img {
  width: 500px;
}
</style>
