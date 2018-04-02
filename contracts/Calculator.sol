pragma solidity ^0.4.4;

contract Calculator {

uint result;


  function Calculator(uint initial) {
    // constructor
    result = initial;
  }

  function getResult() constant returns (uint){
    return result;
  }

  function addToNumber(uint num){
    result = result + num;
  }

  function subtractFromNumber(uint num){
    result = result - num;
  }

  function multiplyWithNumber(uint num){
    result = result * num;
  }

  function divideByNumber(uint num){
    result = result / num;
  }
}
