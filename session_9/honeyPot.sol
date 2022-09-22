pragma solidity ^0.4.0;
contract HoneyPot {
  mapping (address => uint) public balances;
  function HoneyPot() payable {
    put();
  }
  function put() payable {
    balances[msg.sender] = msg.value;
  }
  function get() {
      // uint amount = balances[msg.sender];
      // balances[msg.sender] = 0;  // solution
      //if (!msg.sender.call.value(amount)()) {
    if (!msg.sender.call.value(balances[msg.sender])()) {
      throw;
    }
      balances[msg.sender] = 0;
  }
  function() {
    throw;
  }
}