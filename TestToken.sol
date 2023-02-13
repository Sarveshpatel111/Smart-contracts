// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract TestToken is ERC20, Ownable {
    using SafeMath for uint;
    uint thetotalSupply;

    mapping (address => uint) public balances;

    constructor() ERC20("TestToken", "TTK") {
        thetotalSupply = 0;

         balances[msg.sender] = thetotalSupply;
    }

    function mint(address to, uint amount) public onlyOwner {
        _mint(to , amount);

        thetotalSupply = thetotalSupply.add(amount);
        balances[to] = balances[to].add(amount);
        require(thetotalSupply<=1000000,"total amount should be less than 1 million");
    }
}
