// SPDX-License-Identifier: MIT


pragma solidity ^0.8.19;

import "@openzeppelin/contracts/toen/ERC20/ERC20.sol";
import "@openzeppelin/contracts/toen/ERC20/ERC20Capped.sol";
import "@openzeppelin/contracts/toen/ERC20/ERC20Burnable.sol";

contract myToken is  ERC20Capped, ERC20Burnable {

    constructor (string memory name_, string memory symbol_, uint initailSupply, uint256 cap) ERC20 (name_, symbol_) ERC20Capped(cap * (10 ** decimals )) {
        _mint(msg.sender, initailSupply * (10 ** decimals));
    }
} 