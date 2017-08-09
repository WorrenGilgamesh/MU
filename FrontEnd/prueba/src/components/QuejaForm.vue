<template>
  <div class="queja-form w3-center">
    <div class="form w3-card-4">
        <form>
            <label>Email: </label> <br>
            <input type="email" placeholder="nombre@dominio.com"> <br>
            <label>Nombre: </label> <br>
            <input type="text" placeholder="nombre@dominio.com"> <br>
        </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'queja-form'
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.queja-form {
    width: 100%;
    height: 300px;
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
