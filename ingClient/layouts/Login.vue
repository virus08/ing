<template>
  <div>
    <nuxt/>
  </div>
</template>

<script>
export default {
    head () {
    return {
      bodyAttrs: {
        class:'gray-bg'
      },
      script: [
        { src: '/js/jquery-2.1.1.js',body: true,type: "text/javascript" },
        { src: '/js/bootstrap.min.js',body: true,type: "text/javascript" }
      ],
      link: [
        { rel: 'stylesheet', href: '/css/bootstrap.min.css' },
        { rel: 'stylesheet', href: '/font-awesome/css/font-awesome.css' },
        { rel: 'stylesheet', href: '/css/animate.css' },
        { rel: 'stylesheet', href: '/css/style.css' }
      ]
    } 
  }
}
</script>


