var SpecialArrays = artifacts.require("./SpecialArrays.sol");

contract('SpecialArrays', function(accounts) {
    it("Converted should return 5", function(){
        var special_arrays;
        return SpecialArrays.deployed().then(function(inst){
            special_arrays = inst;

            return special_arrays.conversionTest.call();
        }).then(function(result){
            console.log("conversionTest() = ", result);
            return special_arrays.getElementAt.call(1);
        }).then(function(result){
            console.log("getelementAt() as byte = ", result);
            console.log("getelementAt() as string = ", web3.toAscii(result));

            assert.equal(result, '0x62', "Unexpected Result!!");
        });
    });
});