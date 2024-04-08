import axios from 'axios'


export default {

    listAllBreweries() {
        return axios.get('/brewery');
       
        },

    getBeersByBreweryId(breweryId) {
        return axios.get(`/brewery/${breweryId}`);
    }
}
