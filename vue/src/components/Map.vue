<template>
    <div id="mapContainer" ref="mapContainer" class="map-container"></div>

</template>

<script>
import { watch } from "vue";
import mapboxgl from "mapbox-gl";



mapboxgl.accessToken = "pk.eyJ1IjoidWJ0cmlwcGluIiwiYSI6ImNsdjJ1bjdqOTBsbnUya3BpeWc4OTg0ajEifQ.iiITYP7zcsg0heegbLiHOQ"



export default {
    props: {
        breweryMarker: {}
    },
    
    mounted() {
        const mapDoc = document.getElementById("mapContainer")
        const map = new mapboxgl.Map({
            container: mapDoc,
            style: "mapbox://styles/mapbox/streets-v12",
            center: [-83.041780, 39.997750],
            zoom: 9,


        });

        this.map = map;
        map.on('load', () => {
            map.resize();
        }),
            map.on('click', (e) => {
                const marker = new mapboxgl.Marker();
                marker.setLngLat(e.lngLat).addTo(map);
            });
        

    },



    unmounted() {
        this.map.remove();
        this.map = null;
    },

    watch: {
        breweryMarker(props) {
            this.placeBreweryMarker(props)
        }
    },
    methods: {
        placeBreweryMarker(props){
            
            const marker = new mapboxgl.Marker({})
                .setLngLat([props.longitude, props.latitude])
                .setPopup(
                    new mapboxgl.Popup({offset: 25})
                    .setHTML(`<h4>${props.name}</h4>`)
                )
                .addTo(this.map)
                
        }
    }
}
</script>

<style>
div#layout {
    justify-self:center;
}
.map-container {
  width: 40vw; /* Adjust the width to take up half of the viewport */
  height: 60vh; /* Adjust the height to take up the entire viewport */
  margin: 0 auto; /* Center the map horizontally */
}
map#container{
    width: 100vw;
}
.mapboxgl-popup {
    max-width: 200px;
}
.brewery-item{
    width: 50px;
}


</style>
