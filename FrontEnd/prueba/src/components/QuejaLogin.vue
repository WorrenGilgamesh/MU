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
        Estas a nada
      </div>
      <div class="text bottom">
        de generar un cambio
      </div>
    </div>
    <div class="form w3-card-4 w3-border-bottom w3-white">
        <form class="w3-container">
            <div class="w3-center w3-border-bottom">
                <label class="w3-border-bottom">núm de referencia</label>
                <p>#{{referencia}}</p>
            </div>
              <div class="w3-center w3-padding">
                <button class="w3-btn w3-block w3-border facebook primary-text w3-round">Login Facebook</button>
                <button class="w3-btn w3-block w3-border w3-margin-top google w3-round">Login Gmail</button>
              </div>
              <p>Ó</p>
              <div class="w3-center w3-padding">
                <input class="w3-input w3-border w3-round" type="text" placeholder="Nombre">
                <input class="w3-input w3-border w3-round w3-margin-top" type="text" placeholder="Apellido">
                <input class="w3-input w3-border w3-round w3-margin-top" type="email" v-model="email" lazy required> 
                <button class="w3-btn secondary-color-dark primary-text w3-margin-top w3-right">Terminar</button>
              </div>
        </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'queja-login',
  data () {
    return {
      titulo: '',
      email: '',
      referencia: 1234,
      disponible: false,
      reg: new RegExp('^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$')
    }
  },
  methods: {
    pasaQueja: function (e) {
      e.preventDefault()
      this.$router.push({name: 'gracias', params: {titulo: this.titulo, email: this.email}})
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
