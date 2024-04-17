import { createStore as _createStore } from 'vuex';
import axios from 'axios';
import BreweryService from '../services/BreweryService'

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},
      isAuthenticated: !!currentToken,
      breweryList: [],
      beerList: [],
      searchResults: [],
      searchQuery: [],
    },
    actions: {
      async searchBreweries(context, query) {
        try {
          const response = await BreweryService.searchBreweries(query);
          context.commit('SET_SEARCH_RESULTS', response.data);
        } catch (error) {
          console.error(error);
        }
      },
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
      },
      
      getBreweryInfo(context, breweryId) {
        BreweryService.getBreweryInfo(breweryId).then(response => {
          context.commit('SET_BREWERY', response.data)
        })
        .catch(err => console.error(err));
      },

      getAllReviewsByBeerId(context, beerId) {
        BreweryService.getReviewsByBeerId(beerId).then(response => {
          context.commit('SET_BEERREVIEWSLIST', response.data)
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
      SET_BREWERY(state, brewery){
        state.brewery = brewery
      },
      SET_BEERREVIEWSLISTeviewsList(state, beerReviewsList){
        state.beerReviewsList = beerReviewsList
      },
      SET_SEARCH_QUERY(state, query) {
        state.searchQuery = query;
      },
      SET_SEARCH_RESULTS(state, results) {
        state.searchResults = results;
      },
      SET_AUTH_TOKEN(state, token) {
        state.token = token;
        state.isAuthenticated = !!token;
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
        state.isAuthenticated = false;
        axios.defaults.headers.common = {};
      }
    },
  });
  return store;
}
