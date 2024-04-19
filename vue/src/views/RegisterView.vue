<template>
  <div id="register">
    <div class="background"></div>
    <div class="form-container">
      <form v-on:submit.prevent="register">
      <h1>Create Account</h1>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <div class="form-input-group">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" v-model="user.confirmPassword" required />
      </div>
      <button type="submit">Create Account</button>
      <p><router-link v-bind:to="{ name: 'login' }">Already have an account? Log in.</router-link></p>
    </form>
  </div>
</div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
  register() {
    if (this.user.password !== this.user.confirmPassword) {
      this.registrationErrors = true;
      this.registrationErrorMsg = 'Password & Confirm Password do not match.';
    } else {
      authService
        .register(this.user)
        .then((response) => {
          if (response.status === 201) {
            this.$router.push({
              path: '/login',
              query: { registration: 'success' },
            });
          }
          // Reset registration error message when registration is successful
          this.clearErrors();
        })
        .catch((error) => {
          const response = error.response;
          this.registrationErrors = true;
          if (response.status === 400) {
            this.registrationErrorMsg = 'Bad Request: Validation Errors';
          }
        });
    }
  },
  clearErrors() {
    this.registrationErrors = false;
    this.registrationErrorMsg = 'There were problems registering this user.';
  },
}
};
</script>

<style scoped>
#register {
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