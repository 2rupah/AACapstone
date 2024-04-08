<template>
    <div class="beer-card">
    <h2>{{ beer.name }}</h2>
    <p><strong>BreweryId:</strong> {{ brewery.id }}</p>
    <p><strong>Style:</strong> {{ beer.style }}</p>
    <p><strong>Abv:</strong> {{ beer.abv }}</p>
    <p><strong>Ibu:</strong> {{ beer.ibu }}</p>
    <p><strong>Description:</strong> {{ beer.description }}</p>
  </div>
</template>

<script>
export default {
  props: ['beers']
}

</script>

<style scoped>
.beer-card {
  border: 1px solid #1f1919;
  padding: 10px;
  margin-bottom: 10px;
}
</style>