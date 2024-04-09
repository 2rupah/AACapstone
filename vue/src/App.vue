<template>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><img src="@/assets/logo.jpg" alt=""></a>
      
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Brewery</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Login</a>
          </li>
        </ul>
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
    <!-- <div id="capstone-app">
      <div id="nav">
        <router-link v-bind:to="{ name: 'home' }" class="btn btn-primary mr-2">Home</router-link>
        <router-link v-bind:to="{ name: 'brewery' }" class="btn btn-primary mr-2">BreweryList</router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" class="btn btn-primary">Logout</router-link>
      </div>
      <router-view />
    </div> -->
  </template>

  <style scoped>
    img {
      height:auto;
      width: 12%;
    }
  </style>