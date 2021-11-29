<template>
  <div class="record">
         <nav class="navbar navbar-expand-lg  navbar-light bg-light  ">
              <div class="container-fluid">
                
                <button
                  class="navbar-toggler"
                  type="button"
                  data-mdb-toggle="collapse"
                  data-mdb-target="#navbarNav"
                  aria-controls="navbarNav"
                  aria-expanded="false"
                  aria-label="Toggle navigation"
                >
                  <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav">
                   
                    <li class="nav-item">
                      <router-link class="nav-link" class-active="active" to="/getRecord">Get Record</router-link>
                    </li>
                    <li class="nav-item">
                      <router-link class="nav-link" class-active="active" to="/addRecord">Add Record</router-link>
                    </li>
                    <li class="nav-item">
                      <router-link class="nav-link" class-active="active" to="/revorkPermission">Revorke Permission</router-link>
                    </li>
            
                    <li class="nav-item">
                      <router-link class="nav-link " class-active="active" to="/grantPermission" tabindex="-1" aria-disabled="true"
                        >Grant Permission</router-link
                      >
                    </li>
                     <li class="nav-item">
                      <router-link class="nav-link" class-active="active" to="/ownerOf">Record Holder</router-link>
                    </li>
                  </ul>
                </div>
              </div>
            </nav>
  </div>
</template>

<script>
export default {

}
</script>

<style>
.record{
    width: 80%;
    margin-left: 10%;
    margin-top:16px ;    
}
.nav-item{
  color: black;
	font-size: 21px;
	height: auto;
	padding: 0 20px;

}


</style>