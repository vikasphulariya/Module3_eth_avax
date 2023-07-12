// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MyToken is ERC20 {
    address public owner;

    constructor() ERC20("VikasPhulriya", "VP") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    function mint(address to, uint256 value) public onlyOwner {
        require(to != address(0), "Invalid address");
        require(value > 0, "Invalid value");

        _mint(to, value);
    }

    function transfer(address to, uint256 value) public override returns (bool) {
        require(to != address(0), "Invalid address");
        require(value > 0, "Invalid value");

        return super.transfer(to, value);
    }

    function burn(uint256 value) public {
        require(value > 0, "Invalid value");
        require(value <= balanceOf(msg.sender), "Insufficient balance");

        _burn(msg.sender, value);
    }
}