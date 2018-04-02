pragma solidity ^0.4.4;

import "./FuncTypes.sol";

contract FuncTypesCaller {
    function callExternal(address funcTypesAddr, string str) public returns(uint){
        FuncTypes funcTypes = FuncTypes(funcTypesAddr);
        return funcTypes.indirectCall(str);
    }
}