<template>
  <div class="queja-form w3-center">
    <div class="w3-container line">
      <div class="bubble left w3-border w3-border-blue w3-white">
        1
      </div>
      <div class="bubble right w3-border w3-border-blue w3-white">
        2
      </div>
      <div class="text top">
        Tú estas a una linea
      </div>
      <div class="text bottom">
        de lograr un cambio
      </div>
    </div>
    <div class="form w3-card-4 w3-border-bottom w3-white">
        <form class="w3-container">
            <p>
                <label class="w3-left">Escribe el titulo de tú demanda o petición</label>
                <input class="w3-input w3-border w3-round" type="text" lazy required>
            </p>
            <div class="w3-row">
              <div class="w3-col w3-third w3-padding">
                <label class="w3-center">Elige la Categoría</label>
                  <select class="w3-select" name="option">
                    <option value="" disabled selected>selecciona</option>
                    <option value="1">Option 1</option>
                    <option value="2">Option 2</option>
                    <option value="3">Option 3</option>
                  </select>
              </div>
              <div class="w3-col w3-third w3-padding">
                <label class="w3-center">Elige Ubicación</label>
                <div><i class="w3-btn w3-block w3-red w3-round fa fa-map-marker"></i></div>
              </div>
              <div class="w3-col w3-third w3-padding">
                <label class="w3-center">Elige una imagen</label>
                <input type="file">
              </div>
            </div>
            <p>
                <label class="w3-left">Explica tu Demanda o Petición </label>
                <textarea class="w3-input w3-border" style="resize:none" placeholder="Cuando la gente sabe a detalle la ayuda aumenta la velocidad" lazy required></textarea>
                <input class="w3-btn w3-margin secondary-color-dark primary-text w3-right" value="Siguiente >" @click="pasaQueja"></input>
            </p>
        </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'queja-form',
  data () {
    return {
      titulo: '',
      email: '',
      disponible: false,
      reg: new RegExp('^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$')
    }
  },
  methods: {
    pasaQueja: function (e) {
      e.preventDefault()
      this.$router.push({name: 'QuejaLog'})
    },
    checa: function (e) {
      e.preventDefault()
      if (this.titulo && this.reg.test(this.email)) {
        this.disponible = true
      } else {
        this.disponible = false
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.queja-form {
    width: 100%;
    overflow: hidden;
}
.form {
    width: 40%;
    margin-top: 60px;
    margin-left: auto;
    margin-right: auto;
    font-size: 18px;
    overflow: hidden;
}
.form form {
    width: 100%;
}
.line {
  margin-top: 60px;
  width: 40%;
  position: relative;
  height: 10px;
  background-color: red;
  margin-left: auto;
  margin-right: auto;
}
.line .bubble{
  width: 50px;
  height: 50px;
  position: absolute;
  
  border-radius: 50%;
  padding-top: 13px;
}
.line .left{
  top: -20px;
  left: -20px;
}
.line .right{
  top: -20px;
  right: -20px;
}
.line .text{
  position: absolute;
  font-size: 20px;
}
.line .top{
  top: -25px;
  left: 50px;
}
.line .bottom{
  bottom: -25px;
  right: 70px;
}
</style>
