const assert = require("assert")
const Healt = artifacts.require('Healt');

let accounts;
let healt;

beforeEach(async () =>{
    accounts = await web3.eth.getAccounts();
    healt= await Healt.new();  
})
describe("Healt Test" , ()=>{
    it('Contract deploys' , ()=>{
        assert.ok(Healt.address)
    } ),
    it('A user can register once with the provided address and fullname',async()=>{
        await healt.addPatient(accounts[3] , "sodaba oloumi",{
            from:accounts[3], 
        });
      
        var User = await healt.user(accounts[3],{
            from:accounts[3],
        });
        
        assert.equal(
            User[0],
            "sodaba oloumi",
            "the name of the last registered user does not match the expected value",
          );
         assert.equal(
            User[1].toString(),
            "0",
            "the state(for patient state is '0' and doctor is '1') of the last registered user does not match the expected value",
          );
          assert.equal(
            User[2].toString(),
            accounts[3],
            "the address of the last registered user does not match the expected value",
          );
          

    }).timeout(10000),
    it("should emit a  userAddition event when a user is registered", async () => {
        let eventEmitted = false;
        const tx = await healt.addPatient(accounts[3] , "sodaba oloumi",{
            from:accounts[3], 
        });
      console.log(tx);
        if (tx.logs[0].event == "userAddition") {
          eventEmitted = true;
        }
  
        assert.equal(
          eventEmitted,
          true,
          "registering a user should emit a userAddition  event",
        );
      }).timeout(10000),
    it("Should ckeck restriction , only a doctor can add a record" , async()=> { 
        var doctorAddress= accounts[2];
        var patientAddress=accounts[1];
        await healt.addDoctor(doctorAddress,"Arash Oloumi",{
            from:doctorAddress
        });
        await healt.addPatient(patientAddress,"Sodaba Oloumi",{
          from:patientAddress
      });
        var doctorUser =await healt.user(doctorAddress,{
          from:doctorAddress,
      });
      var patientUser =await healt.user(patientAddress,{
        from:patientAddress,
    });
    
        try{
          await healt.addRecord("Sodaba Oloumi" , patientAddress , doctorAddress, "cc" , "pi","commit" , "mh" , "recordName",{
              from:doctorAddress,
            });

        }catch(err){
            assert.ok(err)

        } 
        assert.equal(
          doctorUser[2].toString(),
            doctorAddress,
            "The doctor address is not exist, befor add record you should registered",
          );
          assert.equal(
            patientUser[2].toString(),
              patientAddress,
              "The patient address is not exist, befor add record you should registered",
            );    
    }).timeout(10000),
    it("should emit a  PatientRecordAdded event when a doctor added record", async () => {
        let eventEmitted = false;
        await healt.addDoctor(accounts[2],"Arash Oloumi",{
            from:accounts[2]
        });
        await healt.addPatient(accounts[1] , "Sodaba Oloumi",{
            from:accounts[1], 
        });
        
        const tx = await healt.addRecord("Sodaba Oloumi" , accounts[1] , accounts[2], "cc" , "pi","commit" , "mh" , "recordName",{
            from:accounts[2]
          });
  
        if (tx.logs[0].event == "PatientRecordAdded") {
          eventEmitted = true;
        }
  
        assert.equal(
          eventEmitted,
          true,
          "adding a record should emit a PatientRecordAdded  event",
        );
      }).timeout(10000),
    it("The patient , doctor and the user who have permission can call getRecord ",async()=>{

        await healt.addDoctor(accounts[2],"Arash Oloumi",{
            from:accounts[2]
        });
        await healt.addPatient(accounts[1] , "Sodaba Oloumi",{
            from:accounts[1], 
        });
         await healt.addRecord("Sodaba Oloumi" , accounts[1] , accounts[2], "cc" , "pi","commit" , "mh" , "recordName",{
            from:accounts[2]
          });
       try{
       
        await healt.getRecord(accounts[1] ,"recordName",{
            from:accounts[1] 
        });
       }catch(err){
       assert.ok(err)
      }
       
    }).timeout(10000),  
    it("should emit a  Approval event when a doctor or patient  grant permission a record", async()=>{
      let eventEmitted = false;
      var doctorAddress= accounts[2];
      var patientAddress=accounts[1];
      var viewnerAddress= accounts[4];
      await healt.addDoctor(doctorAddress,"Arash Oloumi",{
          from:doctorAddress
      });
      await healt.addDoctor(viewnerAddress,"Atif Oloumi",{
        from:viewnerAddress
    });
      await healt.addPatient(patientAddress,"Sodaba Oloumi",{
        from:patientAddress,
    });
      await healt.addRecord("Sodaba Oloumi" , patientAddress, doctorAddress , "cc" , "pi","commit" , "mh" , "recordName",{
            from:doctorAddress,
    });
    const tx =  await healt.grantPermission(patientAddress,viewnerAddress,"recordName",{
            from:patientAddress,
      });
       console.log(tx.logs[0].event);
        if (tx.logs[0].event == "Approval") {
          eventEmitted = true;
        }
  
        assert.equal(
          eventEmitted,
          true,
          "granting permission a user should emit a Approval  event",
        );
    }).timeout(10000),
    it("should emit a  unApproval event when a doctor or patient  revork permission a record", async()=>{
      let eventEmitted = false;
      var doctorAddress= accounts[2];
      var patientAddress=accounts[1];
      var viewnerAddress= accounts[4];
      await healt.addDoctor(doctorAddress,"Arash Oloumi",{
          from:doctorAddress
      });
      await healt.addDoctor(viewnerAddress,"Atif Oloumi",{
        from:viewnerAddress
    });
      await healt.addPatient(patientAddress,"Sodaba Oloumi",{
        from:patientAddress,
    });
      await healt.addRecord("Sodaba Oloumi" , patientAddress, doctorAddress , "cc" , "pi","commit" , "mh" , "recordName",{
            from:doctorAddress,
    });
      await healt.grantPermission(patientAddress,viewnerAddress,"recordName",{
            from:patientAddress,
      });
      const tx =  await healt.revorkPermission(patientAddress,viewnerAddress,"recordName",{
        from:patientAddress,
  });
       console.log(tx.logs[0].event);
        if (tx.logs[0].event == "unApproval") {
          eventEmitted = true;
        }
  
        assert.equal(
          eventEmitted,
          true,
          "granting permission a user should emit a Approval  event",
        );
       
    }).timeout(10000),
    it("check to veiwner address is allowed to see the record ",async()=>{
      var doctorAddress= accounts[2];
      var patientAddress=accounts[1];
      var viewnerAddress= accounts[4];
      await healt.addDoctor(doctorAddress,"Arash Oloumi",{
          from:doctorAddress
      });
      await healt.addDoctor(viewnerAddress,"Atif Oloumi",{
        from:viewnerAddress
    });
      await healt.addPatient(patientAddress,"Sodaba Oloumi",{
        from:patientAddress,
    });
      await healt.addRecord("Sodaba Oloumi" , patientAddress, doctorAddress , "cc" , "pi","commit" , "mh" , "recordName",{
            from:doctorAddress,
    });
    await healt.grantPermission(patientAddress,viewnerAddress,"recordName",{
      from:doctorAddress,
    });
    await healt.getRecord(patientAddress ,"recordName",{
      from: viewnerAddress
  });
    const tx =  await healt.viewRecord("recordName",viewnerAddress,{
            from:accounts[0],
      });
      console.log(tx);
      assert.equal(
        tx,
        true,
        "the address is not allowed to see the record",
      );
  
       
  
    }).timeout(10000)

   
    
})
