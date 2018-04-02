var MultiNumberBettingV6 = artifacts.require("./MultiNumberBettingV6.sol");

/**
 * Test Case
 * 1. Lets say John is the dealer - so he is the one running the contract
 * 2. Check the initial ether balance for Frank 
 * 3. Bill puts in a losing guess (8) with 3 ethers
 * 4. Frank puts in a winning bid (3) with 1 ethers
 * 5. Frank should have balance > his initial balance checked in step#2
 * 
 * PS:
 * a. Multiple runs will cause Franks balance to increase
 * b. Frank's balance will not be a full ether caz he is paying for gas
 */

contract('MultiNumberBettingV6', function(accounts){
    var johns_address = accounts[0];
    var bills_address = accounts[1];
    var franks_address = accounts[2];

    it("Should assert true", function(){
        var multi_number_betting_v6;

        return MultiNumberBettingV6.deployed().then(function(instance){
            multi_number_betting_v6 = instance;

            var sendValue = web3.toWei(20, 'ether');
            web3.eth.sendTransaction({from:johns_address, to:multi_number_betting_v6.address, value:sendValue});
            return web3.eth.getBalance(johns_address);
        }).then(function(result){
            console.log("Johns initial balance after initial send of 20 : ", web3.fromWei(result.toNumber(),'ether'));

            return web3.eth.getBalance(multi_number_betting_v6.address);
        }).then(function(result){
            console.log("Contract balance after initial send of 20 : ", web3.fromWei(result.toNumber(),'ether'));

            // send a loosing guess from bill
            var receiveValue = web3.toWei(2, 'ether');
            //console.log("Transfer 2 ether to Johns address");
            return multi_number_betting_v6.ownerWithdraw(receiveValue, {from:johns_address})
        }).then(function(result){
            return web3.eth.getBalance(johns_address);
            
        }).then(function(result){
            console.log("Johns final balance after receiving 2 ethers: ", web3.fromWei(result.toNumber(), 'ether') );

            return web3.eth.getBalance(multi_number_betting_v6.address);
        }).then(function(result){
            console.log("Contract final balance after transferring 2 ethers: ", web3.fromWei(result.toNumber(), 'ether') );
        });
    });
});