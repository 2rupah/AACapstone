import axios from 'axios'



export default {

    listAllBreweries() {
        return axios.get('/brewery');
       
        },

    getBeersByBreweryId(breweryId) {
        return axios.get(`/brewery/${breweryId}`);
    },

    //Dashboard
    addBeer(beer) {
        return axios.post('/brewery/beer', beer);
    },

    deleteBeer(beerId){
        return axios.delete(`/delete/${beerId}`);
    }
    
}
