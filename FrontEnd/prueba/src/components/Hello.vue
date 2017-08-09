<template>
  <div class="hello">
    <quejas></quejas>
  </div>
</template>

<script>
import quejas from '@/components/MainQuejate'

export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  components: {
    quejas
  },
  mounted () {
    navigator.geolocation.getCurrentPosition(pos => {
      console.log(pos.coords)
    })
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.hello {
  height: 100%;
  width: 100%;
}
</style>
