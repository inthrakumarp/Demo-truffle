pragma solidity ^0.4.4;

contract FuncTypes {
    bytes private secret;

    //reference to an internal function
    function(string memory) internal returns(uint) lengthFunctionVar;

    //constructor
    function FuncTypes(){
        lengthFunctionVar = actualLengthFunction;
    }

    // This function should NOT be available for calls outside the contract context
    function actualLengthFunction(string memory str) private returns(uint len){
        len = bytes(str).length;
    }

    function indirectCall(string data) public returns(uint len){
        len = lengthFunctionVar(data);
    }

}