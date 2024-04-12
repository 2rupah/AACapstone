import axios from 'axios'



export default {

    listAllBreweries() {
        return axios.get('/brewery');
       
        },

    getBeersByBreweryId(breweryId) {
        return axios.get(`/brewery/${breweryId}`);
        },
    
    // Dashboard
    addBeer(beer) {
        console.log("In add Beer of Brewery Service: ", beer)
        return axios.post('/login/add', beer);
    },

    deleteBeer(breweryId){
        return axios.delete(`/brewery/${breweryId}`);
    },

    updateBrewery(brewery) {
        console.log("In update Brewery Service: ", brewery)
        return axios.put(`/brewery/${brewery.breweryId}/update`, brewery);
    },

    getBreweryInfo(breweryId) {
        return axios.get(`/brewery/${breweryId}/info`)
    }
}
