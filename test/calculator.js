var Calculator = artifacts.require('./Calculator.sol')

contract('Calculator', function(accounts) {
  it("should assert true", function() {
    var calculator;
    return Calculator.deployed().then(function(instance){
      Calculator = instance;
      return Calculator.getResult();
    }).then(function(result){
      console.log(result.valueOf());
        assert.equal(result.valueOf(), 10, "Contract initialized with value not equal to 10!!!");
        Calculator.addToNumber(10);
        Calculator.subtractFromNumber(5);
        Calculator.multiplyWithNumber(2);
        Calculator.divideByNumber(3);
        return Calculator.getResult();
    }).then(function(result){
      console.log(result.valueOf());
      assert.equal(result.valueOf(), 10, "Contract initialized with value not equal to 10!!!");
    });
  });
});
