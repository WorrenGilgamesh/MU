import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import Queja from '@/components/QuejaForm'

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
      path: '/test/:id',
      name: 'Test',
      template: 'test',
      children: [
        {
          path: 'profile',
          template: 'test'
        }
      ]
    }
  ]
})
