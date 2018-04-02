var MappingEnumStruct = artifacts.require("./MappingEnumStruct.sol");

contract('MappingenumStruct', function(accounts) {
    it("should assert true", function(){
        var mapping_enum_struct;
        return MappingEnumStruct.deployed().then(function(instance){
            mapping_enum_struct = instance;

            return mapping_enum_struct.getContinent.call(0);
        }).then(function(result){
            console.log("Continent at index ", 0, "is ", result);
            assert.isTrue(result === "Africa");
            return mapping_enum_struct.getContinent.call(4);
        }).then(function(result){
            console.log("Continent at index ", 4, "is ", result);
            assert.isTrue(result === "Europe");
    });

});

});