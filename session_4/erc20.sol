pragma solidity ^0.8.0;

contract MyToken {
// address of the contracr
// 0xE5f2A565Ee0Aa9836B4c80a07C8b32aAd7978e22
    string public name = "My Token";
    string public symbol = "MTK";

    uint private constant _totalSupply = 1000;

    mapping (address=>uint) balance;
    
    mapping (address=>mapping(address=>uint)) public allowed;

    event Transfer(address from, address to, uint tokens);
    event Approval(address tokenOwner, address delegate, uint tokens);

    constructor(){
        balance[msg.sender] = _totalSupply;
    }

    function balanceOf(address tokenOwner) public view returns (uint balances) {
        return balance[tokenOwner];
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        balance[msg.sender] -= tokens;
        balance[to] += tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function totalSupply() public view returns (uint){
        return _totalSupply;
    }

    function transferFrom(address from, address to, uint tokens) public returns(bool){
        balance[from] = balance[from] - tokens;
        allowed[from][msg.sender] = allowed[from][msg.sender] - tokens;
        balance[to] = balance[to] + tokens;
        emit Transfer(from, to, tokens);
        return true;
    }

    function approve(address delegate, uint tokens) public returns(bool) {
        allowed[msg.sender][delegate] = tokens;
        emit Approval(msg.sender, delegate, tokens);
        return true;
    }

    function allowance(address tokenOwner, address delegate) public view returns (uint) {
        return allowed[tokenOwner][delegate];
    }
}

//owner
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

//delegate
// 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db

//receiver
//0xdD870fA1b7C4700F2BD7f44238821C26f7392148



// Assignment

// validate - total and balance of each address
// So an address should not be able to send more than its balance and more than total supply