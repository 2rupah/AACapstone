<template>
  <div class="beer-card">
    <h2>{{ beer.name }}</h2>
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
  padding: 10px;
  margin-bottom: 10px;
}
</style>
