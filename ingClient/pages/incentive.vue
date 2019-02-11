<template>
  <div>
    <v-data-table
      :headers="headers"
      :items="desserts"
      class="elevation-1"
      :rows-per-page-items="rowsperpageitems"
    >
    <v-progress-linear slot="progress" color="blue" indeterminate></v-progress-linear>
      <template slot="items" slot-scope="props">

        <td class="text-xs-left" width="450px"> 
          <nuxt-link :to="'/inc/'+props.item.Emp_Code+'/view'"> 
            {{ props.item.Thai_name}}
          </nuxt-link> 
        </td>
        <td class="text-xs-left">{{ props.item.January}}</td>
        <td class="text-xs-left">{{ props.item.February}}</td>
        <td class="text-xs-left">{{ props.item.March}}</td>
        <td class="text-xs-left">{{ props.item.April}}</td>
        <td class="text-xs-left">{{ props.item.May}}</td>
        <td class="text-xs-left">{{ props.item.June}}</td>
        <td class="text-xs-left">{{ props.item.July}}</td>
        <td class="text-xs-left">{{ props.item.August}}</td>
        <td class="text-xs-left">{{ props.item.September}}</td>
        <td class="text-xs-left">{{ props.item.October}}</td>
        <td class="text-xs-left">{{ props.item.November}}</td>
        <td class="text-xs-left">{{ props.item.December}}</td>
      </template>
    </v-data-table>
  </div>
</template>
<style>
  .con-center {
     text-align: center;
     margin-top: 1rem;
  }
</style>
<script>
export default {
  layout: 'incentiveview',
  data() {
    return {
      rowsperpageitems:[8,{"text":"$vuetify.dataIterator.rowsPerPageAll","value":-1}],
      dialog: false,
      drawer: null,
      name: '',
      detail:'ข้อมูลพนักงาน',
      headers: [

        { text: 'Thai Name',align: 'left',sortable: false, value: 'Thai_name' },
        { text: 'Jan',align: 'left',sortable: true, value: 'January' },
        { text: 'Feb',align: 'left',sortable: true, value: 'February' },
        { text: 'Mar',align: 'left',sortable: true, value: 'March' },
        { text: 'Apr',align: 'left',sortable: true, value: 'April' },
        { text: 'May',align: 'left',sortable: true, value: 'May' },
        { text: 'Jun',align: 'left',sortable: true, value: 'June' },
        { text: 'Jul',align: 'left',sortable: true, value: 'July' },
        { text: 'Aug',align: 'left',sortable: true, value: 'August' },
        { text: 'Sep',align: 'left',sortable: true, value: 'September' },
        { text: 'Oct',align: 'left',sortable: true, value: 'October' },
        { text: 'Nov',align: 'left',sortable: true, value: 'November' },
        { text: 'Dec',align: 'left',sortable: true, value: 'December' }

      ],
      desserts:[]
    }
  },
   methods: {
    datareload: async function () {
       console.log('App reload')
       let res = await this.$http.get('/incentive')
       this.desserts = res.data;
    }
   },
  created() {
    console.log('Incentive created')
    this.datareload();
  }
}
</script>