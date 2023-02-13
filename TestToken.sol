// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestToken is ERC20, Ownable {
    constructor() ERC20("TestToken", "TTK") {}

    function mint(address to, uint256 amount) public onlyOwner {
    require(amount<1000000,"amount should be less than 1 million");
        _mint(to, amount);
    }
}
