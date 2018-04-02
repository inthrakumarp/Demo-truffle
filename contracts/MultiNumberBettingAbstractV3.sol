pragma solidity ^0.4.4;

contract MultiNumberBettingAbstractV3 {
    
    uint constant MAX_BET = 1;
    uint constant MIN_BET = 5;


    function guess(uint8 num, string name) public payable returns (bool);

    function totalGuesses() public returns (uint);

     function daysSinceLastWinning() public returns (uint);

     function hoursSinceLastWinning() public returns (uint);

     function minutesSinceLastWinning() public returns (uint);

      function getLastWinnerInfo() returns (address winnerAddress, string name, uint guess, uint guessedAt, uint ethersReceived);

      function checkWinning(address addr) returns (address winnerAddress, string name, uint guess, uint guessedAt);

      event WinningBet(address indexed winnerAddress, string name, uint amount);

      event LosingBet(address indexed loserAddress, string name, uint amount);
}