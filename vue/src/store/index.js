import { createStore as _createStore } from 'vuex';
import axios from 'axios';
import BreweryService from '../services/BreweryService'

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},
      breweryList: [],
      beerList: []
    },
    actions: {
      getAllBreweries(context) {
        BreweryService.listAllBreweries().then(response => {
          context.commit('SET_BREWERYLIST', response.data)
        })
        .catch(err => console.error(err));
      },
      getAllBeersByBreweryId(context, breweryId) {
        BreweryService.getBeersByBreweryId(breweryId).then(response => {
          context.commit('SET_BEERLIST', response.data)
        })
        .catch(err => console.error(err));
      }
      

    },
    mutations: {
      SET_BREWERYLIST(state, breweries){
        state.breweryList = breweries
      },
      SET_BEERLIST(state, beerList){
        state.beerList = beerList
      },
      SET_AUTH_TOKEN(state, token) {
        state.token = token;
        localStorage.setItem('token', token);
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      },
      SET_USER(state, user) {
        state.user = user;
        localStorage.setItem('user', JSON.stringify(user));
      },
      LOGOUT(state) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        state.token = '';
        state.user = {};
        axios.defaults.headers.common = {};
      }
    },
  });
  return store;
}
