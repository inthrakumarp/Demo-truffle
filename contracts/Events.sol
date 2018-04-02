pragma solidity ^0.4.4;

contract Events {
    uint biddingEnds = now + 5 days;

    struct HighBidder {
        address bidder;
        string name;
        uint bid;
    }

    HighBidder highBidder;

    event NewHighBid(address indexed who, string name, uint howMuch);

    event BidFailed(address indexed who, string name, uint howMuch);

    modifier timed {
        if (now < biddingEnds) {
            _;
        } else {
            revert();
        }
    }

    function Events() {
        highBidder.bid = 1000;
    }

    function bid(string name) payable timed {
        if (msg.value > highBidder.bid + 10) {

            //returnBidToLoser();

            highBidder.bidder = msg.sender;
            highBidder.name = name;
            highBidder.bid = msg.value;

            NewHighBid(msg.sender, name, msg.value);
        } else {
           BidFailed(msg.sender, name, msg.value);
        //    revert();
            //throw;
        }
    }

    function getHighBidder() returns (string name) {
        name = highBidder.name;
    }

    function returnBidToLoser() private {

    }
}