<template>
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link" href="add">Add A Beer</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" aria-current="delete">Delete A Beer</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="update">Update Your Brewery</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="new-brewery-page">Add New Brewery</a>
    </li>
  </ul>

  <div class="container">
    <h1>Delete A Beer</h1>
    
    <div class="form-group">
      <label for="brewerySelect">Select Brewery:</label>

      <select @change="getBreweryInfo" v-model="selectedBreweryId" class="form-control">
        <option value="">Select a brewery</option>
        <option v-for="brewery in breweries" :key="brewery.breweryId" :value="brewery.breweryId">{{ brewery.name }}
        </option>
      </select>

      <label v-show="beerListAvailable" for="beerSelect">Select A Beer To Delete:</label>

      <select v-show="beerListAvailable" @change="getBeerInfo" v-model="selectedBeerId"  >
        <option v-for="beer in beerList" :key="beer.beerId" :value="beer.beerId">{{ beer.name }}
        </option>
      </select>
      <button v-show="beerListAvailable" id="delete" @click="deleteBeer(selectedBeerId)" >Delete</button>
    </div>



  </div>
</template>
  
<script>

import BreweryService from '../services/BreweryService.js';


export default {


  data() {
    return {
      breweries: [],
      selectedBreweryId: null,
      beerList: [],
      beerListAvailable: false,
      beerSelected: false,
      beer: {},
      selectedBeerId: null,

    };

  },
  components: {

  },
  mounted() {

    this.fetchBreweries();
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

    getBreweryInfo() {
      if (this.selectedBreweryId) {
        BreweryService.getBeersByBreweryId(this.selectedBreweryId)
          .then(response => {
            this.beerList = response.data;
            this.beerListAvailable = true;
          })
          .catch(error => {
            console.error('Error fetching brewery beers:', error);
          });
      }
    },

    deleteBeer() {

      console.log("In delete beer of beer card.vue: ", this.selectedBeerId)
      BreweryService.deleteBeer(this.selectedBeerId)
        .then(response => {
          if (response.status === 201 || response.status === 200) {
            this.$router.push({
              name: 'brewery-detail'
            });
          }
          this.resetForm();
        })

        .catch(err => console.error(err));

    },
    getBeerInfo(){
    BreweryService.getBeerById(this.selectedBeerId)
    .then(response => {
            this.beer = response.data;
            this.beerListAvailable = true;
          })
          .catch(error => {
            console.error('Error fetching brewery beers:', error);
          });
        },

    resetForm() {
      location.reload();
    }

  }
}
</script>

<style>
h1 {
  text-align: center;
}
select {
  
    width: 100%;
    padding-top: 6px;
    padding-bottom: 6px;
    padding-left: 12px;
    padding-right: 12px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 10px;

}
.form-label {
    font-weight: bold;
}

label {
  padding-top: 10px;
}

#delete {
  padding: 8px 15px;
    background-color: #0A1823;
    color:white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
    margin-top: 10px;
}
</style>