import axios from 'axios'


export default {

    listAllBreweries() {
        return axios.get('/brewery')
    }
}
