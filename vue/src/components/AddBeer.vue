<template>
<h1>Add Beer</h1>
<form class="row g-3" v-on:submit.prevent="addNewBeer">
    <div class="col-md-3">
      <label for="inputBeer" class="form-label">Beer Name</label>
      <input type="text" class="form-control" id="inputBeer">
    </div>
    <div class="col-md-2">
      <label for="inputBreweryId" class="form-label">Brewery Id</label>
      <input type="text" class="form-control" id="inputBreweryId">
    </div>
    <div class="col-3">
      <label for="inputStyle" class="form-label">Style</label>
      <input type="text" class="form-control" id="inputStyle">
    </div>
    <div class="col-1">
      <label for="inputABV" class="form-label">ABV</label>
      <input type="text" class="form-control" id="inputABV">
    </div>
    <div class="col-md-1">
      <label for="inputIBU" class="form-label">IBU</label>
      <input type="text" class="form-control" id="inputIBU">
    </div>
    <div class="col-md-6">
      <label for="inputDescription" class="form-label">Description</label>
      <input type="text" class="form-control" id="inputDescription">
    </div>
    <div class="col-md-6">
      <label for="inputImage" class="form-label">Image</label>
      <input type="text" class="form-control" id="inputImage">
    </div>
    <div class="col-12">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </form>
</template>

<script>
import BreweryService from '../services/BreweryService';


export default {
    props: ['beerId'],
    data() {
        return {
            newBeer: {}
        };
    },

methods: {
    addBeer() {
    this.newBeer.beerId = this.beerId;
    BreweryService.addBeer(this.newBeer, this.beerId)
      .then(response => {
        if (response.status === 201 || response.status === 200) {
            this.$router.push( { 
              name: 'login-dashboard' } );
            }
      })
      
      .catch(err => console.error(err));

  },
  resetForm() {
    this.newBeer = {}
  }
}
}


</script>

<style>

form {
  text-align: center;
}
form div {
  padding-bottom: 5%;
  padding-left: 2%;
  padding-right: 2%;
  position: center;
}
section {
  width: 80%;
padding-left: 15%;
}

</style>