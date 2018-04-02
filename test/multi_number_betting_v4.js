var MultiNumberBettingV4 = artifacts.require("./MultiNumberBettingV4.sol");

contract('MultiNumberBettingV4', function(accounts) {
  it("should assert true", function() {
    var multi_number_betting_v4;
    return MultiNumberBettingV4.deployed().then(function(instance){
      multi_number_betting_v4 = instance;
      // Get the total guesses
      return multi_number_betting_v4.totalGuesses.call();
    }).then(function(result){
      console.log("Total Guesses=",result.toNumber());
      // Make a guess
      multi_number_betting_v4.guess(3, "inthra");
      return multi_number_betting_v4.totalGuesses.call();
    }).then(function(result){
      console.log("Total Guesses=",result.toNumber());
      assert.isTrue(result.toNumber() == 1);
      return multi_number_betting_v4.getLastWinnerInfo.call();
    }).then(function(result){
        console.log("Winner name=", result);
        console.log("Winner name=", result[0]);
        //console.log("Winner name=", web3.toAscii(result));
        //assert.isTrue(result == "0x696e740000");
        return multi_number_betting_v4.daysSinceLastWinning.call();
    }).then(function(result){
        console.log("Days since last winning= ", result);
        return multi_number_betting_v4.hoursSinceLastWinning.call();
    }).then(function(result){
        console.log("Hours since last winning= ", result);
    })
  });
});