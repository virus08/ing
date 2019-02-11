<template>
        <v-sheet class="d-flex" color="grey lighten-3" height="454">
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
                    {{ props.item.tack}}
                  </nuxt-link> 
                </td>
                <td class="text-xs-center">{{ props.item.CountBrandUnder}}/{{ props.item.Brand_Count}}</td>
                <td class="text-xs-right">{{props.item.Sales_Target.toLocaleString() }}</td>
                 <td class="text-xs-right">{{ props.item.Sales_Out.toLocaleString()}}</td>
                <td class="text-xs-right">{{ props.item.GP_Target.toLocaleString() }}</td>
                 <td class="text-xs-right">{{props.item.GP.toLocaleString() }}</td>
                <td class="text-xs-right">{{ props.item.Sale_Achieve}}%</td>
                <td class="text-xs-right">{{ props.item.GP_Achieve}}%</td>
                <td class="text-xs-right">{{ props.item.rule}}</td>
                <td class="text-xs-right">{{ props.item.Incentive}}</td>
              </template>
            </v-data-table>
          <sheet-footer></sheet-footer>
        </v-sheet>
</template>
<script>
export default {
 layout: 'incentiveview',
  data() {
    return {
      rowsperpageitems:[7,{"text":"$vuetify.dataIterator.rowsPerPageAll","value":-1}],
      dialog: false,
      drawer: null,
      name: '',
      detail:'ข้อมูลพนักงาน',
      headers: [

        { text: 'Track',align: 'left',sortable: true,value: 'Tack'},
        { text: 'F/All',align: 'left',sortable: true,value: 'Brand_Count'},
        { text: 'Sales Target',align: 'left',sortable: true,value: 'Sales_Target'},
        { text: 'Sales Out',align: 'left',sortable: true,value: 'Sales_Out'},
        { text: 'GP Target',align: 'left',sortable: true,value: 'GP_Target'},
        { text: 'GP',align: 'left',sortable: true,value: 'GP'},
        { text: 'Sale Achieve',align: 'left',sortable: true,value: 'Sale_Achieve'},
        { text: 'GP Achieve',align: 'left',sortable: true,value: 'GP_Achieve'},
        { text: 'rule',align: 'left',sortable: true,value: 'Thai_name'},
        { text: 'Incentive',align: 'left',sortable: true,value: 'Incentive'}

      ],
      desserts:[]
    }
  },
  async created() {
    console.log('App created')
    let res = await this.$http.get('incentive/'+this.$route.params.empid+'/views')
    console.log(res.data)
    //this.name = res.data.message;
    //this.headers = res.data.headers;
    this.desserts = res.data;
  }
}
</script>
<style>
.con-center {
  text-align: center;
  margin-top: 1rem;
}
</style>