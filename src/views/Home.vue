<template>

   <div class="home" >
     <div class="page-wrapper">
          <Header />
		  <Sidebar />
            <div class="content">
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

