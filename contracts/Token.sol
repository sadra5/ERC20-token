// SPDX-License-Identifier: MIT


pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract myToken is  ERC20Capped, ERC20Burnable {
    address payable public owner;
    uint256 public blockReward;

    constructor (string memory name_, string memory symbol_, uint initailSupply, uint256 cap, uint256 blockReward_) ERC20 (name_, symbol_) ERC20Capped(cap * (10 ** decimals() )) {
        owner = payable(msg.sender);
        _mint(owner, initailSupply * (10 ** decimals()));
        blockReward = blockReward_ * (10 ** decimals()); 
    }

    function setBlockReward(uint256 reward) public onlyOwner {
        blockReward = reward * (10 ** decimals());
    }

    function _mintMinerReward() internal {
        _mint(block.coinbase, blockReward);
    }

    function _update(address from, address to, uint256 value) internal virtual override(ERC20, ERC20Capped) {
        if (!(from == address(0) && to == block.coinbase)) {
            _mintMinerReward();
        }
        super._update(from, to, value);
    }

    function destroy() public onlyOwner{
        selfdestruct(owner);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "only owner can call this function");
        _;
    }
} 