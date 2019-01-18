<template>
  <div class="con-center">
    <h1>Hello {{ userid }} </h1>
    <input type="text" :value="name"/>
  </div>
</template>
<script>
export default {
 data() {
    return {
      name: "Artdvp",
      userid: this.$route.params.empid
    }
  }
}
</script>
<style>
.con-center {
  text-align: center;
  margin-top: 1rem;
}
</style>