import {createRouter, createWebHistory} from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/', redirect: '/manager/home' },
    {
      path: '/manager',
      component: () => import('@/views/Manager.vue'),
      children: [
        { path: 'home', meta: { name: '系统首页' }, component: () => import('@/views/manager/Home.vue'),  },
        { path: 'admin', meta: { name: '管理员信息' }, component: () => import('@/views/manager/Admin.vue'), },
        { path: 'notice', meta: { name: '系统公告' }, component: () => import('@/views/manager/Notice.vue'), },
        { path: 'person', meta: { name: '个人资料' }, component: () => import('@/views/manager/Person.vue'), },
        { path: 'ePerson', meta: { name: '企业资料' }, component: () => import('@/views/manager/EPerson.vue'), },
        { path: 'password', meta: { name: '修改密码' }, component: () => import('@/views/manager/Password.vue'), },
        { path: 'industry', meta: { name: '行业信息' }, component: () => import('@/views/manager/Industry.vue'), },
        { path: 'employ', meta: { name: ' 企业信息' }, component: () => import('@/views/manager/Employ.vue'), },
        { path: 'user', meta: { name: ' 用户信息' }, component: () => import('@/views/manager/User.vue'), },
        { path: 'position', meta: { name: ' 职位信息' }, component: () => import('@/views/manager/Position.vue'), },
        { path: 'advertise', meta: { name: ' 广告信息' }, component: () => import('@/views/manager/advertise.vue'), },
      ]
    },
    {
      path: '/front',
      component: () => import('@/views/Front.vue'),
      children: [
        { path: 'home', component: () => import('@/views/front/Home.vue'),  },
        { path: 'person', component: () => import('@/views/front/Person.vue'),  }
      ]
    },
    { path: '/login', component: () => import('@/views/Login.vue') },
    { path: '/register', component: () => import('@/views/Register.vue') },
    { path: '/404', component: () => import('@/views/404.vue') },
    { path: '/:pathMatch(.*)', redirect: '/404' }
  ]
})

export default router
