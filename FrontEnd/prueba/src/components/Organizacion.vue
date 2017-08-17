<template>
  <div class="organizacion">
    <div class="banner w3-display-container">
        <figure class="w3-opacity-max">
            <img src="../assets/agua.jpg" alt="Lights" style="width:100%">
        </figure>
        <div class="w3-display-middle w3-large">
            <h1>{{user.name}}</h1>
        </div>
    </div>
    <div class="content w3-container w3-row-padding">

      <div class="w3-col s12 m3 l3 w3-card w3-white w3-border">
        <p>Contacto:</p>
        <p>{{user.email}}</p>
        <p>Localizanos en:</p>
        <address>
          {{user.address.street}},<br>
          {{user.address.suite}},<br>
          {{user.address.city}},<br>
          {{user.address.zipcode}},<br>
        </address>
      </div>

      <div class="w3-col w3-hide-small m1 l1 shadow">
      </div>

      <div class="org w3-col s12 m4 l4 w3-card w3-white w3-border w3-topbar w3-bottombar w3-leftbar w3-rightbar secondary-boder">
        <figure class="org-photo">
          <img v-bind:src="photo" v-bind:alt="user.name" class="w3-circle photo">
        </figure>
        <p>{{user.username}}</p>
      </div>

      <div class="w3-col w3-hide-small m1 l1 shadow">
      </div>

      <div class="w3-col s12 m3 l3 w3-card w3-white w3-border">
        <p>w3-card</p>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: 'Organizacion',
  data () {
    return {
      user: {
        name: 'lol',
        username: '',
        email: '',
        address: {
          street: '',
          suit: '',
          city: '',
          zipcode: ''
        }
      },
      photo: 'http://heartlandpreciousmetals.com/wp-content/uploads/2014/06/person-placeholder.jpg?6d697a'
    }
  },
  created () {
    this.$http.get('https://jsonplaceholder.typicode.com/users/' + this.$route.params.id).then(res => {
      this.user = res.data
    })
    this.$http.get('https://unsplash.it/200/200/?random' + this.$route.params.id).then(res => {
      this.photo = res.url
    })
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.organizacion {
    width: 100%;
    height: 100%;
}
.banner {
  overflow: hidden;
  height: 300px;
  width: 100%;
}
figure {
    margin: 0;
}
.org {
  position: relative;
  margin-top: -70px;
  text-align: center;
}
.shadow {
  height: 20px;
}
.org-photo {
  text-align: center;
}
.photo {
  position: relative;
  margin-top: -70px;
}
.content {
  margin-top: 20px;
}
</style>
