<template>
  <div class="main">
    <the-header />
    
    <router-view />
 
  </div>
</template>

<script>
import TheHeader from './components/TheHeader.vue';


export default {
  components: {
    TheHeader,
    
}
};
</script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Balthazar&family=Cinzel:wght@400..900&display=swap');
</style>

