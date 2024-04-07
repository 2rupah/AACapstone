import { createStore as _createStore } from 'vuex';
import axios from 'axios';
import BreweryService from '../services/BreweryService'

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},
      breweryList: []
    },
    actions: {
      getAllBreweries(context) {
        BreweryService.getAllBreweries().then(response => {
          context.commit('SET_BREWERYLIST', response)
        })
      }

    },
    mutations: {
      SET_BREWERYLIST(state, brewery){
        state.breweryList = brewery
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
