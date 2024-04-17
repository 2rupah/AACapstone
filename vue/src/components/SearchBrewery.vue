<template>
  <div>
    <input type="text" v-model="query" @input="performSearch">
    <ul>
      <li v-for="result in searchResults" :key="result.id" @click="selectBrewery(result)">
        {{ result.name }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      query: ''
    };
  },
  computed: {
    searchResults() {
      return this.$store.state.searchResults;
    }
  },
  methods: {
    performSearch() {
      this.$store.commit('SET_SEARCH_RESULTS', []);
      this.$store.dispatch('searchBreweries', this.query);
    },
    selectBrewery(result) {
      // Check if brewery object is defined
      if (result && result.breweryId) {
        // Navigate to the specific brewery page using Vue Router
        this.$router.push({ name: 'brewery-detail', params: { id: result.breweryId } });
      } else {
        console.error('Invalid brewery object:', result);
      }
    }
  }
};
</script>

  