# StableBRL

## Overview

The StableBRL project consists of a series of smart contracts designed to create a stablecoin pegged to the Brazilian Real (BRL). These contracts are intended solely for educational purposes to demonstrate the interactions within a stablecoin system using Ethereum smart contracts.

## Contracts Description

### 1. StableBRL

This is the main token contract based on the ERC20 standard. It features mechanisms to mint and burn tokens through an authorized exchange contract.

- **Constructor:** Sets the token name to "StableBRL" and symbol to "SBRL". It also assigns the contract creator as the owner.
- **setExchangeAddress:** This function allows the owner to set the address of the authorized exchange contract.
- **mint:** Mints new tokens to a specified account, but can only be called by the authorized exchange.
- **burn:** Burns tokens from a specified account, only callable by the authorized exchange.
- **Modifiers:** `onlyExchange` to restrict minting and burning to the exchange contract, and `onlyOwner` to restrict administrative actions to the contract owner.

### 2. Exchange

This contract manages the distribution and redemption of the StableBRL tokens by interfacing with the StableBRL contract.

- **Constructor:** Sets the owner and links to the StableBRL contract using the provided address.
- **deposit:** Allows the owner to mint StableBRL tokens to a specified account.
- **withdraw:** Permits the owner to burn StableBRL tokens from a specified account.
- **Modifiers:** `onlyOwner` to ensure that only the contract owner can mint or burn tokens.

### 3. IStableBRL

An interface that outlines the functions for external interaction with the StableBRL contract by the Exchange.

- **setExchangeAddress:** Expected to update the exchange address in the StableBRL contract.
- **mint:** Specifies the minting function.
- **burn:** Specifies the burning function.
