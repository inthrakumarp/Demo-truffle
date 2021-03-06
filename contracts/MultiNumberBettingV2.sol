pragma solidity ^0.4.4;

/**
 * Exercise: V1 
 * Section: 7
 * Part of an online course - for more info checkout link below
 * http://acloudfan.com/learn-blockchain
 */

contract MultiNumberBettingV2 {

  // Ex-1 Part-2
  uint  loserCount;
  uint  winnerCount;
  string lastWinnerName;

  uint8[3]  numArray;

  // Ex-1 Part-1
  function MultiNumberBettingV2(uint8 num0, uint8 num1, uint8 num2) {
    // constructor
    numArray[0] = num0;
    numArray[1] = num1;
    numArray[2] = num2;
  }

  // Ex-1 Part-3
  function guess(uint8 num, string name) returns (bool){
    for(uint8 i = 0 ; i < numArray.length ; i++){
      if(numArray[i] == num) {
        // Increase the winner count
        winnerCount++;
        lastWinnerName = name;
        return true;
      }
    }
    loserCount++;
    return false;
  }

  // Ex-2 
  function totalGuesses() returns (uint){
    return (loserCount+winnerCount);
  }

  // Ex-3
  /**
   * make a change to the 2_deploy_contracts.js
   *   provide the 3 numbers to the constructor
   * > testrpc
   * > truffle migrate
   * > trufle  networks
   **/

   function getLastWinner() returns (bytes){
       bytes memory mLastWinner = new bytes(15);
       bytes memory mLastWinner1 = new bytes(5);
       mLastWinner = bytes(lastWinnerName);
       for(uint i=0; i < 3; i++){
            mLastWinner1[i] = mLastWinner[i]; 
        }

        return mLastWinner1;
   }
}