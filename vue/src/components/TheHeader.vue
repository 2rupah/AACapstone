<template>
  <div id="container">
      <img src="@/assets/logo.jpg" alt="">
      
      <!-- <h1 id="siteTitle">{{title}}</h1> -->
      <div class="search-bar">
              <input type="text" placeholder="Search Breweries here! ^_^" style="width: 600px;">
              <button>Search</button>
          </div>
      <nav>
          <router-link v-bind:to="{ name: 'home' }">Home</router-link>
          <router-link v-bind:to="{ name: 'brewery' }">Brewery</router-link>
          <router-link v-bind:to="{ name: 'login' }">Login</router-link>
      </nav>
  
  </div>
</template>
<script>
export default {
  data() {
      return {
        title: 'Brewery'
      }
  }
}
</script>
<style scoped>
#siteTitle {
  text-align: center;
}
img {
  width: 7%;
  height:auto;
  /* Make logo a circle and add */
  border-radius: 50%;
  box-shadow: 3px 3px 3px;
  margin-right: auto;
  /* padding: 10px; */
}
#container {
  display: flex;
  justify-content: space-around;
  align-items: center;
  width: 100%;
  border-bottom: 8px solid #A78851;
  background-color: #d2c1a2;
}
nav {
  display: flex;
  align-items: center;
}
nav a {
  margin: 5px;
  padding: 13px 25px;
  background-color: #0A1823;
  color: white;
  border-radius: 6px;
}
.search-bar {
 /* border: 1px solid #0A1823; */
  display: flex;
  justify-content: space-around;
  align-items: center;
  width: 100%;
  padding: 6px;
  background-color: #0A1823;
  color: white;
  border-radius: 6px;
  margin-bottom: 10px;
  margin-top: 6px;
  margin-left: 15px;
  margin-right: 6px;


}
.search-bar input[type="text"] {
  padding: 8px;
  border-radius: 5px;
  border: 1px solid #ccc;
  margin-right: 5px;
  margin-left: 5px;
  width: 100%;
  background-color: #f1f1f1;
  font-size: 16px;
  font-family: inherit;
  font-weight: inherit;
}
.search-bar button {
  padding: 8px 15px;
  background-color: white;
  color: 0A1823;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-left: 300px;
  margin-right: 1px;
  margin-top: 1px;
  margin-bottom: 1px;
  font-size: 15px;
  
}

</style>
