pragma solidity ^0.8.0;
contract Verifier {
    mapping(bytes32 => string) public userData; // map to store bank account number to signature
    string signature;
    
    function storeSign(string memory _signature, bytes32 bankAccount) public returns(string memory)
    {
            userData[bankAccount] = signature;
    }
    
    function recoverAddr(bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) public returns (address) {
        return ecrecover(msgHash, v, r, s);
    }
    
    function isSigned(address _addr, bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) public returns (bool) {
        return ecrecover(msgHash, v, r, s) == _addr;
    }
    
    
}