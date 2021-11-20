import Web3 from "web3";
import healtContract from "../../backEnd/build/contracts/Healt.json";
const App = {
  web3: null,
  account: null,
  meta: null,

  start: async function() {
    const { web3 } = this;

    try {
      // get contract instance
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = healtContract.networks[networkId];
      this.meta = new web3.eth.Contract(
        healtContract.abi,
        deployedNetwork.address
      );

      // get accounts
      const accounts = await web3.eth.getAccounts();
      this.account = accounts[0];
    } catch (error) {
      console.error("Could not connect to contract or chain.");
    }
  },

  setStatus: function(message) {
    const status = document.getElementById("status");
    status.innerHTML = message;
  },
  addPatient: async function(_address, _fullName) {
    const { addPatient } = this.meta.methods;
    await addPatient(_address,  _fullName).send({
      from: this.account
    });
  },
  addDoctor: async function(_address, _fullName) {
    const { addDoctor } = this.meta.methods;
    await addDoctor(_address,  _fullName).send({
      from: this.account
    });
  },
  addRecord: async function( _fullName, _patientAddress , _doctorAddress ,
    _cc , _pi , _comment , _mh, _recordName) {
    const { addRecord } = this.meta.methods;
    await addRecord( _fullName, _patientAddress , _doctorAddress ,
      _cc , _pi , _comment , _mh, _recordName).send({
      from: this.account
    });
  },
  getRecord: async function getRecord( _address, _recordName) {
    const { getRecord } = this.meta.methods;
   let record= await getRecord( _address, _recordName).call();
   return record;
  },
  grantPermission: async function grantPermission( _patientAddress, _viewner, _recordName  ) {
    const { grantPermission } = this.meta.methods;
    await grantPermission(_patientAddress, _viewner, _recordName ).send({
      from: this.account
    });
  },
  revorkPermission: async function revorkPermission( _patientAddress, _viewner, _recordName  ) {
    const { revorkPermission } = this.meta.methods;
    await revorkPermission(_patientAddress, _viewner, _recordName ).send({
      from: this.account
    });
  },
  
 
};

window.App = App;

window.addEventListener("load", async function() {
  if (window.ethereum) {
    // use MetaMask's provider
    App.web3 = new Web3(window.ethereum);
    await window.ethereum.enable(); // get permission to access accounts
  } else {
    console.warn(
      "No web3 detected. Falling back to http://192.168.0.1:7545. You should remove this fallback when you deploy live"
    );
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    App.web3 = new Web3(
      new Web3.providers.HttpProvider("http://172.28.160.1")
    );
  }

  App.start();
});
export default { App };
