pragma solidity ^0.4.4;

contract Arrays {

    //elementary type array in storage 
    int[3] staticIntArray = [1,2,3];
    int8[] dynamicIntArray;
    bool[] dynamicBoolArray;
    uint arrLen;

    //Byte type strage
    byte byteType = byte(1);

    // Byte big array
    byte[120] bigArray;

    function testArrayOps() public {
        // allocate memory of 8 elements to the dynamic bool array
        dynamicBoolArray = new bool[](8);

        // allocate memory and initialize memory in the dynamic int array
       // below stmt throws an error because of uint vale assignments
       // dynamicIntArray = [1,2,3];
       // explicit conversion of uint to int8 avoids the error
       // int8() conversion works only with the 1st element, when done on 2nd [1,int8(2),3] it throws an error
        dynamicIntArray = [int8(1),2,3];

        arrLen = staticIntArray.length;
        arrLen = dynamicIntArray.length;

        // declare a uint8 memory array
        uint8[] memory memoryArray;
        // below stmt doesn't work - assignment is not allowed for memory arrays
        //memoryArray = [1,2,3];
        // push is not allowed for a memory array as well
        //memoryArray.push(2);
        // allocate 8 elements to the memoryArray 
        memoryArray = new uint8[](8);

        bigArray = [byte(1),2,3];
    }
}