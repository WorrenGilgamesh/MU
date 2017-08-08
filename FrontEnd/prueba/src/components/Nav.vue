<template>
  <div class="nav">
    <div class="w3-bar w3-red">
        <a href="#" class="w3-bar-item w3-button">Home</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small">Link 1</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small">Link 2</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small">Link 3</a>
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" @click="toggleNav">&#9776;</a>
    </div>

    <div id="demo" class="w3-bar-block w3-red w3-hide w3-hide-large w3-hide-medium" v-bind:class="{'w3-show': tog}">
        <a href="#" class="w3-bar-item w3-button">Link 1</a>
        <a href="#" class="w3-bar-item w3-button">Link 2</a>
        <a href="#" class="w3-bar-item w3-button">Link 3</a>
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
