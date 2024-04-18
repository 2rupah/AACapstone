<template>
    <div id="layout">
        <Map :breweryMarker="breweryMarker"/>
    </div>
    <div id="breweryList">
        
    </div>
    <MapBreweryList :brewery="brewery" @addBrewery="addBreweryToMap"/>
</template>

<script>
import Map from '../components/Map.vue';
import MapBreweryList from '../components/MapBreweryList.vue';
import BreweryService from '../services/BreweryService';
// import "/node_modules/mapbox-gl/dist/mapbox-gl.css"


export default {
    components: {
        Map,
        MapBreweryList
        
    },
    methods: {
        addBreweryToMap(breweryId) {
            BreweryService.getBreweryInfo(breweryId)
            .then(response => {
          this.breweryMarker = response.data;
          console.log(this.breweryMarker)
        })
        .catch(error => {
          console.error('Error fetching brewery information:', error);
        });
        }
    },
    data() {
        return {
            breweryMarker: {}
        }
    }
}

</script>

<style>
#layout {
    /* flex: 1;
    display: flex; */
    position: relative;
}

</style>