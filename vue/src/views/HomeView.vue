<template>
  <div class="overlay">
    <p id="tagline">"Beer lovers <br> helping you <br> find your next <br> favorite brewery"</p>
    <p id="second">Find Breweries <br> Rate Beers <br> Find Friends </p>
  </div>
  
</template>
<script>
export default {
};
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap');
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

#tagline{
  margin-right: auto;
  padding-left: 10%;
  color: white;
  font-size: 2.5em;
}

p#tagline {
  font-family: Cinzel;
  padding-bottom: 10%;
}
#second{
  margin-left: auto;
  color: white;
  font-size: 2.5em;
}
p#second{
  font-family: Cinzel;
  padding-bottom: 10%;
  padding-right: 10%;
}
</style>
