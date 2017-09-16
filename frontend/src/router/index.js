import Vue from 'vue'
import Router from 'vue-router'
import HomeView from '../components/Home'
import LoginView from '../components/Login'
import StudentView from '../components/Student'
import ClassView from '../components/Class'
import ClassNewView from '../components/ClassNew'
import StudentEditView from '../components/StudentEdit'
import StudentNewView from '../components/StudentNew'


Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView
    },
    {
      path: '/student',
      name: 'student',
      component: StudentView
    },
    {
      path: '/class',
      name: 'class',
      component: ClassView,
      props: true
    },
    {
      path: '/edits',
      name: 'edits',
      component: StudentEditView,
      props: true
    },
    {
      path: '/newst',
      name: 'newst',
      component: StudentNewView
    },
    {
      path: '/newcls',
      name: 'newcls',
      component: ClassNewView
    }
  ]
})

