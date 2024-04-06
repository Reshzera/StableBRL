// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "contracts/IStableBRL.sol";

contract Exchange {
    address private immutable owner;
    IStableBRL private immutable stableBRL;

    constructor(address contractAddressStableBRL) {
        owner = msg.sender;
        stableBRL = IStableBRL(contractAddressStableBRL);
    }

    function deposit(address account, uint256 value) external onlyOwner {
        stableBRL.mint(account, value);
    }

    function withdraw(address account, uint256 value) external onlyOwner {
        stableBRL.burn(account, value);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can use the exchange");
        _;
    }
}
