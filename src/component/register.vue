<template>
<div>
 <div class="container mt-3">
  <div class="card" style="width:500px">
    <img class="card-img-top" src="https://images.pexels.com/photos/40568/medical-appointment-doctor-healthcare-40568.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">Welcome to the Healt app</h4>
      <p class="card-text">Please specify your whether you are a doctor or a patient berfor registering</p>
	   <div>
        <router-link  class="btn btn-dark btn-block " to="/addDoctor" style="margin: 5px">Doctor</router-link>
       </div>
	   <div>
         <router-link  class="btn btn-dark btn-block " to="/addPatient" style="margin: 5px">Patient</router-link>
       </div>
    </div>
  </div>
  <br>
  
  
  
</div>
</div>
</template>

<script>


export default {

  data(){
    return{
      State:["Doctor", "Patient"]
    }
  }
}

</script>

<style>

</style>