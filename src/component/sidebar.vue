<template>
    <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <!-- <li class="menu-title">Main</li> -->
						
                
						<li class="submenu">
							<router-link class="active" to="/register"><i class="fa fa-flag-o"></i> <span>Register </span> <span class="menu-arrow"></span></router-link>
					
						</li>
						<li class="submenu">
							<router-link class="active" to="/getRecord" ><i class="fa fa-flag-o"></i> <span> Record </span> <span class="menu-arrow"></span></router-link>
					
						</li>
                        <li class="submenu">
							<router-link class="active" to="/about" ><i class="fa fa-flag-o"></i> <span> About </span> <span class="menu-arrow"></span></router-link>
					
						</li>
                      
                    </ul>
                </div>
            </div>
        </div>
</template>
<style scoped>
.sidebar {
	box-shadow: 0 1px 2px 0 rgba(12, 12, 12, 0.911);
	top: 73px;
	width: 230px;
	z-index: 1039;
	background-color: #f1f1f1;
	bottom: 0;
	margin-top: 0px;
	position: fixed;
	left: 0;
	transition: all 0.2s ease-in-out;
}
.sidebar.opened {
	-webkit-transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	transition: all 0.4s ease;
}
.sidebar-inner {
	height: 100%;
	transition: all 0.2s ease-in-out 0s;
}
.sidebar-menu ul {
	font-size: 14px;
	list-style-type: none;
	margin: 0;
	padding: 0;
}
.sidebar-menu li a {
	color: black;
	display: block;
	font-size: 21px;
	height: auto;
	padding: 0 20px;
}
.sidebar-menu li a:hover {
	color: #040c09;
}
.sidebar-menu li.active a {
	color: #000000;
	background-color: #f3f3f3;
}
.menu-title {
	color: #333;
	font-size: 15px;
	font-weight: 500;
	padding: 12px 20px;
}
.menu-title > i {
	float: right;
	line-height: 40px;
}
.sidebar-menu li.menu-title a {
	color: #262829;
	display: inline-block;
	float: right;
	padding: 0;
}
li{
	margin: 32px;
	font-size:22px;
	background-attachment: inherit;
	
}


</style>