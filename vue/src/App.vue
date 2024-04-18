<template>
  <div class="main">
    <the-header />
    <DisclaimerPopUp />
    <router-view />
 
  </div>
</template>

<script>
import TheHeader from './components/TheHeader.vue';
import DisclaimerPopUp from './components/DisclaimerPopUp.vue';

export default {
  components: {
    TheHeader,
    DisclaimerPopUp
}
};
</script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Balthazar&family=Cinzel:wght@400..900&display=swap');
</style>

