<template>
  <div class="nav w3-top">
    <div class="w3-bar primary-color-dark primary-text w3-large">
        <a class="w3-bar-item w3-button alogo" @click="$router.push({name: 'Hello'})"><img src="../assets/logo.png" class="logo"></a>
        <a class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right"><i class="fa fa-user-circle-o"></i></a>
        <a class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right"><i class="fa fa-search"></i></a>
        <a class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right">Apoya a #FuturoMéxico</a>
        <a class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right">Explorar</a>
        <a class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-right">Inicia una Propuesta</a>
        <a class="w3-bar-item w3-button w3-right w3-hide-large" @click="toggleNav">&#9776;</a>
    </div>

    <div id="demo" class="w3-bar-block primary-color primary-text w3-hide w3-hide-large w3-large" v-bind:class="{'w3-show': tog}">
        <a class="w3-bar-item w3-button w3-center w3-right"><i class="fa fa-user-circle-o"></i></a>
        <a class="w3-bar-item w3-button w3-center w3-right"><i class="fa fa-search"></i></a>
        <a class="w3-bar-item w3-button w3-center w3-right">Apoya a #FuturoMéxico</a>
        <a class="w3-bar-item w3-button w3-center w3-right">Explorar</a>
        <a class="w3-bar-item w3-button w3-center w3-right">Inicia una Propuesta</a>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      tog: false
    }
  },
  methods: {
    toggleNav: function () {
      this.tog = !this.tog
      console.log(this.tog)
    }
  },
  created () {
    navigator.geolocation.getCurrentPosition(pos => {
      console.log(pos.coords.latitude + ', ' + pos.coords.longitude)
    }, err => {
      console.log(err.message)
    })
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.alogo{
  padding: 0;
}
.logo {
  height: 43px;
}
</style>
