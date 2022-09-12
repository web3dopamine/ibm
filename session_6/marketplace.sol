pragma solidity ^0.8.0;

contract MarketPlace {
     constructor(){}

    uint256 constant fee = 0.000001 ether;


    event NFTlisted()

    event NFTSold()

    event NFTlistingExpire()

    struct NFT {
        address NFTcontract;
        uint256 tokenId;
        address seller;
        address buyer;
        uint256 price;
        bool listed;
        uint256 amount;
    }

     function listNFT() public {

     }
     
     function buyNFT() public payable {

     }
     function sellNFT() public payable {

     }

    function getAllListedNFTs() public view returns(uint){}

    function getMyNFTsListed() public view returns(uint){}

    function getListingFee() public view returns(uint){}
}