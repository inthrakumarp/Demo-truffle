var Calculator = artifacts.require("./Calculator.sol");
var MultiNumberBettingV2 = artifacts.require("./MultiNumberBettingV2.sol");
var SpecialArrays = artifacts.require("./SpecialArrays.sol");
// var MultiNumberBettingV3 = artifacts.require("./MultiNumberBettingV3.sol");
var MultiNumberBettingV4 = artifacts.require("./MultiNumberBettingV4.sol");
var MappingEnumStruct = artifacts.require("./MappingEnumStruct.sol");
var FuncTypes = artifacts.require("./FuncTypes.sol");
var FuncTypesCaller = artifacts.require("./FuncTypesCaller.sol");
var ConstantsPayable = artifacts.require("./ConstantsPayable.sol");
var MultiNumberBettingV5 = artifacts.require("./MultiNumberBettingV5.sol");
var MultiNumberBettingV6 = artifacts.require("./MultiNumberBettingV6.sol");
var Events = artifacts.require("./Events.sol");
var ContractFactory = artifacts.require("./ContractFactory.sol");

module.exports = function(deployer) {
   deployer.deploy(Calculator, 10);
  // deployer.deploy(MultiNumberBettingV2, 1,2,3);
  // deployer.deploy(SpecialArrays, 5);
  // //deployer.deploy(MultiNumberBettingV3, 1,2,3);
  // deployer.deploy(MultiNumberBettingV4, 1,2,3);
  // deployer.deploy(MappingEnumStruct);
  // deployer.deploy(FuncTypes);
  // deployer.deploy(FuncTypesCaller);
  // deployer.deploy(ConstantsPayable);
  // deployer.deploy(MultiNumberBettingV5, 1,2,3);
  // deployer.deploy(MultiNumberBettingV6, 1,2,3);
  // deployer.deploy(Events);
  // deployer.deploy(ContractFactory,5,100);
};
