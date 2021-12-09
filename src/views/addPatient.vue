
<template class="body">
  <div>
	  	  <Header />
		  <Sidebar />
<div class="container">

        <div class="row centered-form" style="margin-left:2% ; padding-top: 1%;">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading">
					<img class="card-img-top" src="data:image/jpeg;base64,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">
			    		<br>
						<h3 class="panel-title">Please Register  </h3>
			 			</div>
			 			<div class="panel-body">
			    		<form role="form" @submit.prevent="onSubmit">
			    			
			    				
			    				<div class="form-group">
			    				<input type="text" name="address" id="address" v-model="address" class="form-control input-sm" placeholder="Enter Your Address">
			    			</div>
			    			

			    			<div class="form-group">
			    				<input type="text" name="fullName" id="fullName" v-model="fullName" class="form-control input-sm" placeholder="Enter Your FullName">
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
  
      App.App.addPatient(p.address, p.fullName );
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
/* .centered-form{
	margin-top: 60px;
	background: #525252;
	height: 620px;
	
} */

.centered-form .panel{
	background: rgba(153, 153, 149, 0.876)20px 20px 20px;
	box-shadow: rgba(48, 42, 42, 0.952) 20px 20px 20px;
	margin-top: 60px;
	width:440px ;
	height: 440px;
}

</style>