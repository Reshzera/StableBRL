// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IStableBRL.sol";

contract StableBRL is ERC20, IStableBRL {
    address private exchangeAddress;
    address private immutable owner;

    constructor() ERC20("StableBRL", "SBRL") {
        owner = msg.sender;
    }

    function setExchangeAddress(address _exchangeAddress) external onlyOwner {
        exchangeAddress = _exchangeAddress;
    }

    function mint(address account, uint256 value) external onlyExchange {
        _mint(account, value);
    }

    function burn(address account, uint256 value) external onlyExchange {
        _burn(account, value);
    }

    modifier onlyExchange() {
        require(msg.sender == exchangeAddress, "Only exchange can mint/burn");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can change exchange address");
        _;
    }
}
