<script>
export default {
  data() {
    return {
      students: []
    }
  },
  async created() {
    console.log('created')
    let res = await this.$http.get('/emp')
    console.log(res.data)
  }
}
</script>