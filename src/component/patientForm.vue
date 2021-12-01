
<template>
    <div class="content">
                
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <form @submit.prevent="onSubmit">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>First Name <span class="text-danger"></span></label>
                                        <input class="form-control" type="text" v-model="firstName" id="firstName">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input class="form-control" type="text" v-model="lastName" id="lastName">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Age <span class="text-danger"></span></label>
                                        <input class="form-control" type="text" v-model="age" id="age">
                                    </div>
                                </div>
                              
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Job</label>
                                        <input class="form-control" type="text" v-model="job" id="job">
                                    </div>
                                </div>
								<div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <input class="form-control" type="text" v-model="phoneNumber" id="phonrNumber">
                                    </div>
                                </div>
								<div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Date/Hospitalization</label>
                                        <div class="cal-icon">
                                            <input type="text" class="form-control datetimepicker" v-model="admissionDate" id="admissionDate">
                                        </div>
                                    </div>
                                </div>
								<div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Doctor Name</label>
                                        <input class="form-control" type="text" v-model="doctorName" id="doctorName">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Date/Leave</label>
                                        <input class="form-control" type="text" v-model="doctorName" id="doctorName">
                                    </div>
                                </div>
                                  <div class="col-sm-6">
                                    <div class="form-group">
                                       <label> Doctor Address</label>
												<input type="text" class="form-control "  v-model="doctorAddress" id="doctorAddress">
											</div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                       <label>Patient Address</label>
												<input type="text" class="form-control"  v-model="patientAddress" id="patientAddress">
											</div>
                                </div>
                            </div>
								
                             
                         <button class="btn btn-dark submit-btn">SAVE</button>
                        </form>
                    </div>
                </div>
            </div>
</template>

<script>
import App from "../index.js"
    export default {
//   props:["patientAddress"],
  data() {
    return {
		x:[],
      firstName: null,
      lastName: null,
      patientAddress: null,
      doctorAddress: null,
	  doctorName:null,
	  admissionDate:null,
	  dischargeDate: null,
	  age:null,
	  job:null,
	  phoneNumber:null

    };
  },
  methods: {
    onSubmit() {
      let patientInfo = {
        firstName: this.firstName,
        lastName: this.lastName,
        patientAddress: this.patientAddress,
        doctorAddress: this.doctorAddress,
		doctorName: this.doctorName,
        admissionDate: this.admissionDate,
        dischargeDate: this.dischargeDate,
		age: this.age,
        job: this.job,
        phoneNumber: this.phoneNumber
      };
	  console.log(patientInfo.firstName)
     this.x= App.App.addPatient(
        patientInfo.firstName,
        patientInfo.lastName,
        patientInfo.patientAddress,
        patientInfo.doctorAddress,
		patientInfo.doctorName,
        patientInfo.admissionDate,
        patientInfo.dischargeDate,
        patientInfo.age,
		patientInfo.job,
		patientInfo.phoneNumber,

      );
      console.log(this.x)
      this.firstName =null,
      this.lastName= null,
      this. patientAddress= null,
      this.doctorAddress= null,
	  this.doctorName=null,
	  this.admissionDate=null,
	  this.dischargeDate= null,
	  this.age=null,
	  this.job=null,
	  this.phoneNumber=null
    }
  },
  
  
};
</script>

<style lang="scss" scoped>

</style>