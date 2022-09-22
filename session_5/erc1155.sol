// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/extensions/ERC1155Supply.sol";

contract MyNFT is ERC1155, ERC1155Supply, Ownable {
    
    constructor() ERC1155("https://api.jsonbin.io/v3/qs/6319d4f05c146d63ca938510"){}

    function mint(address to, uint256 tokenId, uint256 amount, bytes memory data) public onlyOwner {
        _mint(to, tokenId, amount, data);
    }
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amount, bytes memory data) public onlyOwner {
        _mintBatch(to, ids, amount, data);
    }

    function _beforeTokenTransfer(    address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal override(ERC1155, ERC1155Supply){
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}