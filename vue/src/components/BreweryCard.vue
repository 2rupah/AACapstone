<template>
  <div class="brewery-card">
    <h2>{{ brewery.name }}</h2>
    <p><strong>Location:</strong> {{ brewery.location }}</p>
    <p><strong>Established Year:</strong> {{ brewery.establishedYear }}</p>
    <p><strong>Description:</strong> {{ brewery.description }}</p>
  </div>
</template>

<script>
export default {
  props: {
    brewery: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped>
.brewery-card {
  border: 1px solid #ffffff;
  padding: 10px;
  margin-bottom: 10px;
}
</style>
