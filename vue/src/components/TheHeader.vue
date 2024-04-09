<template>
    <div id="container">
        <img src="@/assets/logo.jpg" alt="">
        <!-- <h1 id="siteTitle">{{title}}</h1> -->
        <nav>
            <router-link v-bind:to="{ name: 'home' }">Home</router-link>
            <router-link v-bind:to="{ name: 'login' }">Login</router-link>
            <router-link v-bind:to="{ name: 'brewery' }">Brewery</router-link>
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
    margin-right: auto;
    padding: 10px;
  }
  #container {
    display: flex;
    justify-content: space-around;
    align-items: center;
    width: 100%;
    border-bottom: 8px solid #A78851;
    background-color: #d2c1a2;
  }
  nav a {
    margin: 5px;
    padding: 13px 25px;
    background-color: rgb(13, 21, 139);
    color: white;
    border-radius: 6px;
}
</style>