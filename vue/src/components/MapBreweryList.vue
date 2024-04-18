<template>
    <div id="wholePage">
        <div id="banner">
            
            <h4>Select a Brewery to add it to the Crawl!</h4>
        </div>
        <div class="brewery-container">
            <div class="brewery-item" v-for="brewery in breweries" :key="brewery.id">
                <MapBreweryCard :brewery="brewery" :hasBeenAddedToMap="hasBeenAddedToMap" @click="addBreweryToMap(brewery)" />

            </div>
        </div>
    </div>
</template>
  
<script>
import MapBreweryCard from './MapBreweryCard.vue';

export default {

    data() {
        return {
            hasBeenAddedToMap: false
        }
    },
    components: {
        MapBreweryCard
    },
    computed: {
        breweries() {
            return this.$store.state.breweryList;
        }
    },
    created() {
        this.$store.dispatch('getAllBreweries');
    },
    methods: {
        addBreweryToMap(brewery) {
            this.hasBeenAddedToMap = true
            this.$emit('addBrewery', brewery.breweryId)
            
        }
    }
}
</script>
  
<style scoped>
#banner {
    text-align: center;
    padding: 10px;
    /* Adjust the padding as needed */
}

#wholePage {
    padding: 0;
    /* Remove padding to allow full width */
}

.brewery-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    /* Evenly distribute items with equal space around them */
    /* max-width: 100vw; */
    /* Set a max width to limit the container's width */
    max-width: 100vw;
    margin: 0 auto;
    /* Center the container horizontally */
}

.brewery-item {
    flex: 0 1 calc(12.59% - 20px);
    /* Adjust the width of each card (in this case, 33.33% width for three cards per row) */
    margin: 10px;
    max-width: calc(12.5% - 20px);
    /* Adjust margin as needed */
}
h4 {
    font-family: 'Balthazar';
    text-decoration: underline;
}
</style>