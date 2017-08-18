<template>
  <div class="main-quejate">
    <div class="w3-display-container video">
        <video class="w3-grayscale-max" autoplay muted loop playsinline>
            <source src="../assets/mexico.mp4" type="video/mp4">
        </video>
        <h1 class="w3-display-topmiddle primary-text">#FuturoMéxico</h1>
        <h3 class="w3-display-middle w3-center primary-text">La plataforma para el cambio Social en México</h3>
        <button class="w3-btn w3-display-bottommiddle w3-xlarge w3-round-xxlarge w3-padding w3-red w3-margin-bottom" @click="$router.push({name:'Queja'})">Quejate</button>
    </div>
    <div class="categorias w3-row-padding w3-margin-top">
        <div class="w3-card w3-col l4 m5 s12 w3-display-container" v-on:mouseover="seg = !seg" v-on:mouseout="seg = !seg">
            <div class="w3-display-container category">
                <p class="w3-display-middle" v-show="seg"><i class="fa fa-shield w3-jumbo"></i></p>
                <p class="w3-display-middle w3-xlarge" v-show="!seg">Seguridad</p>
            </div>
        </div>
        <div class="w3-card w3-col l4 m5 s12 w3-display-container" v-on:mouseover="trans = !trans" v-on:mouseout="trans = !trans">
            <div class="w3-display-container category">
                <p class="w3-display-middle" v-show="trans"><i class="fa fa-subway w3-jumbo"></i></p>
                <p class="w3-display-middle w3-xlarge" v-show="!trans">Transporte y Comunicación</p>
            </div>
        </div>
        <div class="w3-card w3-col l4 m5 s12 w3-display-container" v-on:mouseover="salud = !salud" v-on:mouseout="salud = !salud">
            <div class="w3-display-container category">
                <p class="w3-display-middle" v-show="salud"><i class="fa fa-hospital-o w3-jumbo"></i></p>
                <p class="w3-display-middle w3-xlarge" v-show="!salud">Salud</p>
            </div>
        </div>
        <div class="w3-card w3-col l4 m5 s12 w3-display-container" v-on:mouseover="medio = !medio" v-on:mouseout="medio = !medio">
            <div class="w3-display-container category">
                <p class="w3-display-middle" v-show="medio"><i class="fa fa-tree w3-jumbo"></i></p>
                <p class="w3-display-middle w3-xlarge" v-show="!medio">Medio Ambiente</p>
            </div>
        </div>
        <div class="w3-card w3-col l4 m5 s12 w3-display-container" v-on:mouseover="ed = !ed" v-on:mouseout="ed = !ed">
            <div class="w3-display-container category">
                <p class="w3-display-middle" v-show="ed"><i class="fa fa-mortar-board w3-jumbo"></i></p>
                <p class="w3-display-middle w3-xlarge" v-show="!ed">Educación</p>
            </div>
        </div>
        <div class="w3-card w3-col l4 m5 s12 w3-display-container" v-on:mouseover="ener = !ener" v-on:mouseout="ener = !ener">
            <div class="w3-display-container category">
                <p class="w3-display-middle" v-show="ener"><i class="fa fa-bolt w3-jumbo"></i></p>
                <p class="w3-display-middle w3-xlarge" v-show="!ener">Energia</p>
            </div>
        </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'main-quejas',
  data () {
    return {
      tog: false,
      seg: true,
      trans: true,
      salud: true,
      medio: true,
      ed: true,
      ener: true
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
    height: 100%;
}
.video{
    width: 100%;
    height: 300px;
    overflow: hidden;
}
video {
    min-width: 100%;
    min-height: 100%;
    width: auto;
    height: auto;
}
.queja {
    width: 100%;
}
figure {
    margin: 0;
}
.category {
    height: 200px;
}
</style>
