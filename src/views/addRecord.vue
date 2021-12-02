<template>
<div class="grant">
  <Header />
		  <Sidebar />
<navbarRecord />
<div >
  
 <form @submit.prevent="onSubmit">
  <div class="form-row">
    <div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="">First and last name</span>
  </div>
  <input type="text" id="fullName" name="fullName" v-model="fullName" class="form-control">
</div>
  </div>
  <br>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">Patient Ethereum Address</label>
      <input type="text" class="form-control" name="patientAddress" id="patientAddress" v-model="patientAddress" placeholder="Enter your address">
    </div>
    <div class="form-group col-md-6">
      <label for="inputCity">Doctor Ethereum Address</label>
      <input type="text" class="form-control" id="doctorAddress" name="doctorAddress" v-model="doctorAddress" placeholder="Enter your address">
    </div>
  </div>
  <br>
 
  <div class="form-group">
    <label for="inputAddress">Chief Complient</label>
    <textarea type="text" name="cc" id="cc" v-model="cc" class="form-control"  placeholder="CC"></textarea>
  </div>
  <br><br>
  <div class="form-group">
    <label for="inputAddress">Present Illness</label>
    <textarea type="text" class="form-control" id="pi" name="pi" v-model="pi" placeholder="PI"></textarea>
  </div>
  <br>
  <div class="form-group">
    <label for="inputAddress">Any other Comment</label>
    <textarea type="text" class="form-control" id="anyComment" name="anyComment" v-model="anyComment" placeholder="Enter your comment"></textarea>
  </div>
  <br><br>
  
  <div class="form-group">
    <label for="inputAddress">Medical History</label>
    <textarea type="text" class="form-control" id="mh" name="mh" v-model="mh" placeholder="Medical History"></textarea>
  </div>
<<<<<<< HEAD
  <div class="form-group ">
      <label for="inputZip">Record Id</label>
=======
 <div class="form-group ">
      <label for="inputZip">recordName</label>
      <input type="text" class="form-control" id="recordName" name="recordName" v-model="recordName" placeholder="Enter record's name">
    </div>
  <div class="form-group ">
      <label for="inputZip">Record ID</label>
>>>>>>> 814d91f902f61de8c861f5e20bb583d96204da76
      <input type="text" class="form-control" id="recordId" name = "recordId" v-model="recordId" placeholder="Enter record's id">
    </div>
  <button type="submit" class="btn btn-dark">Add Record</button>
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
      fullName:null,
      patientAddress: null,
      doctorAddress: null,
      cc: null,
      pi: null,
      ph: null,
      anyComment: null,
      mh: null,
<<<<<<< HEAD
=======
      recordName:null,
>>>>>>> 814d91f902f61de8c861f5e20bb583d96204da76
      recordId:null
    };
  },
   methods: {
    onSubmit() {
      let R = {
        fullName:this.fullName,
        patientAddress: this.patientAddress,
        doctorAddress: this.doctorAddress,
        cc: this.cc,
        pi: this.pi,
        anyComment: this.anyComment,
        mh: this.mh,
<<<<<<< HEAD
=======
        recordName:this.recordName,
>>>>>>> 814d91f902f61de8c861f5e20bb583d96204da76
        recordId:this.recordId
        
        
      };
  
      App.App.addRecord( R.fullName,R.patientAddress , R.doctorAddress ,
<<<<<<< HEAD
  R.cc ,R.pi ,R.anyComment ,R.mh ,R.recordId);
=======
  R.cc ,R.pi ,R.anyComment ,R.mh,R.recordName ,R.recordId);
>>>>>>> 814d91f902f61de8c861f5e20bb583d96204da76
    
      this. patientAddress= null,
      this.doctorAddress= null,
      this.cc=null,
      this.pi= null,
      this.anyComment= null,
      this.mh=null,
<<<<<<< HEAD
      this.recordId = null
=======
      this. recordName=null,
      this.recordId
>>>>>>> 814d91f902f61de8c861f5e20bb583d96204da76
      
    }
  },
}
</script>

<style>
form{
  width: 80%;
  
  padding-top: 3%;
}
.grant{
    width: 80%;
    margin-left:10% ;
}
</style>