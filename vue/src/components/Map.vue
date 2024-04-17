<template>
    <div id ="mapContainer" ref="mapContainer" class="map-container"></div>
    <div id="beerList">
        <BreweryList />
        <BreweryService />
    </div>
</template>

<script>
import { ref } from "vue";
import mapboxgl from "mapbox-gl";
import BreweryList from "./BreweryList.vue";
import BreweryService from "../services/BreweryService";
mapboxgl.accessToken = "pk.eyJ1IjoidWJ0cmlwcGluIiwiYSI6ImNsdjJ1bjdqOTBsbnUya3BpeWc4OTg0ajEifQ.iiITYP7zcsg0heegbLiHOQ"



export default {
    components: {
        BreweryList,
        BreweryService
    },
    mounted() {
        const mapDoc = document.getElementById("mapContainer")
        const map = new mapboxgl.Map({
            container: mapDoc,
            style: "mapbox://styles/mapbox/streets-v12",
            center: [-83.041780, 39.997750],
            zoom: 10,
            

        });
        
        // Create a new marker, set the longitude and latitude, and add it to the map.
        map.on('load', () => {
            map.resize();
        }),
        map.on( 'click', (e) => {
            const marker = new mapboxgl.Marker();
            marker.setLngLat(e.lngLat).addTo(map);
        });

        
    // },
    // methods: {
    //     // async fetchBreweryInfo(breweryId) {
    //     //     try {
    //     //         const response = await BreweryService.getBreweryInfo(breweryId);
    //     //         this.currentBrewery = response.data;
    //     //     } catch (err) {
    //     //         console.error(err);
    //     //         throw err; // Rethrow error to be caught by created() method
    //     //     }
    //     // },
    //     onMapClick(e) {
    //         const coordinates = e.lngLat//{lng:-83.041780, lat:39.997750};
    //         new mapboxgl.Marker()
    //             .setLngLat(coordinates)
    //             .addTo(this.map);
    //         console.log(e)
    //     },
    },



    unmounted() {
        this.map.remove();
        this.map = null;
    }
}
</script>

<style>
.map-container {
    width: 100vw;
    height: 100vh;
}
</style>
