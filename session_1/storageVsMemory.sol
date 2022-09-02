pragma solidity ^0.8.0;

contract TestStorage {
    
      struct St {
          uint256 amountPaid;
          uint256 amountOut;
          bool registered;
      }
    
    mapping (address => St) store;
    
    add (){
        memory a, memory b

        storage c = a + b
    }

    function AddMemFunds() public payable {
        St memory myStuff = store[msg.sender];
        myStuff.amountPaid += msg.value;
        store[msg.sender] = myStuff;
    }
    function AddMemFail() public payable {
        St memory myStuff = store[msg.sender];
        myStuff.amountPaid += msg.value;
    }
    function AddStorFunds() public payable {
        St storage myStuff = store[msg.sender];
        myStuff.amountPaid += msg.value;
    }
    function Mine() public view returns(uint256 toPay, uint256 paid) {
        St memory myStuff = store[msg.sender];
        toPay = myStuff.amountPaid;
        paid = myStuff.amountOut;
    }   
}
