
<template class="body">
  <div>
	  <Header />
		  <Sidebar />
		  
<div class="container" >
<p>This dapp consists of two sections: Register and Record. A user must first be registered.
There are two types of users , doctor user and patient user.
 the user with ethereum address and full name can register</p>

<p>Sections of the record include add record , get record , grant permission ,
 revork permission , record holder and number of record parts. </p>



       </div>
       </div>
	
</template>

<script>

import Header from "../component/header.vue";
import Sidebar from "../component/sidebar.vue";

export default {
components:{
    
    Header:Header,
    Sidebar:Sidebar
  }
}
  </script>
<style >
p {
  margin: 0;
  text-indent: 3ch;
}

p.pilcrow {
   text-indent: 0;
   display: inline;
}

</style>