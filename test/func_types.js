var FuncTypes = artifacts.require("./FuncTypes.sol");

contract('FuncTypes', function(accounts){

    it("Should return len=5", function(){
        var funcTypes;
        return FuncTypes.deployed().then(function(instance){
            funcTypes = instance;
            assert.equal(undefined, funcTypes.actualLengthFunction, 'actualLengthFunction is NOT available');
            return funcTypes.indirectCall.call("12345");
        }).then(function(result){
            console.log("Received length = ", result.toNumber());
            assert.equal(5, result.toNumber(), 'Incorrect Length !!!');
        });
    });
});