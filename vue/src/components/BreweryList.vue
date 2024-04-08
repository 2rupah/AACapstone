<template>
  <section id="brewerylisting" class="row">
    <div v-for="brewery in breweries" :key="brewery.name" class="col-lg-6 mb-4">
      <BreweryCard :brewery="brewery" />
    </div>
  </section>
</template>

  
  <script>
  import BreweryCard from './BreweryCard.vue';
  
  
  export default {
    components: {
      BreweryCard,
     
    },
    data() {
        return {
            
        }
    },
    computed: {
      breweries(){
        return this.$store.state.breweryList
      }
    },
    created() {

        this.$store.dispatch('getAllBreweries')
    },
   
    
  }
</script>
  
<style scoped>
div.breweries {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
}
</style>
  