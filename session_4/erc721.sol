// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OPCodeNFT is
    ERC721,
    ERC721Enumerable,
    ERC721URIStorage,
    AccessControl,
    Ownable
{
    using Counters for Counters.Counter;

    struct OPNFTData {
        uint256 tokenId;
        string name;
        string stack;
        address owner;
    }
    mapping(uint256 => OPNFTData) public nftData;

    Counters.Counter private _tokenIdCounter;
    uint256 private maxSupply = 142;

    constructor() ERC721("OPCodeNFT", "OPCD") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function safeMint(
        address to,
        string memory uri,
        string memory _stack,
        string memory _name,
        uint256 _price
    ) external payable {
        require(msg.value == _price);
        uint256 tokenId = _tokenIdCounter.current(); //1
        require(tokenId <= maxSupply, "Only 143 NFTs can be minted");
        // _tokenIdCounter.increment(); //3
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        nftData[tokenId] = OPNFTData(tokenId, _name, _stack, msg.sender);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function withdrawFunds() external payable onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0);
        payable(owner()).transfer(balance);
    }
}