pragma solidity ^0.4.4;

contract SpecialArrays {
    // create a fixed length bytes array with length as 3
    byte[3] byteArray;
    // create a fixed length bytes array with length as 3
    bytes3 fixedBytesArray;

    // both these statements declare a dynamic bytes array
    byte[] dynamicBytesArray;
    bytes bytesArray;

    string stringStorage = "abcde";

    function conversionTest() returns (string) {
        bytes memory helloSolidity = "Hello solidity!";
        string memory converted = string(helloSolidity);
        return converted; 
    }

    function getElementAt(uint index ) returns (byte){
        bytes memory bytesData = bytes(stringStorage);

        byte element = bytesData[index];

        return  element;
    }

 
    function testAssignments() public {
        // allocate memory of 3 byte elements
        dynamicBytesArray = new byte[](3);
        // assign 3 bytes after explicit conversion
        dynamicBytesArray = [byte(1),2,3];

        dynamicBytesArray.length = 5;

        // allocate memory of 3 bytes
        bytesArray = new bytes(3);
        // Not allowed to assign to bytesArray
        //bytesArray = [byte(1),2,3];
        // index based assignment is allowed on bytes array
        bytesArray[1] = 1;
        bytesArray[2] = 2;
        bytesArray[3] = 3;

        bytesArray.length = 5;
    }
 }