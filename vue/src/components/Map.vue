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
            zoom: 10,


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
.map-container {
    width: 70vw;
    height: 70vh;
    justify-self: center;
}
.mapboxgl-popup {
    max-width: 200px;
}
</style>
