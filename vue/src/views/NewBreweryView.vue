<template>
  <ul class="nav nav-tabs">
    <router-link to="/add" class="nav-item" tag="li">
    <a class="nav-link">Add a Beer</a>
    </router-link>
    <router-link to="/delete" class="nav-item" tag="li">
      <a class="nav-link">Delete a Beer</a>
    </router-link>
    <router-link to="/update" class="nav-item" tag="li">
      <a class="nav-link">Update Your Brewery</a>
    </router-link>
    <router-link to="/new" class="nav-item" tag="li">
      <a class="nav-link active" aria-current="new">Add New Brewery</a>
    </router-link>
  </ul>

    <div class="container">
    <h1>Add A New Brewery</h1>
    <!--think we've still gotta implement the functionality from the back end-->
    
    <form v-on:submit.prevent="addNewBrewery">
    <div class="brewery-form">
    <label for="brewery-name">Brewery Name: </label>
    <input v-model="newBrewery.name" type="text" id="name" name="brewery-name" class="new-brew-form" placeholder='Enter Brewery Name' >
    </div>

    <div class="brewery-form">
    <label for="location">Brewery Address: </label>
    <input v-model="newBrewery.location" type="text" id="location" name="location" class="new-brew-form" placeholder='Enter Brewery Address' >
    </div>


    <div class="brewery-form">
    <label for="year">Year of Establishment: </label>
    <input v-model="newBrewery.establishedYear" type="text" id="year" name="year" class="new-brew-form"  placeholder='Enter Year Established'>
    </div>

    <div class="brewery-form">
    <label for="description">Brewery Description: </label>
    <textarea v-model="newBrewery.description" type="text" id="description" name="description" class="new-brew-form" placeholder='Enter Brewery Description' ></textarea>
    </div>

    <div class="brewery-form">
    <label for="logo">Brewery Logo Url: </label>
    <input v-model="newBrewery.imageUrl" type="text" id="logo" name="logo" class="new-brew-form" placeholder='Enter Image URL'>
    </div>
    
    <button type="submit" class="btn btn-primary">Add Brewery</button>    
    </form>
    </div>
    <TheFooter />
</template>

<script>  
import BreweryService from '../services/BreweryService';
import TheFooter from '../components/TheFooter.vue';
export default {
    props: ['breweryId'],

    data() {
        return {
            newBrewery: {}
        };
    },

    methods: {
        addNewBrewery() {
    
        console.log("I'm working!!! It's me!! Here I am!!")
        BreweryService.addBrewery(this.newBrewery)
        .then(response => {
          if (response.status === 201 || response.status === 200) {
            this.$router.push({
              name: 'new'
            });
          }
          this.resetForm()
        })

        .catch(err => console.error(err));

        },

        resetForm(){
            this.newBrewery = {
                breweryId: null,
                name: '',
                location: '',
                establishedYear: null,
                description: '',
                imageUrl: '',
                mapUrl: '',
                longitude: '',
                latitude: '',
              };
    }
  },

  components: {
    TheFooter,
  },
};
</script>

<style>

.container {
    max-width: 600px;
    margin: 0 auto;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
    margin-top: 10px;
}

h1, label {
    text-align: center;
}

.brewery-form {
    width: 55%;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    font-weight: bold;
    font-family: "Balthazar";
}

input, textarea {
    width: 100%;
    padding: 5px;
    box-sizing: border-box;
    margin-bottom: 10px;
    
}

#button {
    width: 50%;
    margin-top: 10px;
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

.new-brew-form  {
    width: 100%;
    padding: 1px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
</style>