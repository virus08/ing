<template>
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">ES</h1>

            </div>
            <h3>Enterprise System</h3>
            <p> อนุญาติให้เข้าได้เฉพาะ พนักงาน VSTECS เท่านั้น</p>
            <p>Login in. To see it in action.</p>
            <form class="m-t" role="form" action="/emplist">
                <div class="form-group">
                    <input type="email" v-model="email"  class="form-control" placeholder="Username" required="">
                </div>
                <div class="form-group">
                    <input type="password" v-model="password" class="form-control" placeholder="Password" required="">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Login</button>
            </form>
            <p class="m-t"> <small>VSTECS &copy; 2019</small> </p>
        </div>
    </div>
</template>
<script>
export default {
  layout: 'Login',
  data(){
      return {
        email : "wanchai@vstecs.co.th",
        password : "wanchai"
      }
    },
  }
</script>