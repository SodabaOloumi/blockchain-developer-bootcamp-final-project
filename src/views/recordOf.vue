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
  <button type="submit" class="btn btn-dark">Get LENGHT</button>
</form>
<br>
<div class="card" style="width:80%; margin-left:10% ; padding-top: 3%" >
    <div class="card-body" >
      <h3 class="card-title" style="font-family: cursive;">The number of records this address is</h3>
      <p class="card-text" > {{this.record}}</p>
    
     
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
      record:null,
      address:null
    };
  },
   
     methods:{
      async onSubmit(){
        
        this.record= await App.App.recordOf(this.address );
        console.log(this.address );
        console.log(this.record);
        this.address=null;
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