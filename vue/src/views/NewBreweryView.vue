<template>
    <div class="container">
    <h1>Add A New Brewery</h1>
    <!--think we've still gotta implement the functionality from the back end-->
    
    <form v-on:submit.prevent="addNewBrewery">
    <div class="brewery-form">
    <label for="brewery-name">Brewery Name: </label>
    <input type="text" id="name" name="brewery-name" class="new-brew-form" placeholder='Enter Brewery Name'>
    </div>

    <div class="brewery-form">
    <label for="description">Brewery Description: </label>
    <textarea type="text" id="description" name="description" class="new-brew-form" placeholder='Enter Brewery Description'></textarea>
    </div>

    <div class="brewery-form">
    <label for="year">Brewery Establishment Year: </label>
    <input type="text" id="year" name="year" class="new-brew-form"  placeholder='Enter Year Established'>
    </div>

    <div class="brewery-form">
    <label for="logo">Brewery Logo Url: </label>
    <input type="text" id="logo" name="logo" class="new-brew-form" placeholder='Enter Image URL'>
    </div>
    
    <button type="submit" class="btn btn-primary">Add Brewery</button>    
    </form>
    </div>

</template>

<script>  
import BreweryService from '../services/BreweryService';

export default {
    data() {
        return {
            brewery: {
                breweryId: '',
                name: '',
                location: '',
                establishedYear: '',
                description: '',
                imageUrl: '',
            },
        }
    },

    methods: {
        addNewBrewery() {
    
        BreweryService.addBrewery(this.newBrewery)
        .then(response => {
          if (response.status === 201 || response.status === 200) {
            this.$router.push({
              name: 'new-brewery-page'
            });
          }
          this.resetForm()
        })

        .catch(err => console.error(err));

        },

        resetForm(){
            this.brewery = {
                breweryId: null,
                name: '',
                location: '',
                establishedYear: null,
                description: '',
                imageUrl: '',
            };
        },
    }
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
    width: 50%;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    font-weight: bold;
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