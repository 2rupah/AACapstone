<template>
  <section id="brewerypage">

    <BreweryList />
    <TheFooter />
  </section>
</template>
  
<script>

import BreweryList from '../components/BreweryList.vue';
import TheFooter from '../components/TheFooter.vue'

export default {
  components: {
    BreweryList,
    TheFooter
  },

};
</script>

<style scoped>
section{
  padding-left: 0%;
  justify-content: center;
  width: 100vw;
}
div.brewery-container {
  justify-content: center;
}

</style>

  