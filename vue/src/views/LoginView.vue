<template>
  <div id="login">
    <div class="background"></div>
    <div class="form-container">
      <form v-on:submit.prevent="login">
        <h1>Please Sign In</h1>
        <div role="alert" v-if="invalidCredentials">
          Invalid username and password!
        </div>
        <div role="alert" v-if="this.$route.query.registration">
          Thank you for registering, please sign in.
        </div>
        <div class="form-input-group">
          <label for="username">Username</label>
          <input type="text" id="username" v-model="user.username" required autofocus />
        </div>
        <div class="form-input-group">
          <label for="password">Password</label>
          <input type="password" id="password" v-model="user.password" required />
        </div>
        <button type="submit">Sign in</button>
        <!-- <router-link v-bind:to="{ name: 'add' }">
          <button>Go to Dashboard</button>
        </router-link> -->
        <p>
          <router-link v-bind:to="{ name: 'register' }">Need an account? Sign up.</router-link>
        </p>

      </form>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  computed: {
    isPopUpVisible() {
      // Check if the current route is not the Login route
      const currentRouteName = this.$route.name;
      if (currentRouteName !== 'login') {
        return this.$store.state.isPopUpVisible;
      }
      return false; // Don't show pop-up on the Login route
    }
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
#login {
  position: relative;
}

.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('https://img.pikbest.com/wp/202345/two-people-holding-beer-glasses-on-a-dark-background_9598338.jpg!w700wp');
  background-size: cover;
  background-position: center;
  opacity: 0.5;
  z-index: -1; /* Ensure the background is behind the form */
}

.form-container {
  position: absolute;
  top: 10%;
  left: 50%;
  transform: translate(-50%, -50%) translateY(70%); /* Adjust translateY to move the form down */
  z-index: 1; /* Ensure the form is in front of the background */
  width: 80%; /* Adjust width as needed */
  max-width: 400px; /* Adjust max-width as needed */
  padding: 20px;
  border-radius: 10px;
  background-color: rgba(255, 255, 255, 0.8); /* Adjust background color and opacity as needed */
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2); /* Add shadow for depth */
}

/* Other styles */
.form-input-group {
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
}

form {
  width: 100%;
}

button, p {
  font-family: "Balthazar";
}
</style>