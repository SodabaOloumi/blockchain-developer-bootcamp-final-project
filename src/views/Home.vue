<template>

   <div class="home" >
     <div class="page-wrapper">
          <Header />
		  <Sidebar />
            <div class="content">
    </div>
	<div class="info">
        <div>
            <h3>Rgistration</h3>
            
            <img :src="require('../assets/photo1.jpg')" width="460" height="345"> 
			<p>Frist click Rgister button in sidebar.Then registry page opens.
			  You must select the type of user the doctor or patient.</p>
        </div>
		<div>
           <img :src="require('../assets/photo_3.jpg')" width="450" height="333"> <img :src="require('../assets/photo_4.jpg')" width="450" height="333">
			<p>When click patient button you should register with ethereum address and fullName
			</p>
        </div>

		<div>
            <h3>Record</h3>
            
            <img :src="require('../assets/photo_5.jpg')" width="460" height="345"> 
			<p>In record section at first the doctor user should add record.
			  Make sure the doctor and patient are registered before clicking the addRecord button.
			  The caller of addRecord methode should be doctor its mean Metamask account must be the doctor's address
			   </p>
        </div>
		<br>
         <div>
		 <img :src="require('../assets/photo_6.jpg')" width="450" height="335"> <img :src="require('../assets/photo_7.jpg')" width="450" height="335"> 
			<p>Patient and doctor with patient address and record id can get record .
			 Metamask account must be the doctor's address or patient's address
			 </p>
        </div>
		<br>
		<div>
		 <img :src="require('../assets/photo_8.jpg')" width="450" height="335"> <img :src="require('../assets/photo_9.jpg')" width="450" height="335"> 
			<p> whit click the number Of Record button we can know a ptient how many record has.
			 </p>
        </div>
		<br>
		<div>
		 <img :src="require('../assets/photo_10.jpg')" width="450" height="335"> <img :src="require('../assets/photo_11.jpg')" width="450" height="335"> 
			<p> whit click the Record Holder  button we can know who is the owner of or patient of record.
			 </p>
        </div>
       <br>
       <div>
		<img :src="require('../assets/photo_12.jpg')" width="450" height="335"> 
			<p> The doctor and patient can allow anyone to get record.
			the viewner at first should registered and be doctor.
			Metamask account must be the doctor's address or patient's address. 
			 </p>
        </div>
		 <br>
       <div>
		<img :src="require('../assets/photo_13.jpg')" width="450" height="335"> <img :src="require('../assets/photo_14.jpg')" width="450" height="335"> 
			<p> After a viewner has pemission can get record.Metamask account must be the viewner's address 
			 </p>
        </div>

		 <br>
       <div>
		<img :src="require('../assets/photo_15.jpg')" width="450" height="335">  
			<p> The doctor and patient can revork pemission of viewer
			Metamask account must be the doctor's address or patient's address. 
			</p>
        </div>
		<br>
		<br>
		<br>

	 </div>
    
	</div>
</div>
    
   
</template>

<script>
// @ is an alias to /src
import Header from "../component/header.vue";
import Sidebar from "../component/sidebar.vue";

export default {
	
 
 components:{
    Header,
	Sidebar
  },
  methods:{	  
	  
  }
};
</script>
<style>
.home{
	margin-right: 12%;
	
}

.page-wrapper > .content {
	padding: 30px;
	margin: 22px;
	
}
.page-wrapper {
	left: 0;
	margin-left: 230px;
	padding-top: 50px;
	position: relative;
	-webkit-transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	transition: all 0.4s ease;
}
#button{
	margin: 2%;
}
</style>

