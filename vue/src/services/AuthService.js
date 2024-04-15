import axios from 'axios';

export default {

  login(user) {
    return axios.post('/login', user)
  },

  register(user) {
    return axios.post('/register', user)
  },
  
  logout(user) {
    return axios.post('/logout', user)
  },

}
