<template>
  <div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
      <h2>{{name}}</h2>
      <ol class="breadcrumb">
        <li><a href="/">Home</a></li><li class="active"><strong>{{name}}</strong></li>
      </ol>
      </div>
      <div class="col-lg-2">

      </div>
      <div class="row">
        <div class="ibox float-e-margins">
          <div class="ibox-title">
            <h5>{{name}} <small>{{detail}}</small></h5>
            <div class="ibox-tools">
                <div class="text-center">
                  <a data-toggle="modal" class="btn btn-primary" href="#New-form"> 
                    <v-icon small class="mr-2">add </v-icon> New
                  </a>
                </div>
            </div>
          </div>
          <div class="ibox-content">
            <div class="row">
              <v-data-table
                :headers="headers"
                :items="desserts"
                class="elevation-1"
              >
              <template slot="items" slot-scope="props">
                <td>{{ props.item.Emp_Code}}</td>
                <td class="text-xs-left"><a href ="#">{{ props.item.Name }}</a></td>
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
          </div>
        </div>
      </div>
    </div>
    <div>
      <div id="New-form" class="modal fade" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              <div class="row">
                <div>
                  Add New Data Form
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="edit-form" class="modal fade" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              <div class="row">
                <div>
                  Edit Data Form
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="delete-form" class="modal fade" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              <div class="row">
                <div>
                  Delete Form
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
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
  layout: 'App',
  data() {
    return {
      name: '',
      detail:'ข้อมูลพนักงาน',
      headers: [],
      desserts:[]
    }
  },
  async created() {
    console.log('created')
    let res = await this.$http.get('/emp')
    console.log(res.data)
    this.name = res.data.message;
    this.headers = res.data.headers;
    this.desserts = res.data.results;
    this.headers.push({ text: 'Actions', "align": "center", value: 'name', sortable: false })
  }
}
</script>