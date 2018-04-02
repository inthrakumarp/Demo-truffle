var ConstantsPayable = artifacts.require("./ConstantsPayable");

contract('ConstantsPayable', function(accounts){
    it("Should return lastCaller=NOTSET", function(){
        var constantsPayable;
        return ConstantsPayable.deployed().then(function(instance){
            constantsPayable = instance;

            return constantsPayable.setLastCaller("John Wayne");
        }).then(function(result){
            assert.equal(undefined, result.tx);
            return constantsPayable.lastCaller.call();
        }).then(function(result){
            assert.equal("NOTSET", result, "Unexpected result");
        });
    });

    it("Should send and receive 1000 wei", function(){
        var constantsPayable;
        return ConstantsPayable.deployed().then(function(instance){
            constantsPayable = instance;
            web3.eth.sendTransaction({from:accounts[0], to:constantsPayable.address, value:1000});
            return constantsPayable.getBalance.call();
    }).then(function(result){
        console.log("1. Balance = ", result.toNumber());
        assert.equal(1000, result.toNumber(), "Send receive same amount");
    });
});

    it("Should transfer 1500 wei to a function and end balance=2500", function(){
        var constantsPayable;
        return ConstantsPayable.deployed().then(function(instance){
            constantsPayable = instance;
            constantsPayable.receiveEthers("Inthra", {value:1500, from:accounts[0]});
            return constantsPayable.getBalance.call();
        }).then(function(result){
            console.log("2. Balance = ", result.toNumber());
            assert.equal(2500, result.toNumber(), "Balance is 2500");
        });
    });

});