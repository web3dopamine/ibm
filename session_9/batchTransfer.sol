pragma solidity ^0.4.18;

import "https://github.com/ConsenSysMesh/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol";



contract Overflow{

    mapping (address=>uint) balances;

    function contribute() public payable{
        balances[msg.sender] = msg.value;
    }

    function getBalance() public view returns (uint){
        return balances[msg.sender];
    }

    function batchSend(address[] _receivers, uint _value)public {
        // this line overflows
        uint total = _receivers.length * _value;
        require(balances[msg.sender]>=total);

        // subtract from sender
        balances[msg.sender] = balances[msg.sender] + total;

        for(uint i=0;i<_receivers.length;i++){
            balances[_receivers[i]] = balances[_receivers[i]] + _value;
        }
    }

}
