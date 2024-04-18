<template>
    <div id="container">
        <!-- <img src="@/assets/logo.jpg" alt=""> -->
        <router-link :to="{ name: 'home' }">
        <h1 id="siteTitle">Ale Atlas</h1>
        </router-link>
        <div class="search-bar">
            <input type="text" v-model="searchQuery" placeholder="Search Breweries here! ^_^" style="width: 100%;">
            <button @click="search">Search</button>
        </div>
        <nav>  
          
            <router-link v-if="shouldDisplayHomeButton" v-bind:to="{ name: 'home' }" class="nav-button">Home</router-link>
            <router-link v-if="shouldDisplayBreweryButton" v-bind:to="{ name: 'brewery' }" class="nav-button">Breweries</router-link>
            <router-link v-if="shouldDisplayDashboardButton" v-bind:to="{ name: 'add' }" class="nav-button dashboard-button">Dashboard</router-link>
            <a v-if="isLoggedIn" @click="logout" class="nav-button">Logout</a>
            <router-link v-else-if="shouldDisplayLoginButton" v-bind:to="{ name: 'login' }" class="nav-button">Login</router-link>
            
        </nav>
    </div>
</template>
<script>
export default {
    data() {
        return {
          title: 'Brewery',
          searchQuery: ''

        }
    },
    computed: {
      isLoggedIn() {
            // Assuming you have a state in your Vuex store indicating the user's authentication status
            return this.$store.state.isAuthenticated;
      },
    
      shouldDisplayDashboardButton() {
        return this.$route.name !== 'add' && this.$route.name !== 'delete' && this.$route.name !== 'update' && this.$route.name !== 'new'
      },

    shouldDisplayHomeButton() {
     
      return this.$route.name !== 'home'; 
    },
    shouldDisplayBreweryButton() {
     
     return this.$route.name !== 'brewery-detail' && this.$route.name !== 'brewery'; 
     
   },
   shouldDisplayLoginButton() {
     
    return this.$route.name !== 'login' //&& !this.isLoggedIn; 
   },
  },
  methods: {
      search() {
      // Redirect to search route with the search query as a parameter
      if (this.searchQuery.trim() !== '') {
        this.searchQuery = this.searchQuery.trim().replaceAll(' ', '+');


        this.$router.push({ name: 'search', params: { query: this.searchQuery } });
      } else {
        // Handle empty search query
        console.log('Please enter a search query.');
            }
        },
        logout() {
            // Perform logout action, such as clearing authentication state and redirecting to login page
            this.$store.commit("LOGOUT");
            this.$router.push("/login");
        }
      }
}
</script>
<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Balthazar&family=Cinzel:wght@400..900&display=swap');

  h1{
    height: auto;
    margin-right: auto;
    margin-left:20px;
    font-weight: bold;
    font-family: Cinzel;
    float: left;
    text-decoration: none;
    color:#0A1823;
  }

  @media only screen and (max-width: 768px) {
    #container {
        flex-direction: column;
        align-items: stretch;
    }
}

  @media only screen and (max-width: 768px) {
    #container {
        flex-direction: column;
        align-items: stretch;
    }
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
    font-family: "Cinzel"
}
.nav-button {
    margin: 5px;
    padding: 13px 25px;
    background-color: #0A1823;
    color: white !important;
    border-radius: 6px;
    text-decoration: none;
    cursor: pointer; 
}

.nav-button:hover {
    text-decoration: underline !important;
}


nav a {
  margin: 5px;
  padding: 13px 25px;
  background-color: #0A1823;
  color: white;
  border-radius: 6px;
}

/*
Search bar
*/
.search-bar {
    display: flex;
    justify-content: space-between; /* Adjust the space between input and button */
    align-items: center;
    width: 69%;
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
    flex: 1; /* Use remaining space */
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-right: 5px;
    margin-left: 5px;
    background-color: #F1F1F1;
    font-size: 16px;
    font-family: "Balthazar";
    font-weight: inherit;
    margin-bottom: 0;
}

.search-bar button {
    padding: 8px 15px;
    background-color: white;
    color: #0A1823;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
    font-family: "Cinzel";
}


</style>