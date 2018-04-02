var MultiNumberBettingV3 = artifacts.require("./MultiNumberBettingV3.sol");

contract('MultiNumberBettingV3', function(accounts) {
  it("should assert true", function() {
    var multi_number_betting_v3;
    return MultiNumberBettingV3.deployed().then(function(instance){
      multi_number_betting_v3 = instance;
      // Get the total guesses
      return multi_number_betting_v3.totalGuesses.call();
    }).then(function(result){
      console.log("Total Guesses=",result.toNumber());
      // Make a guess
      multi_number_betting_v3.guess(3, "inthra");
      return multi_number_betting_v3.totalGuesses.call();
    }).then(function(result){
      console.log("Total Guesses=",result.toNumber());
      assert.isTrue(result.toNumber() == 1);
      return multi_number_betting_v3.getLastWinner.call();
    }).then(function(result){
        console.log("Winner name=", result);
        console.log("Winner name=", web3.toAscii(result));
        assert.isTrue(result == "0x696e740000");
        return multi_number_betting_v3.daysSinceLastWinning.call();
    }).then(function(result){
        console.log("Days since last winning= ", result);
        return multi_number_betting_v3.hoursSinceLastWinning.call();
    }).then(function(result){
        console.log("Hours since last winning= ", result);
    })
  });
});