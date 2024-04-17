import axios from 'axios'



export default {

    listAllBreweries() {
        return axios.get('/brewery');
       
        },
    getBeerById(beerId) {
        return axios.get(`/beer/${beerId}`)
    },

    getBeersByBreweryId(breweryId) {
        return axios.get(`/brewery/${breweryId}`);
        
        },
    
    getRandomBrewery() {
        return axios.get(`/brewery/random`)
    },

    // Dashboard
    addBeer(beer) {
        console.log("In add Beer of Brewery Service: ", beer)
        return axios.post('/add', beer);
    },

    addBrewery(brewery) {
        return axios.post('/login/new', brewery);
    },

    deleteBeer(beerId){
        return axios.delete(`/brewery/beers/${beerId}`);
    },

    updateBrewery(brewery) {
        console.log("In update Brewery Service: ", brewery)
        return axios.put(`/brewery/${brewery.breweryId}/update`, brewery);
    },

    getBreweryInfo(breweryId) {
        return axios.get(`/brewery/${breweryId}/info`)
    },

    // Reviews

    getReviewsByBeerId(beerId) {
        return axios.get(`/beer/${beerId}/reviews`)
    },

    searchBreweries(searchTerm) {
        return axios.get(`/api/search/breweries?searchTerm=${searchTerm}`);
    }
}
