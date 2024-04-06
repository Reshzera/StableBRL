// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface IStableBRL {
    function setExchangeAddress(address _exchangeAddress) external;

    function mint(address account, uint256 value) external;

    function burn(address account, uint256 value) external;
}
