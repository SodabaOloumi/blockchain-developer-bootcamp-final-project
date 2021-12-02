<template>
<div class="grant">
  <Header />
		  <Sidebar />
<navbarRecord />
<div >
  
 <form @submit.prevent="onSubmit" >
  <div class="form-group">
    <label for="exampleInputEmail1">Patient Address</label>
    <input type="text" class="form-control" id="patientAddress" name="patientAddress" v-model="patientAddress" aria-describedby="emailHelp" placeholder="Enter Patient Address">
  </div>
 <div class="form-group">
  
    <label for="exampleInputEmail1">Viewner Address</label>
    <input type="text" class="form-control" id="viewner" name="viewner" v-model="viewner" aria-describedby="emailHelp" placeholder="Enter Viewner Address">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Record Name</label>
    <input type="text" class="form-control" id="recordName" name="recordName" v-model="recordName" aria-describedby="emailHelp" placeholder="Enter record name">
  </div>
  <button type="submit" class="btn btn-dark">Revork Permission</button>
</form>
</div>
</div>
</template>

<script>
import navbarRecord from "../component/record";
import Header from "../component/header.vue";
import Sidebar from "../component/sidebar.vue";
import App from "../index";
export default {
components:{
    navbarRecord:navbarRecord,
    Header:Header,
    Sidebar:Sidebar
  },
   data() {
    return {
      patientAddress: null,
      viewner: null,
      recordName:null,
    };
  },
   methods: {
    onSubmit() {
      let p = {
          patientAddress: this.patientAddress,
          viewner: this.viewner,
          recordName:this.recordName,
        
        
      };
  
      App.App.revorkPermission(p.patientAddress, p.viewner , p.recordName);
     
      
      this.patientAddress = null;
      this.viewner = null;
      this.recordName=null;
      
    }
  },
}
</script>

<style>
form{
  width: 80%;
  margin-left:10% ;
  padding-top: 3%;
}
.grant{
    width: 80%;
    margin-left:10% ;
}
</style>