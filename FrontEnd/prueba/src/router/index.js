import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'

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
      path: '/test',
      name: 'Test',
      template: 'test'
    }
  ]
})
