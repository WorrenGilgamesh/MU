<template>
  <div class="queja-form w3-center">
    <div class="form w3-card-4 w3-border-bottom w3-white">
        <h1 class="secondary-color primary-text">Formulario de queja</h1>
        <form class="w3-container">
            <p>
                <label class="w3-left">Email: </label>
                <input class="w3-input w3-border" type="email" placeholder="nombre@dominio.com" v-model="email" v-on:keyup="checa" lazy required>
            </p>
            <p>
                <label class="w3-left">Titulo de Queja: </label>
                <textarea class="w3-input w3-border" style="resize:none" v-model="titulo" v-on:keyup="checa" lazy required></textarea>
                <input class="w3-btn w3-margin secondary-color-dark primary-text w3-right" type="submit" value="Siguiente >" v-show="disponible" @click="pasaQueja"></input>
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
}
.form form {
    width: 100%;
}
</style>
