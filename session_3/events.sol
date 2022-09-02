pragma solidity ^0.8.0;

contract Transaction {
    
    event SenderLog(address);
    event ValueLog(uint);
    event BlockTimestamp(uint);
    event gasPrice(uint);
    event orginOfTranx(address);
    event BlockNumber(uint);
    
    function logs () public payable {
        emit SenderLog(msg.sender);
        emit ValueLog(msg.value);
        emit BlockTimestamp(block.timestamp);
        emit gasPrice(tx.gasprice);
        emit orginOfTranx(tx.origin);
        emit BlockNumber(block.number);
    }
       
}