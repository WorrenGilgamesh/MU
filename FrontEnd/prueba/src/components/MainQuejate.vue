<template>
  <div class="main-quejate">
    <div class="w3-display-container">
        <figure class="w3-opacity-max">
            <img src="../assets/mundo.jpg" alt="Lights" style="width:100%">
        </figure>
        <div class="w3-display-middle w3-large">
            <button class="queja w3-btn w3-xlarge w3-round-xlarge secondary-color primary-text" @click="$router.push({name: 'Queja'})">¡Q U E J A T E!</button>
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
    overflow: hidden;
}
.w3-display-container{
    width: 100%;
    height: 100%;
}
.w3-display-middle {
    width: 30%;
}
.queja {
    width: 100%;
}
figure {
    margin: 0;
}
</style>
