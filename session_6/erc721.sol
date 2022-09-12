// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/introspection/ERC165.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/common/ERC2981.sol?s=09";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract MyNFT is ERC721, ERC721URIStorage, ERC2981, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    bytes4 public constant ID_ERC721 = type(IERC721).interfaceId;
   

    mapping(address => uint256[]) public mapNFT;

    constructor() ERC721("MyNFT", "MNFT"){}

    function setRoyalty(address receiver, uint96 feeNumerator) public onlyOwner {
        _setDefaultRoyalty(receiver, feeNumerator);
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
        super._setTokenURI(tokenId, _tokenURI);
    }

    function mint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        mapNFT[msg.sender];
    }
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage){
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory){
        return super.tokenURI(tokenId);
    } 

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC2981) returns(bool){
        return super.supportsInterface(interfaceId);
    }
}