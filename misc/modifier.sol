pragma solidity ^0.8.0;

contract Owned {
    
    address contractCreator;
    
    constructor(){
        contractCreator = msg.sender;
    }
    function call() public view onlyOwner returns (address){
        return msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == contractCreator);
        _;
    }
}