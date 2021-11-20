<template>
<div>
   <Header />
		  <Sidebar />
      <div class="container">
      <Register />
      </div>
</div>
</template>

<script>
import Register from "../component/register";
import Header from "../component/header.vue";
import Sidebar from "../component/sidebar.vue";
export default {
components:{
    Register:Register,
    Header,
	  Sidebar
    
  },
}
</script>

<style>
.container{
  padding: 30px;
}

</style>