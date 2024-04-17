<template>
    <div id ="mapContainer" ref="mapContainer" class="map-container"></div>
    <div id="beerList">
        
        <BreweryService />
        <MapBreweryList />
    </div>
</template>

<script>
import { ref } from "vue";
import mapboxgl from "mapbox-gl";
import MapBreweryList from "./MapBreweryList.vue";
import BreweryService from "../services/BreweryService";
mapboxgl.accessToken = "pk.eyJ1IjoidWJ0cmlwcGluIiwiYSI6ImNsdjJ1bjdqOTBsbnUya3BpeWc4OTg0ajEifQ.iiITYP7zcsg0heegbLiHOQ"



export default {
    components: {
        MapBreweryList,
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
        
        
        map.on('load', () => {
            map.resize();
        }),
        map.on( 'click', (e) => {
            const marker = new mapboxgl.Marker();
            marker.setLngLat(e.lngLat).addTo(map);
        });

        
    
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
