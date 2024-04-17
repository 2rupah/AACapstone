<template>
  <div class="main">
    <the-header />
    <wheelpopout />
    <router-view />
 
  </div>
</template>

<script>
import TheHeader from './components/TheHeader.vue';
import Wheelpopout from './components/WheelPopOut.vue';

export default {
  components: {
    TheHeader,
    Wheelpopout
}
};
</script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Balthazar&family=Cinzel:wght@400..900&display=swap');
</style>

