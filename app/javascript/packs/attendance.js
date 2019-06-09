import Vue from 'vue/dist/vue.esm.js'
import Header from './components/header.vue'
import Attendance from './components/attendance.vue'
import VueFlashMessage from 'vue-flash-message'

require('vue-flash-message/dist/vue-flash-message.min.css');

Vue.use(VueFlashMessage)

var app = new Vue({
  el: '#app',
  components: {
    'navbar': Header,
    'attendance': Attendance
  }
});
