<template>
    <div id="container">
        <!-- <img src="@/assets/logo.jpg" alt=""> -->
        
        <h1 id="siteTitle">Ale Atlas</h1>
        <nav>  
          
            <router-link v-if="shouldDisplayHomeButton" v-bind:to="{ name: 'home' }">Home</router-link>
            <router-link v-bind:to="{ name: 'brewery' }">Breweries</router-link>
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
    },
    computed: {
    shouldDisplayHomeButton() {
     
      return this.$route.name !== 'home'; 
    },
  },
}
</script>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap');
  h1{
    height: auto;
    margin-right: auto;
    margin-left:20px;
    font-weight: bold;
    font-family: Cinzel;
  }

  img {
    /* grid-area: logo; */
    width: 7%;
    height:auto;
    /* Make logo a circle and add */
    border-radius: 50%;
    box-shadow: 3px 3px 3px;
    /* margin-right: auto; */
    /* padding: 10px; */
    margin-left: 10px;
    
  }
  #container {
    display: flex;
    /* grid-template-columns: 1fr 1fr 2fr 2fr;
    grid-template-areas: "logo name header buttons"; */
    justify-content: space-around;
    align-items: center;
    width: 100%;
    border-bottom: 8px solid #A78851;
    background-color: #d2c1a2;
  }
  nav a {
    /* grid-area: buttons; */
    margin-left: auto;
    margin: 5px;
    padding: 13px 25px;
    background-color: #0A1823;
    color: white;
    border-radius: 6px;
    height: auto;
}
</style>