// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.1/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.8.1/access/Ownable.sol";
import "@openzeppelin/contracts@4.8.1/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
}
 contract TestNFT is ERC721, Ownable, ReentrancyGuard
{
    IERC20 public TTK;
    address public _Owner;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor(address _contractaddress) ERC721("Test NFT", "TNFT") 
    {
        TTK=IERC20(_contractaddress);
        _Owner=msg.sender;
    }

   bool locked;
        function safeMint(address to) public nonReentrant 
    {
        require(!locked, "Reentrancy detected");
        locked = true;
        uint256 tokenId = _tokenIdCounter.current();
        TTK.transfer(_Owner,100);
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
       
        locked = false;
    
    }
}
