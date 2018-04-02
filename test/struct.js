var MappingEnumStruct = artifacts.require("./MappingEnumStruct.sol");

contract('MappingenumStruct', function(accounts) {
    it("should assert true", function(){
        var mapping_enum_struct;
        return MappingEnumStruct.deployed().then(function(instance){
            mapping_enum_struct = instance;

             mapping_enum_struct.addEuropeanCountry("France", 4, 65);
             mapping_enum_struct.addEuropeanCountry("Russia", 4, 144);
             mapping_enum_struct.addEuropeanCountry("Poland", 4, 39);

             mapping_enum_struct.addEuropeanCountry("Singapore", 2, 5);

             return mapping_enum_struct.getEuropeanCountry.call("Russia");
        }).then(function(result){
            var name = web3.toAscii(result[0]);

            name = name.replace(/\0/g, '');
            console.log("country: ", name,
                        "Continent: ", result[1].toNumber(),
                        "Population: ", result[2].toNumber()
                        );
            assert.equal("Russia", name, "name should be Russia");

            return mapping_enum_struct.getEuropeanCountry.call("Singapore");
        }).then(function(result){
            assert.equal(result[0], '0x0000000000000000000000000000000000000000000000000000000000000000', "should be undefined");
        });

});

});