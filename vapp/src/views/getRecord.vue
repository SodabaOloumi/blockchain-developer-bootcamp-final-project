<template>
<div class="grant">
  <Header />
		  <Sidebar />
 <navbarRecord />
 <div >
    <div>
        <form @submit.prevent="onSubmit">
                 <div class="form-group">
    <label for="exampleInputEmail1">Patient address</label>
    <input type="text" class="form-control" id="address"  name="address" v-model="address" aria-describedby="emailHelp" placeholder="Enter Patient address">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Record ID</label>
    <input type="text" class="form-control" id="recordId" name="recordId" v-model="recordId" aria-describedby="emailHelp" placeholder="Enter record ID">
  </div>
  <button type="submit" class="btn btn-dark">Get Record</button>
</form>
<br>
<div class="card" style="width:80%; margin-left:10% ; padding-top: 3%" >
    <div class="card-body" >
      <h3 class="card-title" style="font-family: cursive;">Record details</h3>
      <p class="card-text" > His/Her Full Name :   {{this.record._fullName}}</p>
      <p class="card-text">His/Her Doctor Address :   {{this.record._doctorAddress}}</p>
      <p class="card-text">His/Her patient Address :  {{this.record._patientAddress}}</p>
      <p class="card-text">Chief Complient :  {{this.record._cc}}</p>
      <p class="card-text">Present Illness :  {{this.record._pi}}</p>
      <p class="card-text">Any other Comment :  {{this.record._comment}}</p>
      <p class="card-text">Medical History :   {{this.record._mh}}</p>
      
      <!-- <h1>{{this.address}}</h1>
      <h1>{{this.recordName}}</h1> -->
    
  </div>
  <br>
  
  
  
</div>
</div>

</div>
</div>
</template>

<script>
import navbarRecord from "../component/record.vue";
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
      address:null,
      recordId:null,
      
      record:{}
    };
  },
   
     methods:{
      async onSubmit(){
     let p = {
          address: this.address,
          recordId: this.recordId, 
      };
     
     this.record= await App.App.getRecord(p.address, p.recordId);
    
     console.log(this.record._doctorAddress ,this.record);
      
      this.address=null;
      this.recordId=null;
     }
      
    } 
  
}
</script>

<style>
form{
  width: 80%;
  margin-left:10% ;
  padding-top: 3%;
  margin-top: 0%;
  
}
.grant{
    width: 80%;
    margin-left:10% ;
   
}
.card-text{
  font-size: 20px;
  margin: 12px; 
  font-family: cursive;
}
.card{
   /* height: 800px; */
  background-color: #cccccc;
}
</style>