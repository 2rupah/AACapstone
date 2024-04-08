<template>
  <div class="brewery-card">
    <h2>{{ brewery.name }}</h2>
    <p><strong>Location:</strong> {{ brewery.location }}</p>
    <p><strong>Established Year:</strong> {{ brewery.established_year }}</p>
    <p><strong>Description:</strong> {{ brewery.description }}</p>
  </div>
</template>

<script>
export default {
  props: ['brewery']
}
</script>

<style scoped>
.brewery-card {
  border: 1px solid #2d2222;
  padding: 10px;
  margin-bottom: 10px;
}
</style>
