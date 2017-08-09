<template>
  <div class="nav w3-top">
    <div class="w3-bar primary-color primary-text w3-large">
        <a href="#" class="w3-bar-item w3-button">México Unido</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right">Organizaciones</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right">Ranking</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right">Quejas y Propuestas</a>
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" @click="toggleNav">&#9776;</a>
    </div>

    <div id="demo" class="w3-bar-block primary-color primary-text w3-hide w3-hide-large w3-hide-medium w3-large" v-bind:class="{'w3-show': tog}">
        <a href="#" class="w3-bar-item w3-button">Quejas/Propuestas</a>
        <a href="#" class="w3-bar-item w3-button">Ranking</a>
        <a href="#" class="w3-bar-item w3-button">Organizaciones</a>
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
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
