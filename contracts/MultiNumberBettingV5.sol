pragma solidity ^0.4.4;

import "./MultiNumberBettingAbstractV1.sol";
/**
 * Exercise: V1 
 * Section: 7
 * Part of an online course - for more info checkout link below
 * http://acloudfan.com/learn-blockchain
 */

contract MultiNumberBettingV5 is MultiNumberBettingAbstractV1 {

  // Ex-1 Part-2
  // added public to generate the getters
  uint  public loserCount;
  uint  public winnerCount;
  
  uint public lastWinnerAt;
  string lastWinnerName;

  address winner;

  uint8[3]  numArray;

  struct Winner {
      address winnerAddress;
      string name;
      uint guess;
      uint guessedAt;
      uint ethersReceived;
  }

   mapping(address => Winner) winnerMapping;

  // Ex-1 Part-1
  function MultiNumberBettingV5(uint8 num0, uint8 num1, uint8 num2) {
    // constructor
    numArray[0] = num0;
    numArray[1] = num1;
    numArray[2] = num2;
  }

  // Ex-1 Part-3
  function guess(uint8 num, string name) public payable returns (bool) {
    
    //Lec-71 Ex-4
    if(num > 10) {
        revert();
    }

    //Lec-80 Ex-4
    if(msg.value > MAX_BET || msg.value < MIN_BET) {
        revert();
    }
    //Winner memory winnerStruct;
    
    for(uint8 i = 0 ; i < numArray.length ; i++) {
      if(numArray[i] == num) {
        // Increase the winner count
        winnerCount++;
        //lastWinnerName = name;
        winnerMapping[msg.sender].name = name;

        // Lec-71 Ex-1
        lastWinnerAt = now;
        winnerMapping[msg.sender].guessedAt = now;

        //Lec-71 Ex-3
        winner = msg.sender;
        winnerMapping[msg.sender].winnerAddress = msg.sender;
        winnerMapping[msg.sender].guess = num;
        winnerMapping[msg.sender].ethersReceived = msg.value;

        //Lec-80 Ex-4 part 2-b
        uint sendBack = 2 * msg.value;
        // it is not a good practice to use transfer(), we'll look into a better alternative in later chapters
        msg.sender.transfer(sendBack);

        return true;
      }
    }
    loserCount++;
    return false;
  }

  // Ex-2 
  function totalGuesses() public returns (uint){
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
       if (mLastWinner.length == 0) {
            return "***";
       }

       for (uint i=0; i < 3; i++) {
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

   //Lec-73 Ex-2
   function getLastWinnerInfo() returns (address winnerAddress, string name, uint guess, uint guessedAt, uint ethersReceived) {
        winnerAddress = winnerMapping[msg.sender].winnerAddress;
        name = winnerMapping[msg.sender].name;
        guess = winnerMapping[msg.sender].guess;
        guessedAt = winnerMapping[msg.sender].guessedAt;
        ethersReceived = winnerMapping[msg.sender].ethersReceived;
   }

   // Lec-73 Ex-3
   function checkWinning(address addr) returns (address winnerAddress, string name, uint guess, uint guessedAt) {
       Winner memory winnerLocal = winnerMapping[addr];
       if(winnerLocal.guessedAt != 0) {
       winnerAddress = winnerLocal.winnerAddress;
       name = winnerLocal.name;
       guess = winnerLocal.guess;
       guessedAt = winnerLocal.guessedAt;
       }
   }
}