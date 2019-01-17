//window.Vuelib = {}; // global Object container; don't use var
//window.Vuelib.vueTestTable = [];


// http://momentjs.com/
Vue.filter('formatDate', function(value) {
  if (value) {
    return moment(String(value)).format('Do MMMM YYYY')
  }
})

/*
Vue.component('test', { 
	 props: ['source'],
	 template: '<div>{{ list. }}</div>',
	 data: function () {
	    return {
	    	list: null
	    }
	  },
	  methods: {
		  getUsers: function(){
	            this.$http.get(this.source).then(function(response){
	                this.list = response.data;
	            }, function(error){
	                console.log(error.statusText);
	            });
	        }
	    },
	    mounted: function () {
	        this.getUsers();
	    }
	})


 */
/*====================================================================================================*/
Vue.component('dashboard', { 
	 props: ['uid'],
	 
	 data: function () {
		
	    return {
	    	mytask:[],
	    	newtask:0,
	    	myproject:[],
	    	newproj:0,
	    	bar:[1,2,3,4,5,6,7,8,9,10,11,12]
	    }
	  },
	  methods: {
		  gettask:function(){			  
			  this.$http.get('/api/timesheets').then(function(response){
					this.mytask = response.data.filter(o => o.UID == this.uid);
					this.newtask = this.mytask.filter(function(o){
						var thisdate = new Date();
						//var thismount = thisdate.getMonth();
						//var thisyear = thisdate.getYear();
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String(thisdate)).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[0]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-01-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[1]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-02-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[2]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-03-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[3]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-04-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[4]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-05-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[5]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-06-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[6]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-07-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[7]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-08-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[8]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-09-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[9]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-10-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[10]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-11-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.bar[11]= this.mytask.filter(function(o){
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String('2018-12-01T00:00:00.00')).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					
					this.createg();
				}, function(error){
					console.log(error.statusText);
				});
		  },
		  getproject:function(){
			  this.$http.get('/api/projects').then(function(response){
					this.myproject = response.data.filter(o => o.UID == this.uid);
					this.newproj = this.myproject.filter(function(o){
						var thisdate = new Date();
						//var thismount = thisdate.getMonth();
						//var thisyear = thisdate.getYear();
						var taskcreate= Date(o.create_date);
						var m1= moment(String(taskcreate)).format('MMMM YYYY');
						var m2 = moment(String(thisdate)).format('MMMM YYYY');
						return  m1 == m2 ;
					}).length
					this.creategp();
				}, function(error){
					console.log(error.statusText);
				});
		  },
		  creategp:function(){
			  var data = [{
			        label: "Open",
			        data: this.myproject.filter(o => o.Status == 'Open').length
			    }, {
			        label: "Progress",
			        data: this.myproject.filter(o => o.Status == 'Progress').length
			    }, {
			        label: "Completed",
			        data: this.myproject.filter(o => o.Status == 'Completed').length
			    },{
			        label: "Defective",
			        data: this.myproject.filter(o => o.Status == 'Defective').length
			    },{
			        label: "Win",
			        data: this.myproject.filter(o => o.Status == 'Win').length
			    }, {
			        label: "Lost",
			        data: this.myproject.filter(o => o.Status == 'Lost').length
			    },{
			        label: "Cancel",
			        data: this.myproject.filter(o => o.Status == 'Cancel').length
			    }];

			    var plotObj = $.plot($("#flot-pie-project"), data, {
			        series: {
			            pie: {
			                show: true
			            }
			        },
			        grid: {
			            hoverable: true
			        },
			        tooltip: true,
			        tooltipOpts: {
			            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
			            shifts: {
			                x: 20,
			                y: 0
			            },
			            defaultTheme: false
			        }
			    }); 
		  },
		  
		  createg:function(){
			  var data = [{
			        label: "Open",
			        data: this.mytask.filter(o => o.Job_status == 'Open').length,
			        color: "#030303",
			    }, {
			        label: "Progress",
			        data: this.mytask.filter(o => o.Job_status == 'On Progress').length,
			        color: "#aababa",
			    }, {
			        label: "Completed",
			        data: this.mytask.filter(o => o.Job_status == 'Completed').length,
			        color: "#a9d7c0",
			    }, {
			        label: "Cancel",
			        data: this.mytask.filter(o => o.Job_status == 'Cancel').length,
			        color: "#aab3f4",
			    }];

			    var plotObj = $.plot($("#flot-pie-chart"), data, {
			        series: {
			            pie: {
			                show: true
			            }
			        },
			        grid: {
			            hoverable: true
			        },
			        tooltip: true,
			        tooltipOpts: {
			            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
			            shifts: {
			                x: 20,
			                y: 0
			            },
			            defaultTheme: false
			        }
			    }); 
			    var barOptions = {
			            series: {
			                bars: {
			                    show: true,
			                    barWidth: 0.6,
			                    fill: true,
			                    fillColor: {
			                        colors: [{
			                            opacity: 0.8
			                        }, {
			                            opacity: 0.8
			                        }]
			                    }
			                }
			            },
			            xaxis: {
			                tickDecimals: 0
			            },
			            colors: ["#1ab394"],
			            grid: {
			                color: "#999999",
			                hoverable: true,
			                clickable: true,
			                tickColor: "#D4D4D4",
			                borderWidth:0
			            },
			            legend: {
			                show: false
			            },
			            tooltip: true,
			            tooltipOpts: {
			                content: "x: %x, y: %y"
			            }
			        };
			        var barData = {
			            label: "bar",
			            data: [
			            	[1, this.bar[0]],
			                [2, this.bar[1]],
			                [3, this.bar[2]],
			                [4, this.bar[3]],
			                [5, this.bar[4]],
			                [6, this.bar[5]],
			                [7, this.bar[6]],
			                [8, this.bar[7]],
			                [9, this.bar[8]],
			                [10, this.bar[9]],
			                [11, this.bar[10]],
			                [12, this.bar[11]]
			            ]
			        };
			        $.plot($("#flot-bar-chart"), [barData], barOptions);
		  }
	  },
	  mounted: function () {
		  this.gettask();
		  this.getproject();
		  
	  },
	  template: `
	  <div>
        <div class="row">
            <div class="col-md-2">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">                   	
                        <span class="label label-success pull-right">All</span>
                        <h5>Task</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">{{mytask.length}}</h1>
                        <div class="stat-percent font-bold text-success">{{newtask}} <i class="fa fa-bolt"></i></div>
                        <small>New(This month)</small>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">All</span>
                        <h5>Project</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">{{myproject.length}}</h1>
                        <div class="stat-percent font-bold text-info"> {{newproj}}  <i class="fa fa-bolt"></i></div>
                        <small>New(This month)</small>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">All</span>
                        <h5>Task</h5>
                    </div>
                    <div class="ibox-content">

                        <div class="row">
                            <div class="col-md-3">
                                <h1 class="no-margins">{{mytask.filter(o => o.Job_status == 'Open').length}}</h1>
                                <small>Open</small>
                            </div>
                            <div class="col-md-3">
                                <h1 class="no-margins">{{mytask.filter(o => o.Job_status == 'On Progress').length}}</h1>
                                <small>Progress</small>
                            </div>
                            <div class="col-md-3">
                                <h1 class="no-margins">{{mytask.filter(o => o.Job_status == 'Completed').length}}</h1>
                                <small>Completed</small>
                            </div>
                            <div class="col-md-3">
                                <h1 class="no-margins">{{mytask.filter(o => o.Job_status == 'Cancel').length}}</h1>
                                <small>Cancel</small>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Project</h5>
                        <div class="ibox-tools">
                            <span class="label label-primary">All</span>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-md-3">
                                <h1 class="no-margins">{{myproject.filter(o => o.Status == 'Open').length}}</h1>
                                <small>Open</small>
                            </div>
                            <div class="col-md-3">
                                <h1 class="no-margins">{{myproject.filter(o => o.Status == 'Progress').length}}</h1>
                                <small>Progress</small>
                            </div>
                            <div class="col-md-3">
                                <h1 class="no-margins">{{myproject.filter(o => o.Status == 'Win').length}}</h1>
                                <small>Win</small>
                            </div>
                            <div class="col-md-3">
                                <h1 class="no-margins">{{myproject.filter(o => o.Status == 'Lost').length}}</h1>
                                <small>Lost</small>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div>
		  					<span class="pull-right text-right">
		  						<small>All Task : <strong>This year</strong></small>
		  					</span>
                            <h3 class="font-bold no-margins">
                                Task
                            </h3>
                            <small>Job compare by month</small>
                        </div>

                        <div class="m-t-sm">

                            <div class="row">
                                <div class="col-md-8">
                                    <div>
                                        <div class="flot-chart">
			                                <div class="flot-chart">
                                				<div class="flot-chart-content" style="width:400px;height:200px" id="flot-bar-chart"></div>
                            				</div>
			                            </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <ul class="stat-list m-t-lg">
                                        <li>
                                           <div class="flot-chart">
				                                <div class="flot-chart-pie-content" id="flot-pie-chart" style="width:200px;height:200px" ></div>
				                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>

                        <div class="m-t-md">
                            <small class="pull-right">
                                <i class="fa fa-clock-o"> </i>
                                Update on 
                            </small>
                            <small>
                                <strong>Job compare </strong> by month
                            </small>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right"> All </span>
                        <h5>Project</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="flot-chart">
		  						<div class="flot-chart-pie-content" id="flot-pie-project" style="width:200px;height:200px" ></div>
		  					</div>
		  				</div>                    
                    </div>
                </div>
            </div>

        </div>
	</div>
	  `,
	})

/*===================================================================================================*/
Vue.component('delete-project', { 
	 props: ['dataentry','uid'],
	 data: function () {
			var isdate = new Date();
			var tmplist=[];
			if(this.dataentry.Type=='Internal'){
				tmplist=["Open","Progress","Completed","Defective","Cancel"];
			}else{tmplist=["Open","Progress","Win","Lost","Cancel"];}
		    return {	    	
		    	statuslist:[
		    		{"type":"Internal","list":["Open","Progress","Completed","Defective","Cancel"]},
		    		{"type":"External","list":["Open","Progress","Win","Lost","Cancel"]}
		    	],
		    	optstatus: tmplist
		    }
		  },
		  methods: {
			  Cancel :function(){
				  location.reload();			  
			  },
			  Confirm :function(){
				  this.$http.delete('/api/projects/'+this.dataentry.id)
				  location.reload();			  
			  }
		    },
	 template: `
		 <div>
		 	<div class="ibox-tools">
		 		<a data-toggle="modal" :href="'#delete-form'+dataentry.id" class="btn btn-primary btn-xs">Delete</a>
		 	</div>
		 	<div :id="'delete-form'+dataentry.id" class="modal fade" aria-hidden="true">
		 		<div class="modal-dialog">
		 			<div class="modal-content">
		 				<div class="modal-body">
		 					<div class="row">
		 						<div class="form-group">
		 							<label>Project Name</label> <input disabled type="string" v-model="dataentry.Name" placeholder="ชื่อโครงการ"  class="form-control">
		 							<label>Project Description</label> <input disabled type="string" v-model="dataentry.Desc" placeholder="รายละเอียดโครงการ"  class="form-control">
		 							<label>Type</label>
		 							<select disabled class="form-control m-b" v-model="dataentry.Type" placeholder="ประเภท" v-on:change="optstatus=statuslist.filter(o => o.type == dataentry.Type)[0].list">
		 								<option>Internal</option> 
		 								<option>External</option>                                         
		 							</select>
		 							<label>Status</label>
			 						<select disabled class="form-control m-b" v-model="dataentry.Status" placeholder="สถานะ" v-on:change="">
			 							<option v-for="option in optstatus">{{option}}</option> 
			 						</select>
			 					</div>
		 					</div>
							<hr>
							<div class="row">
								<div class="col-sm-6" />
								<div class="col-sm-3">
								<button class="btn btn-sm btn-primary pull-right m-t-n-xs" v-on:click="Cancel">
										<strong>Cancel</strong>
									</button>  
								</div>
								<div class="col-sm-3">
									<button class="btn btn-sm btn-primary pull-right m-t-n-xs" v-on:click="Confirm">
										<strong>Confirm</strong>
									</button>  
								</div>											
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	`,
})

Vue.component('edit-project', { 
	 props: ['dataentry','uid'],
	 data: function () {
			var isdate = new Date();
			var tmplist=[];
			if(this.dataentry.Type=='Internal'){
				tmplist=["Open","Progress","Completed","Defective","Cancel"];
			}else{tmplist=["Open","Progress","Win","Lost","Cancel"];}
		    return {	    	
		    	statuslist:[
		    		{"type":"Internal","list":["Open","Progress","Completed","Defective","Cancel"]},
		    		{"type":"External","list":["Open","Progress","Win","Lost","Cancel"]}
		    	],
		    	optstatus: tmplist
		    }
		  },
		  methods: {
			  update:function(){
				  var isdate = new Date();
				  this.dataentry.Modify_date=isdate;
				  this.$http.put('/api/projects/'+this.dataentry.id,this.dataentry)
				  location.reload();			  
			  }
		    },
	 template: `
		 <div>
		 	<div class="ibox-tools">
		 		<a data-toggle="modal" :href="'#edit-form'+dataentry.id" class="btn btn-primary btn-xs">Edit</a>
		 	</div>
		 	<div :id="'edit-form'+dataentry.id" class="modal fade" aria-hidden="true">
		 		<div class="modal-dialog">
		 			<div class="modal-content">
		 				<div class="modal-body">
		 					<div class="row">
		 						<div class="form-group">
		 							<label>Project Name</label> <input type="string" v-model="dataentry.Name" placeholder="ชื่อโครงการ"  class="form-control">
		 							<label>Project Description</label> <input type="string" v-model="dataentry.Desc" placeholder="รายละเอียดโครงการ"  class="form-control">
		 							<label>Type</label>
		 							<select class="form-control m-b" v-model="dataentry.Type" placeholder="ประเภท" v-on:change="optstatus=statuslist.filter(o => o.type == dataentry.Type)[0].list">
		 								<option>Internal</option> 
		 								<option>External</option>                                         
		 							</select>
		 							<label>Status</label>
			 						<select class="form-control m-b" v-model="dataentry.Status" placeholder="สถานะ" v-on:change="">
			 							<option v-for="option in optstatus">{{option}}</option> 
			 						</select>
			 					</div>
		 					</div>
							<hr>
							<div class="row">
								<div class="col-sm-6" />
								<div class="col-sm-3" />
								<div class="col-sm-3">
									<button class="btn btn-sm btn-primary pull-right m-t-n-xs" v-on:click="update">
										<strong>Update</strong>
									</button>  
								</div>											
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	`,
})

Vue.component('project-item',{
	props: ['dataitem','uid'],
	data: function () {
	    return {
	    	list: []
	    }
	},
	methods: {
		getlist: function(){
			this.$http.get('/api/timesheets').then(function(response){
				this.list = response.data;
			}, function(error){
				console.log(error.statusText);
			});
		}
	},
	mounted: function () {
		this.getlist();
	},
	template:`<div class="faq-item">
                            <div class="row">
                                <div class="col-md-5">
                                    <a data-toggle="collapse" :href="'#faq'+dataitem.id" class="faq-question">{{dataitem.Name}}</a> 
                                    <p><small><strong>Detail:</strong>{{dataitem.Desc}}  Last Modify<i class="fa fa-clock-o"></i> {{dataitem.Modify_date |formatDate}}</small></p>                                    
                                </div>
                                <div class="col-md-3">
                                    <span class="small font-bold">Status</span>
                                    <div class="tag-list">
                                        <span class="tag-item">{{dataitem.Status}}</span>
                                        <span class="tag-item">Priject id: ({{dataitem.id}})</span>
                                        
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <span class="small font-bold">Summary Job </span><p>{{list.filter(o => o.Projid == dataitem.id).length}}</p><br/>
                                </div>
								<div class="col-md-2">
									<div class= "col-md-4"/>
									<div class= "col-md-5">
										<delete-project :dataentry=dataitem v-if="!list.filter(o => o.Projid == dataitem.id).length" />
									</div>
									<div class= "col-md-3">
										<edit-project :dataentry=dataitem />
									</div>									
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div :id="'faq'+dataitem.id" class="panel-collapse collapse faq-answer">
										<div class="row m-t-sm">
											<div class="col-lg-12">
												<div class="panel blank-panel">
													<table class="table table-striped">
								 						<thead>
						                                	<tr>
						                                    	<th>Status</th>
						                                        <th>Job Owner</th>
						                                        <th>Job Title</th> 	
						                                        <th>Job Progress</th>
						                                        <th>Jobid</th>
								 							</tr>
								 						</thead>
						                            	<tbody>
						                            	<tr v-for="entry in list.filter(o => o.Projid == dataitem.id)" >
						                            		<td>{{entry.Job_status}}</td>
						                            		<td>{{entry.Name_Surname}}</td>
						                            		<td>{{entry.Job_Header}}</td>
						                            		<td>{{entry.Job_progress}}</td>
						                            		<td>{{entry.id}}</td>
						                            	</tr>
						                            	</tbody>
						                            </table>
						                          	
												</div>
											</div>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
	`
});


Vue.component('project', { 
	 props: ['uid'],
	 template: `
	 <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInUp">

                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>All projects table</h5>
                            <div class="ibox-tools">
                                <a data-toggle="modal" href="#edit-form" class="btn btn-primary btn-xs">New Project</a>
                            </div>
                            <div id="edit-form" class="modal fade" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<div class="row">
		 										<label>Project Name</label> <input type="string" v-model="newproject.Name" placeholder="ชื่อโครงการ"  class="form-control">
		 										<label>Project Description</label> <input type="string" v-model="newproject.Desc" placeholder="รายละเอียดโครงการ"  class="form-control">
		 										<label>Type</label>
		 										<select class="form-control m-b" v-model="newproject.Type" placeholder="ประเภท" v-on:change="optstatus=statuslist.filter(o => o.type == newproject.Type)[0].list">
                                        				<option>Internal</option> 
                                        				<option>External</option>                                         
                                   				</select>
                                   				<label>Status</label>
		 										<select class="form-control m-b" v-model="newproject.Status" placeholder="สถานะ" v-on:change="">
                                        				<option v-for="option in optstatus">{{option}}</option> 
                                        				                                         
                                   				</select>
												
											</div>
											<hr>
											<div class="row">
												<div class="col-sm-6">
													
												</div>
												<div class="col-sm-3">
												</div>
												<div class="col-sm-3">
													<button class="btn btn-sm btn-primary pull-right m-t-n-xs" v-on:click="addproject">
				 										<strong>Add Project</strong>
				 									</button> 
												</div>											
											</div>
										</div>
									</div>
								</div>
							</div>
                        </div>
                        <div class="ibox-content">
                            <project-item v-for="item in listproject" :dataitem=item :uid=uid />
		 				</div>
                    </div>
                </div>
            </div>
        </div>
	 `,
	 data: function () {
		var isdate = new Date();
	    return {	    	
	    	statuslist:[
	    		{"type":"Internal","list":["Open","Progress","Completed","Defective","Cancel"]},
	    		{"type":"External","list":["Open","Progress","Win","Lost","Cancel"]}
	    	],
	    	optstatus:null,
	    	newproject: {
	    		"Name": "",
	    		"Status": "",
	    		"Desc": "",
	    		"Type": "",
	    		"UID": this.uid,
	    		"Modify_date": isdate,
	    		"Create_date": isdate,
	    	},
	    	listproject:{}
	    }
	  },
	  methods: {
		  addproject:function(){
			  //alert(JSON.stringify(this.newproject))
			  this.$http.post('/api/projects',this.newproject)
			  location.reload();			  
		  },
		  projectlist:function(){
			  this.$http.get('/api/projects').then(function(response){
	                this.listproject = response.data.filter(o => o.UID == this.uid);
	            }, function(error){
	                console.log(error.statusText);
	            });
			  //alert(JSON.stringify(this.listproject))
		  }
	    },
	    mounted: function () {
	    	this.projectlist();
	    }
	})



/*====================================================================================================*/

Vue.component('Timesheet1', {
	 props: ['source','uid'],
	 template: `<div>
		 	<div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>New Timesheet table</h5>
	                        <div class="ibox-tools">
	                            <!-- <a class="collapse-link"> <i class="fa fa-chevron-up"></i></a> -->
	                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                                <i class="fa fa-wrench"></i>
	                            </a>
	                            <ul class="dropdown-menu dropdown-user">
	                                <li><a href="#">Config Option 1</a> </li>
	                                <!-- <li><a href="#">Config Option 2</a> </li> --> 
	                            </ul>
	                            	<!--  <a class="close-link"> <i class="fa fa-times"></i> </a> -->
	                        </div>
                        </div>
                        <div class="ibox-content">
                         <div class="table-responsive">
                         	<vue-test-table />
		 					 <New_Job name='#newjob-form' :UID=uid />
		 					 <xedit :source="source" :uid=uid />
                         </div> 		 				
                        </div>
                    </div>
                </div>
            </div>
		 </div>
		
	 `,
	 data: function () {
	    return {}
	  },
	 methods: {}
	});

Vue.component('vue-test-table', {
  data: function () {
	    return {
	    	datasource: null
	    }
	  },
  mounted: function () {
	  this.mounttable();
  },
  methods: {
	  mounttable:function(){
		  /*
		  var datatable=[];
		  this.$http.get('/api/timesheets').then(function(response){
			  datatable = response.data;
          }, function(error){
              console.log(error.statusText);
          });
		  */
		  var url  = "/api/timesheets";
		  var datatable=[];
		  var xhr  = new XMLHttpRequest()
		  xhr.open('GET', url, false)
		  xhr.onload = function () {
		  	var data = JSON.parse(xhr.responseText);
		  	if (xhr.readyState == 4 && xhr.status == "200") {
		  		datatable= data;
		  	} else {
		  		console.error(data);
		  	}
		  }
		  xhr.send(null);
		  
		  var vueTestTable = [];
		  //this.datasourcs=Vuelib.datatable
		  datatable.forEach(function(entry){
			  var temparray=[];
			  var lender=`<a data-toggle="modal" class="btn btn-primary" href="#modal-form`+entry.id+`">Edit</a>	`;
			  var xdate = moment(String(entry.Job_date)).format('DD MMM YY')
			  if(entry.UID==Vuelib.UID){
				  temparray.push(entry.Job_Header);
				  temparray.push(entry.Job_detail);
				  temparray.push(entry.Job_Hours);
				  temparray.push(xdate);
				  temparray.push(entry.Job_progress);
				  temparray.push(entry.Job_status);
				  temparray.push(lender);
				  vueTestTable.push(temparray);
				  
			  }			  
			});
		  Vuelib.table = $('.vue-test-table').dataTable({"order": [[ 3, "desc" ]],responsive: true,"data": vueTestTable,"dom": 'l<"clear">frtip'});
	  }
  },  
  template: `
	  <div>
	  <table class="table table-striped table-bordered table-hover vue-test-table" >
	  	 <thead>
	  	   <tr>
                <th>Job Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>Detail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th>Hours</th>
                <th>Deadline</th>
                <th>Progress</th>
                <th>Status</th>
                <th data-orderable="false">Action</th>
            </tr>
          </thead>
	  </table>
	  
	 </div>
  `
});


Vue.component('edit-model', {
	props: ['xid','data','uid'],
	data: function () {
	    return {
	    	sow:null,
	    	opt:null,
	    	project:[],
	    	projectlist:[],
	    	jobstatus:[
	    		'Open',
	    		'On Progress',
	    		'Completed',
	    		'Cancel'
	    	]
	    }
	},
	methods: {
		fdel:function(){
			this.$http.delete('/api/timesheets/'+this.data.id)
	    	location.reload();
		},
		update:function(){
			 this.data.modify_date=new Date();
			 if (this.data.Job_status==='Completed'){
				 this.data.Completed_date=new Date();
				 this.data.Job_progress=100;
			 }
			
	    	 this.$http.post('/api/timesheets/'+this.data.id+'/replace',this.data)
	    	  //$('#modal-form'+this.xid).modal('hide')
	    	 location.reload()
	      },
	    sethour: function(){
	    	  this.data.Hours=this.sow.Hours.filter(function (n){
	    		  return n.Name=="Guide line";
	    	  });
	      },
	    getsow: function(){
	            this.$http.get('/api/sows').then(function(response){
	                this.sow = response.data;
	            }, function(error){
	                console.log(error.statusText);
	            });
	        },
	    getproject: function(){
	            this.$http.get('/api/projects').then(function(response){
	                this.project = response.data.filter(o => o.UID == this.uid);
	            }, function(error){
	                console.log(error.statusText);
	            });
	        }
	    },
	    mounted: function () {
	    	this.getsow();
	    	this.opt=this.data.Job_SOW;
	    	this.getproject();
	    },
	template:`
		<div>
			<div class="text-center">
				<!-- <a data-toggle="modal" class="btn btn-primary" :href="'#modal-form'+xid">Edit</a> -->
			</div>
				<div :id="'modal-form'+xid" class="modal fade" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<div class="row">
									<div class="col-sm-6 b-r">
				 						<div class="form-group">
				 							<p><label>Job Name</label> {{data.Job_Header}} </p>
				 							<p><label>Job Type</label> {{data.Job_Type}} </p>
				 							<p><label>SoW</label> {{data.Job_SOW}}</p>
				 							<label>Job Hours</label> {{data.Job_Hours}}
		                                    <p><label>Deadline</label> {{data.Job_date|formatDate}} </p>
		                                    <label>Brands</label>
		                                    	<ul>
		                                    		<li v-for="tech in data.Brands">{{tech}}</li>
		                                    	</ul>
		                                    <label>Base On Technology</label>
		                                    	<ul>
		                                    		<li v-for="tech in data.Base_Technology">{{tech}}</li>
		                                    	</ul>
		                                    <label>Contact</label>
		                                    	<ul>
		                                    		<li v-for="contact in data.contract">{{contact}}</li>
		                                    	</ul>
				 						</div>		
				 					</div>
				 					<div class="col-sm-6">
				 						<div class="form-group">
					 							<label>Scope Of Works</label> 
				 								<select class="form-control m-b" v-model="opt" v-on:change='data.Job_Hours=opt.Hours;data.Job_SOW=opt.Name' :disabled="data.Job_status == 'Completed'|| data.Job_status == 'Cancel'"" >
				 									<option selected >{{data.Job_SOW}}</option>
			                                        <option v-for="option in sow" :value=option v-if='option.GroupName=== data.Job_Type'>{{option.Name}}</option>                                       
			                                    </select>
					 							<label>Job Detail</label> <input type="text" v-model="data.Job_detail" placeholder="รายละเอียด" class="form-control" :disabled="data.Job_status == 'Completed'|| data.Job_status == 'Cancel'"" >
					 							<label>Job Progress</label> <input type="number" v-model="data.Job_progress" placeholder="ความคืบหน้า" class="form-control" :disabled="data.Job_status == 'Completed'|| data.Job_status == 'Cancel'"" >
					 							<label>Job status</label> 
					 							<select class="form-control m-b" v-model="data.Job_status" >
			                                        <option v-for="option in jobstatus">{{option}}</option>                                       
			                                    </select>
			                                    <label>Project-Track</label> 
						 							<select class="form-control m-b" v-model="data.Projid">
						 								<option value=""></option>
				                                        <option v-for="option in project" :value=option.id >{{option.Name}}</option>                                       
				                                    </select>
				 							</div>
				 						<div class="row">
				 							<div class="col-sm-6"/>
				 							<div class="col-sm-3">
				 								<button class="btn btn-sm btn-primary pull-right m-t-n-xs" v-on:click="update">
				 									<strong>Update</strong>
				 								</button> 
				 							</div>
				 							
				 							<div class="col-sm-3">
				 								<button class="btn btn-sm btn-primary pull-right m-t-n-xs " v-on:click="fdel">
				 									<strong>Delete</strong>
				 								</button>
				 							</div>
				 						</div>
				 					</div>
				
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	`
});


Vue.component('xedit', {
	 props: ['source','uid'],
	 template: `<div>
		 			<edit-model v-for="data in list" :xid=data.id :data=data :uid=uid />
		 		</div>`,
	 data: function () {
	    return {
	    	list: null
	    }
	  },
	  methods: {
		  getUsers: function(){
	            this.$http.get(this.source).then(function(response){
	                this.list = response.data.filter(o => o.UID == this.uid);
	            }, function(error){
	                console.log(error.statusText);
	            });
	        }
	    },
	    mounted: function () {
	        this.getUsers();
	    }
	})
/*====================================================================================================*/


Vue.component('New_Job', {
	props:['name','UID'],
	 template: 
		 `
		 <div class="ibox-content">
          	<div class="text-center">
		 		<a data-toggle="modal" class="btn dim btn-sm btn-primary pull-right m-t-n-xs" :href=name+UID >Add Job</a>
		 	</div>
		 </div>
		 `
	})
	
Vue.component('c-form', {
	 props: ['f_id','f_name','f_detail','profile'],
	 template: 
		 `
		 <div :id=f_id class="modal fade" aria-hidden="true">
		 	<div class="modal-dialog">
		 		<div class="modal-content">
		 			<div class="modal-body">
		 				<div class="row">
		 					<div class="col-sm-6 b-r"><h3 class="m-t-none m-b">{{f_name}}</h3>
		 						<p>{{f_detail}}</p>
		 						<div class="form-group">
		 							<label>Job Name</label> <input type="string" v-model="timesheet.Job_Header" placeholder="หัวข้องาน"  class="form-control">
		 							<label>Job Detail</label> <input type="string" v-model="timesheet.Job_detail" placeholder="รายละเอียด" class="form-control">
		 							<label>Job Type</label> 
		 							<select class="form-control m-b" v-model="timesheet.Job_Type" v-on:change="list=sowlist.filter(data => data.GroupName == timesheet.Job_Type)">
                                        <option v-for="option in jobtype">{{option.Name}}</option>                                       
                                    </select>
                                    <label>Scope</label> 
		 							<select class="form-control m-b" v-model="timesheet.Job_SOW" v-on:change="timesheet.Job_Hours=sowlist.filter(data => data.Name == timesheet.Job_SOW)[0].Hours;">
                                        <option v-for="option in list">{{option.Name}}</option>                                       
                                    </select>
                                    <label>Work Hours</label> {{timesheet.Job_Hours}}<br> 
                                    <label>Deadline</label> <input type="date" v-model="timesheet.Job_date" placeholder="วันส่งงาน" class="form-control">
                                    
		 						</div>		
		 					</div>
		 						<div class="col-sm-6">
		 						
		 							<div class="form-group">
			 							<label>Project-Track</label> 
			 							<select class="form-control m-b" v-model="timesheet.Projid">
	                                        <option v-for="option in projectlist.filter(o => o.Status == 'Open'||o.Status == 'Progress' )" :value=option.id >{{option.Name}}</option>                                       
	                                    </select>
			 							<label>Base On Technology</label>
			 								<select class="form-control" size="7" multiple="" v-model="timesheet.Base_Technology">
			 									<option v-for="option in tech">{{option.Name}}</option>
			 								</select>
			 							<label>Brands</label>
			 								<select class="form-control" size="10" multiple="" v-model="timesheet.Brands">
			 									<option v-for="option in brands">{{option.Name}}</option>
			 								</select>
		 							
		 						</div>
		 					</div>
		 				</div>
		 				<hr>
		 						<div>
		 							<button class="btn btn-sm btn-primary pull-right m-t-n-xs" v-on:click="addjob">
		 								<strong>Add Job</strong>
		 							</button>
		 						
		 						</div>		 				
		 			
		 		</div>
		 	</div>
		 </div>
		</div>
		 `,
	 data: function () {
			 	var isdate = Date.now();
			    return {
			    	user: null,
			    	newct:null,
			    	brands:null,
			    	jobtype:null,
			    	tech:null,
			    	list:null,
			    	sowlist:null,
			    	projectlist:[],
			    	timesheet:{
			    	    "Name_Surname": "",
			    	    "Job_Type": "",
			    	    "Job_SOW": "",
			    	    "Base_Technology": [],
			    	    "UID": 1,
			    	    "Job_Header": "",
			    	    "Job_detail": "",
			    	    "create_date": isdate,
			    	    "Job_date": isdate,
			    	    "modify_date": isdate,
			    	    "Job_Hours": 0,
			    	    "Job_progress": 0,
			    	    "contract": [],
			    	    "Brands":[],
			    	    "Job_status": "Open",
			    	    "Projid":"",
			    	    "remark": [
			    	      "0"
			    	    ]
			    	  }			    	
			    }
			  },
	 methods: {
		 getUsers: function(){
			 this.$http.get(this.profile).then(function(response){
				 this.user = response.data;
				 this.timesheet.Name_Surname= this.user.Name+' '+this.user.Sname
				 this.timesheet.UID= this.user.uid
				 this.timesheet.create_date=new Date()
				 //this.timesheet.Job_date = this.timesheet.create_date
				 this.timesheet.modify_date=this.timesheet.create_date
			 }, function(error){
				 console.log(error.statusText);
			 });
		 },
		 getBrands: function(){
			 this.$http.get('/api/brands').then(function(response){
				 this.brands = response.data;
			 }, function(error){
				 console.log(error.statusText);
			 });
		 },
		 getjobtype: function(){
			 this.$http.get('/api/jobtypes').then(function(response){
				 this.jobtype = response.data;
			 }, function(error){
				 console.log(error.statusText);
			 });
		 },
		 gettech: function(){
			 this.$http.get('/api/teches').then(function(response){
				 this.tech = response.data;
			 }, function(error){
				 console.log(error.statusText);
			 });
		 },
		 getproj: function(){
			 this.$http.get('/api/projects').then(function(response){
				 this.projectlist = response.data.filter(o => o.UID == this.user.uid);
			 }, function(error){
				 console.log(error.statusText);
			 });
		 },
		 addjob:function(){
			 this.$http.post('/api/timesheets',this.timesheet)
			 $('#'+this.f_id).modal('hide')
			 location.reload();
			 //this.$emit('AddJob')
		 },
		 addct:function(){
			 //this.timesheet.Job_Hours+=1;
			 this.timesheet.contract.push(this.newct);
		 },
		 getsow:function(){
			 this.$http.get('/api/sows').then(function(response){
				 this.sowlist = response.data;
			 }, function(error){
				 console.log(error.statusText);
			 });
		 }
			       
	},
	mounted: function () {
		this.getUsers();
		this.getBrands();
		this.getjobtype();
		this.gettech();
		this.getsow();
		this.getproj();
	}
});
			
/*====================================================================================================*/
Vue.component('profile', {
  props: ['source'],
  // just like data, the prop can be used inside templates
  // and is also made available in the vm as this.message
  data: function () {
	    return {
	    	profiles: {
	    		"picture":'',
	    		"Name":'',
	    		"Sname":'',
	    		"position":''
	    	}
	    }
	  },
  methods: {
	getUsers: function(){
		this.$http.get(this.source).then(function(response){
			this.profiles = response.data;
		}, function(error){
			console.log(error.statusText);
		});
	}
  },
  mounted: function () {
	this.getUsers();
  },
  template: `
	<li class="nav-header">
		<center>
		<div class="dropdown profile-element"> 
			<span>
				<img alt="image" class="img-circle" v-bind:src='profiles.picture' />
			</span>
			<span class="clear"> 
				<span class="block m-t-xs"> 
					<strong class="font-bold">{{profiles.Name}} {{profiles.Sname}}</strong>
				</span> 
				<span class="text-muted text-xs block">
				{{profiles.position}}</b>
				</span>
			</span> 
		</div>
		</center>
        <div class="logo-element">
			IN+
		</div>
		
	</li>
`
});

/*====================================================================================================*/

Vue.component('header-layout',{
	template:`
	        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <slot></slot>
            </ul>
        </nav>
	`
});

Vue.component('logout',{
	template:'<li><a href="auth/logout"><i class="fa fa-sign-out"></i> Log out</a></li>'
});

Vue.component('welcome-message',{
	template:'<li><span class="m-r-sm text-muted welcome-message"><slot></slot></span></li>'
});

Vue.component('app-menus',{
	props: {
		app_href: {
		  type: String,
		  default: '#'
		},
		app_name: {
		  type: String,
		  default: 'Dashboards'
		},
		app_isActive:
		{
		  type: Boolean,
		  default: false
		},
		app_icont:{
			type: String,
			default: 'fa fa-th-large'
		},
		menus:{
			type: Array,
			default: function () {
				return null
			}
		}
	},
	template:`
		<li>
			<a href=app_href  >
				<i :class=app_icont></i> <span class="nav-label">{{app_name}}</span> 
				<span class="fa arrow"></span>
			</a>
			<ul class="nav nav-second-level">
				<li v-for="menu in menus" :class="{'active':menu.isActive}">
					<a :href="menu.href" >{{menu.label}}  </a>
				</li>
			</ul>
        </li>
	`
});

Vue.component('menu-list', {
	props: {
		label:{
			type: String,
			default:'MyMenu'
		},
		href:{
			type: String,
			default:'#'
		}
	},
    template: '<li><a :href=href @click="selectTab(tab)>{{label}}</a></li>'

    })
	
	
Vue.component('profile-menu-list', {
	props: {
		label:{
			type: String,
			default:'MyMenu'
		},
		href:{
			type: String,
			default:'#'
		}
	},
    template: 
	'<li><a :href=href>{{label}}</a></li>'
    })
	
	
Vue.component('conf', {
	 props: ['uid','uname'],
	 template: 
		 `
		 <div class="row">
                    <div class="panel blank-panel">

                        <div class="panel-heading">
                            <div class="panel-title m-b-md"><h4></h4></div>
                            <div class="panel-options">

                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-laptop"></i></a></li>
                                    <li class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-desktop"></i></a></li>
                                    <li class=""><a data-toggle="tab" href="#tab-3"><i class="fa fa-signal"></i></a></li>
                                    <li class=""><a data-toggle="tab" href="#tab-4"><i class="fa fa-bar-chart-o"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel-body">

                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                	<div class="col-md-6">
                						<div class="ibox float-e-margins">
		 									<div class="ibox-title">
                        						<h5>Change Password <small>Change Password</small></h5>
		 										
                    						</div>
                    						<div class="ibox-content">
                    							<form role="form">
	                                    			<div class="form-group"><label>oldPassword</label> <input type="password" placeholder="Old Password" class="form-control"></div>
	                                    			<div class="form-group"><label>New Password</label> <input type="password" placeholder="New Password" class="form-control"></div>
	                                    			<div class="form-group"><label>Confirm Password</label> <input type="password" placeholder="Confirm Password" class="form-control"></div>
	                                    			<div>
	                                        			<button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="submit"><strong>Change</strong></button>
	                                        			<div><br>{{user}}{{uname}}{{uid}}</div>
	                                    			</div>
                                				</form>
                           					</div>
		 								</div>
                    				</div>
                                </div>
                                <div id="tab-2" class="tab-pane">
                                	aaa
                                </div>
                                <div id="tab-3" class="tab-pane">
                                	<strong>test3</strong>
                                </div>
                                <div id="tab-4" class="tab-pane">
                                	<strong>test4</strong>
                                </div>
                       		</div>
		`,
	 data: function () {
	    return {
	    	user: {
	    		username:""
	    	}
	    	
	    }
	  },
	  methods: {
		  getusername:function(){
	    	   this.user.username='test';
	       }
	    },
	    mounted: function () {
	    	getusername();
	    }
	})



