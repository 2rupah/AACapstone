<template>
    <div>
      <div class="overlayTwo" v-show="isVisible"></div>
      <div class="popout-container" v-show="isVisible">
        <div class="popout-content">
          <!-- Content of your pop-out component goes here -->
          <h2>ARE YOU 21 OR OLDER?</h2>
          <p>This website/application is intended for individuals aged 21 and older. By accessing or using this website/application, you affirm that you are of legal drinking age in your jurisdiction.
  
  If you are not of legal drinking age or do not meet the legal requirements to view this content, please exit this website/application immediately.
  
  Please enjoy our content responsibly. Excessive or irresponsible consumption of alcohol can have serious health and social consequences. We encourage you to drink responsibly and in moderation.
  
  By continuing to use this website/application, you acknowledge and agree to abide by these terms.</p>
          <button @click="closePopout">Click if you agree</button>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        isVisible: false
      };
    },
    mounted() {
      // Set isVisible to true when the component is mounted
      this.isVisible = true;
    },
    methods: {
      closePopout() {
        this.isVisible = false;
      }
    }
  }
  </script>
  
  <style scoped>
  .overlayTwo {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black overlay */
    z-index: 999; /* Higher z-index than popout container */
  }
  
  .popout-container {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(255, 255, 255, 0.9);
    border: 1px solid #ccc;
    padding: 20px;
    z-index: 1000; /* Adjust z-index as needed */
  }
  
  h2 {
    text-align: center;
  }
  
  </style>
  