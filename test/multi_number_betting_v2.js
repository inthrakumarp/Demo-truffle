var MultiNumberBettingV2 = artifacts.require("./MultiNumberBettingV2.sol");

contract('MultiNumberBettingV2', function(accounts) {
  it("should assert true", function() {
    var multi_number_betting_v2;
    return MultiNumberBettingV2.deployed().then(function(instance){
      multi_number_betting_v2 = instance;
      // Get the total guesses
      return multi_number_betting_v2.totalGuesses.call();
    }).then(function(result){
      console.log("Total Guesses=",result.toNumber());
      // Make a guess
      multi_number_betting_v2.guess(3, "inthra");
      return multi_number_betting_v2.totalGuesses.call();
    }).then(function(result){
      console.log("Total Guesses=",result.toNumber());
      assert.isTrue(result.toNumber() == 1);
      return multi_number_betting_v2.getLastWinner.call();
    }).then(function(result){
        console.log("Winner name=", result);
        console.log("Winner name=", web3.toAscii(result));
        assert.isTrue(result == "0x696e740000");
    });
  });
});