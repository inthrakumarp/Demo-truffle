pragma solidity ^0.4.4;

/**
 * Exercise: V1 
 * Section: 7
 * Part of an online course - for more info checkout link below
 * http://acloudfan.com/learn-blockchain
 */

contract MultiNumberBettingV3 {

  // Ex-1 Part-2
  // added public to generate the getters
  uint  public loserCount;
  uint  public winnerCount;
  
  uint public lastWinnerAt;
  string lastWinnerName;

  address winner;

  uint8[3]  numArray;

  // Ex-1 Part-1
  function MultiNumberBettingV3(uint8 num0, uint8 num1, uint8 num2) {
    // constructor
    numArray[0] = num0;
    numArray[1] = num1;
    numArray[2] = num2;
  }

  // Ex-1 Part-3
  function guess(uint8 num, string name) returns (bool){
    
    //Lec-71 Ex-4
    if(num > 10) {
        revert();
    }
    
    for(uint8 i = 0 ; i < numArray.length ; i++){
      if(numArray[i] == num) {
        // Increase the winner count
        winnerCount++;
        lastWinnerName = name;

        // Lec-71 Ex-1
        lastWinnerAt = now;

        //Lec-71 Ex-3
        winner = msg.sender;

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
       if(mLastWinner.length == 0){
            return "***";
       }

       for(uint i=0; i < 3; i++){
            mLastWinner1[i] = mLastWinner[i]; 
        }

        return mLastWinner1;
   }

   //Lec-71 Ex-3
   function daysSinceLastWinning() public returns (uint) {
       return (block.timestamp - lastWinnerAt*1 days);
   }

   //Lec-71 Ex-3
   function hoursSinceLastWinning() public returns (uint) {
       return (now - lastWinnerAt*1 hours);
   }

   //Lec-71 Ex-3
   function minutesSinceLastWinning() public returns (uint) {
       return (now - lastWinnerAt*1 minutes);
   }


}