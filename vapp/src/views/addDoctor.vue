
<template class="body">
  <div>
	  <Header />
		  <Sidebar />
		  
<div class="container" >

        <div class="row centered-form" style="margin-left:2% ; padding-top: 1%;">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading">
					<img class="card-img-top" src="https://st3.depositphotos.com/9880800/i/600/depositphotos_140176316-stock-photo-female-doctor-in-hospital.jpg">
			    		<br>
						<h3 class="panel-title">Please Register  </h3>
			 			</div>
			 			<div class="panel-body">
			    		<form role="form" @submit.prevent="onSubmit">
			    			
			    				
			    				<div class="form-group">
			    				<input type="text" name="address" id="address" v-model="address" class="form-control input-sm" placeholder="Enter Your Address">
			    			</div>
			    			

			    			<div class="form-group">
			    				<input type="text" name="fullName" id="fullName" v-model="fullName" class="form-control input-sm" placeholder="Enter Your  FullName">
			    			</div>

			    			
			    		
			    			
			    			<button type="submit" class="btn btn-dark btn-block ">Register</button>
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
		  </div>
	
</template>

<script>
import App from "../index";
import Header from "../component/header.vue";
import Sidebar from "../component/sidebar.vue";

export default {
components:{
    
    Header:Header,
    Sidebar:Sidebar
  },
   data() {
    return {
      address: null,
      fullName: null,
    };
  },
   methods: {
    onSubmit() {
      let p = {
          address: this.address,
          fullName: this.fullName, 
      };
  
      App.App.addDoctor(p.address, p.fullName );
     console.log(p.address, p.fullName);
      
      this.address = null;
      this.fullName = null;
      
    }
  },
}
</script>
<style >
body{
   
    height:1000px;
	margin:0;

	
}
.row centered-form{
	padding-left: 30px;
}

.centered-form .panel{
	background: rgba(153, 153, 149, 0.876)20px 20px 20px;
	box-shadow: rgba(48, 42, 42, 0.952) 20px 20px 20px;
	margin-top: 60px;
	width:540px ;
	height: 640px;
}

</style>