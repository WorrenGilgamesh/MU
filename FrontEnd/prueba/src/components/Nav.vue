<template>
  <div class="nav">
    <div class="w3-bar primary-color primary-text">
        <a href="#" class="w3-bar-item w3-button">México Unido</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small">Quejas y Propuestas</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small">Ranking</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small">Organizaciones</a>
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" @click="toggleNav">&#9776;</a>
    </div>

    <div id="demo" class="w3-bar-block primary-color primary-text w3-hide w3-hide-large w3-hide-medium" v-bind:class="{'w3-show': tog}">
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
