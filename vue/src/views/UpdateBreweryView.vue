<template>
  <ul class="nav nav-tabs">
    <router-link to="/add" class="nav-item" tag="li">
      <a class="nav-link">Add a Beer</a>
    </router-link>
    <router-link to="/delete" class="nav-item" tag="li">
      <a class="nav-link">Delete a Beer</a>
    </router-link>
    <router-link to="/update" class="nav-item" tag="li">
      <a class="nav-link active" aria-current="update">Update Your Brewery</a>
    </router-link>
    <router-link to="/new" class="nav-item" tag="li">
      <a class="nav-link">Add New Brewery</a>
    </router-link>
  </ul>
    <div class="container">
        <h1>Update Brewery Information</h1>

        <div class="form-group">
            
            <select v-model="brewery.breweryId" @change="fetchBreweryInfo" id="brewerySelect" class="form-control">
                <option value="">Select a brewery:</option>
                <option v-for="brewery in breweries" :key="brewery.breweryId" :value="brewery.breweryId">{{ brewery.name }}
                </option>
            </select>
        </div>


        <form @submit.prevent="updateBrewery">

            <div class="form-group">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" v-model="brewery.name">
            </div>
            <div class="form-group">
                <label for="location" class="form-label">Location:</label>
                <input type="text" class="form-control" id="location" v-model="brewery.location">
            </div>
            <div class="form-group">
                <label for="establishedYear" class="form-label">Established Year:</label>
                <input type="number" class="form-control" id="establishedYear" v-model="brewery.establishedYear">
            </div>
            <div class="form-group">
                <label for="description" class="form-label">Description:</label>
                <textarea class="form-control" id="description" v-model="brewery.description"></textarea>
            </div>
            <div class="form-group">
                <label for="imageUrl" class="form-label">Image URL:</label>
                <input type="url" class="form-control" id="imageUrl" v-model="brewery.imageUrl">
            </div>
            <div class="form-group">
                <label for="imageUrl" class="form-label">Image URL:</label>
                <input type="url" class="form-control" id="mapUrl" v-model="brewery.mapUrl">
            </div>
            <button type="submit" class="btn btn-primary">Update Brewery</button>
        </form>
    </div>
</template>
  
<script>

import BreweryService from '../services/BreweryService';

export default {

    data() {
        return {
            breweries: [],

            brewery: {
                breweryId: '',
                name: '',
                location: '',
                establishedYear: '',
                description: '',
                imageUrl: '',
                mapUrl: '',
            },

        };
    },
    mounted() {

        this.fetchBreweries();
    },
    computed: {
  isPopUpVisible() {
    // Check if the current route is the home screen
    const currentRouteName = this.$route.name;
    if (currentRouteName === 'home') {
      return this.$store.state.isPopUpVisible;
    }
    return false; // Don't show pop-up on other routes
    }
    },

    methods: {
        fetchBreweries() {

            BreweryService.listAllBreweries()
                .then(response => {
                    this.breweries = response.data;
                })
                .catch(error => {
                    console.error('Error fetching breweries:', error);
                });
        },
        fetchBreweryInfo() {

            BreweryService.getBreweryInfo(this.brewery.breweryId)
                .then(response => {
                    this.brewery = response.data;
                })
                .catch(error => {
                    console.error('Error fetching brewery information:', error);
                });
        },

        updateBrewery() {
            // Create an object to hold the updated fields
            console.log("Reached Update Brewery in update Brewery view: ", this.breweryId)

            BreweryService.updateBrewery(this.brewery)
                .then(response => {
                    console.log('Brewery updated successfully:', response.data);
                })
                .catch(error => {
                    console.error('Error updating brewery:', error);
                });
        }

    }
}
</script>
  
<style scoped>
.container {
    /* max-width: 600px; */
    margin: 0 auto;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.form-group {
    margin-bottom: 20px;
}

#brewerySelect {
    width: 100%;
}

.form-label {
    font-weight: bold;
}

.form-control {
    width: 100%;
    padding: 1px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.btn-primary {
    display: block;
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}

.btn-primary:hover {
    background-color: #0056b3;
}
</style>
  