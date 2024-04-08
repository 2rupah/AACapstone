<template>
    <BeerList />
    <div>
        
    </div>
</template>

<script>
import BeerList from '../components/BeerList.vue'
import BreweryService from '../services/BreweryService';

export default {
    components: {
      BeerList
    },
    data() {
        return {
            beer: {},
        }
    },
    created() {
        const breweryIdFromUrlParams = this.$route.params.id;
        BreweryService.getBeersByBreweryId(breweryIdFromUrlParams)
        .then(response => {
            this.beer = response.data;
            
        }).catch(err => console.error(err))
    }

    
};
</script>

<style scoped>

</style>