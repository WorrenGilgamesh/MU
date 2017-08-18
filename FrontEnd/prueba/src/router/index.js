import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import Queja from '@/components/QuejaForm'
import QuejaLog from '@/components/QuejaLogin'
import Organizacion from '@/components/Organizacion'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '*',
      redirect: '/'
    },
    {
      path: '/',
      name: 'Hello',
      component: Hello,
      isDefault: true
    },
    {
      path: '/HazTuQueja',
      name: 'Queja',
      component: Queja
    },
    {
      path: '/TerminaTuQueja',
      name: 'QuejaLog',
      component: QuejaLog
    },
    {
      path: '/organizacion/:id',
      name: 'Organizacion',
      component: Organizacion,
      children: [
        {
          path: 'profile',
          template: 'test'
        }
      ]
    }
  ]
})
