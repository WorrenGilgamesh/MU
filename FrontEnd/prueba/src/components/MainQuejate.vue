<template>
  <div class="main-quejate">
    <div class="w3-display-container">
        <div class="w3-display-middle w3-large">
            <button class="w3-btn w3-xlarge w3-round-xlarge secondary-color primary-text">QUEJATE</button>
        </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'main-quejas',
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
.main-quejate {
    width: 100%;
    height: 300px;
}
.w3-display-container{
    width: 100%;
    height: 100%;
}
</style>
