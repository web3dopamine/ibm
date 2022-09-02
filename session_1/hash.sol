pragma solidity ^0.8.0;

contract Hashfunc {

function hashSHA256(uint256 _x, string memory _name, address _add) public pure returns(bytes32){
    return sha256(abi.encode(_x, _name, _add));
}

function hashKeccak256(uint256 _x, string memory _name, address _add) public pure returns(bytes32){
    return keccak256(abi.encode(_x, _name, _add));
    }
}