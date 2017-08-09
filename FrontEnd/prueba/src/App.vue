<template>
  <div id="app">
    <top-nav></top-nav>  
    <router-view></router-view> 
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>

<style>
html,body {
  width: 100%;
  height: 100%;
}
body {
  padding-top: 43px;
}
#app {
  font-family: 'PT Sans', sans-serif;
  height: 100%;
  width: 100%;
}
.primary-color {
  background-color: #304ffe;
}
.primary-text {
  color: #ffffff;
}
.secondary-color {
  background-color: #d32f2f;
}
</style>
