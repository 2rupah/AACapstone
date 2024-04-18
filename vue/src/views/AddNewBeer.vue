<template>
  <div class="page-container">
    <div class="content">
      <ul class="nav nav-tabs">
    <router-link to="/add" class="nav-item" tag="li"> 
        <a class="nav-link active" aria-current="update">Add a Beer</a>
    </router-link>
    <router-link to="/delete" class="nav-item" tag="li">
      <a class="nav-link">Delete a Beer</a>
    </router-link>
    <router-link to="/update" class="nav-item" tag="li">
      <a class="nav-link">Update Your Brewery</a>
    </router-link>
    <router-link to="/new" class="nav-item" tag="li">
      <a class="nav-link">Add New Brewery</a>
    </router-link>
  </ul>

    <div class="container">
      <h1>Add A Beer</h1>
      <section id="form">
        <label for="brewerySelect">Select Brewery:</label>
        <select v-model="newBeer.breweryId" @change="fetchBreweryInfo" id="brewerySelect" class="form-control">
          <option value="">Select a brewery</option>
          <option v-for="brewery in breweries" :key="brewery.breweryId" :value="brewery.breweryId">{{ brewery.name }}
          </option>
        </select>
  
        <form class="row g-3" v-on:submit.prevent="addNewBeer">
          <div class="col-md-3">
            <label for="inputBeer" class="form-label">Beer Name</label>
            <input v-model="newBeer.name" type="text" class="form-control" id="inputBeer">
          </div>
          
          <div class="col-3">
            <label for="inputStyle" class="form-label">Style</label>
            <input v-model="newBeer.style" type="text" class="form-control" id="inputStyle">
          </div>
          <div class="col-2">
            <label for="inputABV" class="form-label">ABV</label>
            <input v-model="newBeer.abv" type="number" class="form-control" id="inputABV">
          </div>
          <div class="col-md-2">
            <label for="inputIBU" class="form-label">IBU</label>
            <input v-model="newBeer.ibu" type="number" class="form-control" id="inputIBU">
          </div>
          <div class="col-md-6">
            <label for="inputDescription" class="form-label">Description</label>
            <input v-model="newBeer.description" type="text" class="form-control" id="inputDescription">
          </div>
          <div class="col-md-6">
            <label for="inputImage" class="form-label">Image</label>
            <input v-model="newBeer.imageUrl" type="text" class="form-control" id="inputImage">
          </div>
          <div class="col-12">
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
        </form>
      </section>
      </div>
    </div>
    <TheFooter/>
    </div>
  </template>
  
  <script>
  import BreweryService from '../services/BreweryService';
  import TheFooter from '../components/TheFooter.vue';
  
  export default {
    props: ['beerId'],
  
  
    data() {
      return {
        newBeer: {},
        breweries: [],
        brewery: {
          breweryId: '',
          name: '',
          location: '',
          establishedYear: '',
          description: '',
          imageUrl: '',
        },
  
      };
    },
    mounted() {
  
      this.fetchBreweries();
    },
    components: {
    TheFooter,
  },
  
    methods: {
      addNewBeer() {
  
        BreweryService.addBeer(this.newBeer)
          .then(response => {
            if (response.status === 201 || response.status === 200) {
              this.$router.push({
                name: 'add'
              });
            }
            this.resetForm()
          })
  
          .catch(err => console.error(err));
  
      },
      resetForm() {
        this.newBeer = {
          beerId: null,
          name: "",
          breweryId: null,
          style: "",
          abv: null,
          ibu: null,
          description: "",
          imageUrl: ""
        }
      },
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
    }
  }
  </script>
  
  <style scoped>
  .page-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.content {
  flex-grow: 1;
}
  h1 {
    text-align: center;
    padding-bottom: 5%;
    font-family: "Cinzel"
  }
  
  .form-label {
      font-weight: bold;
  }
  .container {
    max-width: 600px;
    margin: 0 auto;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
  }
  
  .form-control {
      width: 100%;
      padding: 1px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
  }
  
  .form-group {
    margin-bottom: 20px;
  }
  
  
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
  
  button.btn.btn-primary {
    padding: 8px 15px;
    background-color: #0A1823;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
    margin-top: 10px;
    width: 25%;
    font-family: "Cinzel"
  }
  
  label {
    font-family: "Balthazar"
  }

  .nav-item {
  font-family: "Balthazar";
}
  
  </style>