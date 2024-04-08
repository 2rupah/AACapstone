<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }" class="btn btn-primary mr-2">Home</router-link>
      <router-link v-bind:to="{ name: 'brewery' }" class="btn btn-primary mr-2">BreweryList</router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" class="btn btn-primary">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>
