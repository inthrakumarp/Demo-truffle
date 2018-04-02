pragma solidity ^0.4.4;

contract ChildContract {

    uint8 public identity;
    address public owner;
    bytes32 public name;

    modifier OwnerOnly {if (msg.sender != owner) revert(); else _;}
    event ChildOwnerTransfered(uint8 identity, bytes32 from, bytes32 to);

    function ChildContract(uint8 id, address own, bytes32 nm){
        identity = id;
        owner = own;
        name = nm;
    }

    function transferOwnership (address newOwner, bytes32 nm) OwnerOnly {
        bytes32 former = name;
        owner = newOwner;
        name = nm;
        ChildOwnerTransfered(identity, former, name);
    }

    function isOwner(address addr) returns (bool) {
        return (addr == owner);
    }
}

// This contract creates multiple contracts
contract ContractFactory {
    ChildContract[] children;
    uint8 public initialPrice;

    function ContractFactory(uint8 numParts, uint8 price) {
        for(uint8 i = 0; i < numParts; i++) {
            children.push(new ChildContract(i, this, "***"));
        }

        initialPrice = price;
    }

    function purchase(bytes32 name) payable {
        if (msg.value < initialPrice) revert();

        for(uint8 i = 0; i < children.length; i++) {
            if(children[i].isOwner(this)) {
                children[i].transferOwnership(msg.sender, name);
                return;
            }
        }

        revert();
    }

    function getInfo(uint8 childIndex) constant returns (uint8, address, bytes32) {
        return (children[childIndex].identity(),children[childIndex].owner(), children[childIndex].name());
    }

    function childContractAddress(uint8 childIndex) returns (address) {
        return address(children[childIndex]);
    }

    function getOwnerName(uint8 childIndex) constant returns (bytes32) {
        bytes32 namer = children[childIndex].name();
        return namer;
    }

    function getChildrenCount() constant returns (uint) {
        return children.length;
    }

}