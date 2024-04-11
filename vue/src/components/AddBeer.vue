<template>


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