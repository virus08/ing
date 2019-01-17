<template>
  <v-data-table
    :headers="headers"
    :items="desserts"
    class="elevation-1"
  >
    <template slot="items" slot-scope="props">
      <td>{{ props.item.Emp_Code}}</td>
      <td class="text-xs-left">{{ props.item.Name }}</td>
      <td class="text-xs-left">{{ props.item.Surname }}</td>
      <td class="text-xs-left">{{ props.item.ProductCount }}</td>
    </template>
  </v-data-table>
</template>
<style>
  .con-center {
     text-align: center;
     margin-top: 1rem;
  }
</style>
<script>
export default {
  layout: 'App',
  data() {
    return {
      headers: [],
      desserts:[]
    }
  },
  async created() {
    console.log('created')
    let res = await this.$http.get('/emp')
    console.log(res.data)
    this.headers = res.data.headers;
    this.desserts = res.data.results;
  }
}
</script>