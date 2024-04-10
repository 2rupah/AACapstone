<template>
  <div class="overlay"></div>
  <img src="" alt="">
</template>
<script>
export default {
};
</script>
<style scoped>
.overlay {
  position: fixed;
  top: -10;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: #0A1823;
  display: flex;
  justify-content: center; /* Horizontally center the image */
  align-items: center; /* Vertically center the image */
}

.overlay::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 80%;
  background-image: url('../assets/Logo.jpg');
  background-size: contain;
  opacity: 0.5;
  background-position: center;
  background-repeat: no-repeat;
}
</style>
