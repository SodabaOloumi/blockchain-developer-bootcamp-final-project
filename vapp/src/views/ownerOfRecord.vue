<template>
<div class="grant">
  <Header />
		  <Sidebar />
 <navbarRecord />
    <div >
    
        <form @submit.prevent="onSubmit">

            <div class="form-group">
              <label for="exampleInputEmail1">Record Id</label>
              <input type="text" class="form-control" id="recordId"  name="recordId" v-model="recordId" aria-describedby="emailHelp" placeholder="Enter recordId">
            </div>
            <button type="submit" class="btn btn-dark"> Owner</button>
        </form>
        <br>

      <div class="card" style="width:80%; margin-left:10% ; padding-top: 3%" >
          <div class="card-body" >
             <h3 class="card-title" style="font-family: cursive;"> The owner of or patient address this record is</h3>
             <p class="card-text" >   {{this.owner}}</p>
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
      owner:null,
      recordId:null
    };
  },
   
     methods:{
      async onSubmit(){
        console.log(this.recordId );
        this.owner= await App.App.ownerOfRecord(1); 
        console.log(this.owner);
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