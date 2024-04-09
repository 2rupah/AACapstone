<template>
  
  <div class="background"></div>  
  <div class="overlay"></div>
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>

</template>

<script>
export default {
};
</script>

<style scoped>


.background {
  background-color: #0D1822;
  height: 100vh;
  width: 100vw;
 
}
.overlay {
    height: 100vh;
    width: 100vw;
    position: relative;
    background-size: contain;
    background-position:center;
    background-repeat: no-repeat;

    background-image: url('../assets/Logo.jpg'); 
  }
</style>
