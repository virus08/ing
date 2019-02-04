import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
axios.defaults.headers.common['Authorization'] = 'Basic YWRtaW46dGVzdA==';
const request = axios.create({
  baseURL: '/api',
})

Vue.use(VueAxios, request)