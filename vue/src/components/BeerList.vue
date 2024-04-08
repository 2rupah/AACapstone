<template>
    <h1>List of Beers</h1>
    <section id="beerList">
    <BeerCard v-for="beer in beerList"
    v-bind:key="beer.name" v-bind:beer="beer"/>
    </section>
</template>

<script>
import BreweryService from '../services/BreweryService'
import BeerCard from './BeerCard.vue'


export default {
    components: {
        BeerCard,
    },

    data() {
        return {
            
        }
    },
    computed: {
      beerList(){
        return this.$store.state.beerList
      }
    },
    created() {
        
        this.$store.dispatch('getBeersByBreweryId')
    },

}
</script>



<style scoped>

</style>