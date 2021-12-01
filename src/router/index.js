import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import AddPatient from "../views/addPatient";
import Record from "../component/record";
import addRecord from "../views/addRecord"
import grantPermission from "../views/grantPermission"
import revorkPermission from "../views/revorkePermission"
import getRecord from "../views/getRecord"
import Register from "../views/registertion"
import recordof from "../views/recordOf"
import ownerOf from "../views/ownerOfRecord"
import AddDoctor from "../views/addDoctor"




Vue.use(VueRouter);

const routes = [
  
  {
    path: "/",
    name: "Home",
    component: Home
  },
   {
    path:"/ownerOf",
    name:"ownerOf",
    component:ownerOf
  },
  {
  path:"/blockchain-developer-bootcamp-final-project/recodOf",
  name:recordof,
  component:recordof
  },
  {
    path: "/addDoctor",
    name: "AddDoctor",
    component: AddDoctor
  },
 {
  path:"/addPatient",
  name:"AddPatient",
  component:AddPatient
},
{
  path:"/addRecord",
  name:'addRecord',
  component:addRecord
},
{
  path:"/record",
  name:"record",
  component:Record
},
{
  path:"/grantPermission",
  name:"grantPermission",
  component:grantPermission
},
{
  path:"/revorkPermission",
  name:"revorkePermission",
  component:revorkPermission
},
{
  path:"/getRecord",
  name:"getRecord",
  component:getRecord
},
{
  path:"/register",
  name:"Register",
  component:Register

},


];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
