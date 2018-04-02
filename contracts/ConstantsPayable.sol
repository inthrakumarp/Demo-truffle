pragma solidity ^0.4.4;

contract ConstantsPayable {
    
    uint public creationTime;
    string public lastCaller = "NOTSET";

    address public lastSender;
    uint public lastReceived = 0;

    // this function will NOT update the variable value as it is set as constant
    function setLastCaller(string name) constant {
        lastCaller = name;
    }

    function ConstantsPayable() {
        creationTime = now;
    }

    // This function can receive ethers as it has the 'payable' keyboard
    function receiveEthers(string name) payable {
        lastSender = msg.sender;
        lastReceived = msg.value;
        lastCaller = name;
    }

    function getBalance() returns(uint) {
        return this.balance;
    }

    //Fallback function
    // This function gets called with the contract receives ethers without function data
    function() payable {
        // Max gas that can be send in a Fallback payable function is 2300
        //msg.value has the number of wei received
        // msg.sender has the address of the sender

        // As a best practice use this function to just log an event
        // If you do not want to receive ethers in the contract throw an exception here
    }
}