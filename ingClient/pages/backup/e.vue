<template>
  <div>
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
        <td class="justify-center layout px-0">
          <a data-toggle="modal" href="#edit-form"> 
            <v-icon small class="mr-2">edit </v-icon> 
          </a>
          <a data-toggle="modal" href="#delete-form"> 
            <v-icon small class="mr-2">delete </v-icon> 
          </a>
        </td>
      </template>
    </v-data-table>
    <v-btn fab bottom right color="pink" dark fixed @click.stop="dialog = !dialog" >
      <v-icon>add</v-icon>
    </v-btn>
    <v-dialog v-model="dialog" width="800px">
      <v-card>
        <v-card-title
          class="grey lighten-4 py-4 title"
        >
          Create contact
        </v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <v-flex xs12 align-center justify-space-between>
              <v-layout align-center>
                <v-avatar size="40px" class="mr-3">
                  <img
                    src="//ssl.gstatic.com/s2/oz/images/sge/grey_silhouette.png"
                    alt=""
                  >
                </v-avatar>
                <v-text-field
                  placeholder="Name"
                ></v-text-field>
              </v-layout>
            </v-flex>
            <v-flex xs6>
              <v-text-field
                prepend-icon="business"
                placeholder="Company"
              ></v-text-field>
            </v-flex>
            <v-flex xs6>
              <v-text-field
                placeholder="Job title"
              ></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field
                prepend-icon="mail"
                placeholder="Email"
              ></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field
                type="tel"
                prepend-icon="phone"
                placeholder="(000) 000 - 0000"
                mask="phone"
              ></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field
                prepend-icon="notes"
                placeholder="Notes"
              ></v-text-field>
            </v-flex>
          </v-layout>
        </v-container>
        <v-card-actions>
          <v-btn flat color="primary">More</v-btn>
          <v-spacer></v-spacer>
          <v-btn flat color="primary" @click="dialog = false">Cancel</v-btn>
          <v-btn flat @click="dialog = false">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
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
  layout: 'Xapp',
  data() {
    return {
      dialog: false,
      drawer: null,
      name: '',
      detail:'ข้อมูลพนักงาน',
      headers: [],
      desserts:[]
    }
  },
  async created() {
    console.log('App created')
    let res = await this.$http.get('/emp')
    console.log(res.data)
    this.name = res.data.message;
    this.headers = res.data.headers;
    this.desserts = res.data.results;
    this.headers.push({ text: 'Actions', "align": "center", value: 'name', sortable: false })
  }
}
</script>