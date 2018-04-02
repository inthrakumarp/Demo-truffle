var MappingEnumStruct = artifacts.require("./MappingEnumStruct.sol");

contract('MappingenumStruct', function(accounts) {
    it("should return of Egypt and then blank", function(){
        var mapping_enum_struct;

        return MappingEnumStruct.deployed().then(function(instance){
            mapping_enum_struct = instance;

            mapping_enum_struct.addCapital("Egypt", "Cairo");
            mapping_enum_struct.addCapital("America", "Washington DC");
            mapping_enum_struct.addCapital("Australia", "Sydney");
        }).then(function(){
            return mapping_enum_struct.getCapital.call("Egypt")
        }).then(function(result){
            console.log("Capital of Egypt is : ", result);
            assert.isTrue(result === "Cairo");

            mapping_enum_struct.removeCapital("Egypt");
        }).then(function(){
            return mapping_enum_struct.getCapital.call("Egypt");
        }).then(function(result){
            console.log("Capital of Egypt is : ", result);
            assert.isTrue(result === "")
        });
    });
});