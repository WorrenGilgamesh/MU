<template>
  <div id="app">
    <top-nav></top-nav>  
    <img src="./assets/logo.png">
    <router-view></router-view> 
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.primary-color {
  background-color: #304ffe;
}
.primary-text {
  color: #ffffff;
}
</style>
