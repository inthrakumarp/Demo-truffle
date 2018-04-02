var FuncTypes = artifacts.require("./FuncTypes.sol");
var FuncTypesCaller = artifacts.require("./FuncTypesCaller.sol");

contract('FuncTypesCaller', function(accounts){
    it("Should return len=6", function(){
    var funcTypes;
    var funcTypesCaller;
    return FuncTypes.deployed().then(function(instance){
        funcTypes = instance;
        return FuncTypesCaller.deployed();
    }).then(function(instance){
        funcTypesCaller = instance;
        return funcTypesCaller.callExternal.call(funcTypes.address, "123456");
    }).then(function(result){
        console.log("Received Length = ", result.toNumber());
        assert.equal(6, result.toNumber(), "Incorrect length !!!");
    });
    });
});