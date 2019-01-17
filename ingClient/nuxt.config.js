module.exports = {
  /*
  ** Headers of the page
  */
  head: {
    title: 'VSTECS Thailand co.,Ltd',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Nuxt.js project' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
      { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' }

    ]
  },
  /*
  ** Customize the progress bar color
  */
  loading: { color: '#3B8070' },


  /*
 ** Added Style
 */
  css: ['~/assets/main.styl'],

 /*
 ** Added plugins
 */
plugins: [
  '~/plugins/vuetify',
  '~/plugins/axios' //-- add plugins axios
],

proxy: {
  '/api': 'http://127.0.0.1:8000', //-- ตั้งค่า map proxy url api server
  ws: true
},

modules: [
  '@nuxtjs/proxy' //-- add modules proxy 
],

  /*
  ** Build configuration
  */
  build: {
    vendor: [
      'jquery', 
      
      'vuetify',
      'vue-axios' //-- add vendor vue-axios
    ],
    /*
    ** Run ESLint on save
    */
    extend (config, { isDev, isClient }) {
      if (isDev && isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  }
}

