# Tutorial
 - [(03:08:39) | Lottery project setup](https://youtu.be/sas02qSFZ74?t=11319)
 - [(03:25:16) | Logging Events, Viewing Events, Events in brownie](https://youtu.be/sas02qSFZ74?t=12316)

# Provely Random Raffle Contracts

## About
 - This code is to create a provely random smart contract lottery.
 - [Events](https://docs.soliditylang.org/en/latest/contracts.html#events) allow you to print stuff to this log. (Events and logs are present in special data structure that is not accessable)


## What we want it to do?
 1. Users can enter by paying for a ticket
    1. The ticket fees are going to go to the winner during the draw
 2. After X period of time, the lottery will automitically draw a winner
    1. And this will be done programatically 
 3. Using chainlink VRF & Chainlink Automation
    1. Chainlink VRF -> Randomness
    2. Chainlink AUtomation -> Time based trigger

 - Till - https://youtu.be/sas02qSFZ74?t=12278
___
___
___

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```