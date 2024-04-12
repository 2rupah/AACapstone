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

    updateBrewery(breweryId, breweryData) {
        console.log("In update Brewery Service: ", breweryId)
        return axios.put(`/brewery/${breweryId}/update`, breweryData);
      }
}
