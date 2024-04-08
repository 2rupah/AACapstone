<template>
      <section id="brewerylisting"> 
        <BreweryCard v-for="brewery in breweries" 
        v-bind:key="brewery.name" v-bind:brewery="brewery" />
      </section>
  </template>
  
  <script>
  import BreweryCard from './BreweryCard.vue';
  import BreweryService from '../services/BreweryService'
  
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
        // const promise = BreweryService.listAllBreweries()
        // .then(response => {
        //     this.breweries = response.data;
        // })
        // .catch(err => console.error(err));
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
  