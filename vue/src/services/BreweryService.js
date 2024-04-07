import axios from 'axios'

const BASE_URL = 'http://localhost:9000'

export default {

    listAllBreweries() {
        return axios.get(`/brewery`)
        .then(response => response.data)
        .catch(err => {
            console.error('Error getting Breweries', err)
        })
    }
}