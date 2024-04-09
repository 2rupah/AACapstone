<template>
  <div class="overlay"></div>
</template>
<script>
export default {
};
</script>
<style scoped>
.overlay {
  position: relative;
  width: 100vw;
  height: 100vh; /* Adjust this according to your needs */
  background-color: #0A1823;
}
.overlay::before {
  content: "";
  position:fixed;
  width: 100%;
  height: 100%;
  background-image: url('../assets/Logo.jpg'); /* Path to your image */
  background-size: contain;
  opacity: 0.5; /* Adjust the opacity as needed */
  background-position: center;
  background-repeat: no-repeat;
}
</style>