# Tutorials

## Previous
 - [(03:08:39) | Lottery project setup](https://youtu.be/sas02qSFZ74?t=11319)
 - [(03:22:16) | Logging Events, Viewing Events, Events in brownie](https://youtu.be/sas02qSFZ74?t=12316)
 - [(03:37:38) | Chainlink VRF to generate random number](https://youtu.be/sas02qSFZ74?t=13058)
 - [(03:47:21) | Using chainlink VRF](https://youtu.be/sas02qSFZ74?t=13641)
## Current
 - [(14:53:00) | Populate Chainlink VRF request](https://youtu.be/-1GB6m39-rM?t=53581)
 - [(15:24:29) | Pick random winner](https://youtu.be/-1GB6m39-rM?t=55469)
 - [(15:40:00) | CEI - Check, Effects, Interactions, and Chainlink Automation](https://youtu.be/-1GB6m39-rM?t=56402)
 - [(16:00:10) | Chainlink Automation Implementation](https://youtu.be/-1GB6m39-rM?t=57611)
 - [(16:17:12) | Deploying mock and such in sepolia or anvil network](https://youtu.be/-1GB6m39-rM?t=58632)
 - [(16:41:35) | Testing Raffle.sol setup](https://youtu.be/-1GB6m39-rM?t=60095)
 - [(17:07:00) | Create VRF subscription (programitially and using User interface))](https://youtu.be/-1GB6m39-rM?t=61621)
 - [(17:29:21) | Fund Subscription and pass the test properly](https://youtu.be/-1GB6m39-rM?t=62961)
 - [(17:57:40) | More tests, Perform upkeep tests](https://youtu.be/-1GB6m39-rM?t=64660)
 - [(18:43:00) | Running all those tests properly with Sepolia RPC](https://youtu.be/-1GB6m39-rM?t=67381)
 - [(18:55:22) | Homework for Integration tests / Deploy our contract to Sepolia testnet / Chainlink automation](https://youtu.be/-1GB6m39-rM?t=68122)
 - [(19:16:29) | Debugging & Recap](https://youtu.be/-1GB6m39-rM?t=69389)
 - [(19:24:49) | Advanced Foundry](https://youtu.be/-1GB6m39-rM?t=69889)

## Docs
 - **This is just for testing purpose** However we should never test in Sepolia testnet (Test everything locally first)
 - [Register upkeep](https://automation.chain.link/sepolia) -> custom logic -> contract address is the address of the contract we have deployed in our sepolia testnet. -> set upkeep name -> starting balance 1 link
 - Upload verify-contract.json manually to sepolia etherscan if for some reason the contract is not deployed by default
 - Automate your smart contract with Chainlink’s hyper-reliable Automation network. - https://automation.chain.link/base-sepolia/new

 - [Till](https://youtu.be/-1GB6m39-rM?t=69848)
# Provely Random Raffle Contracts

## About
 - This code is used to create a profile for a random smart contract lottery.
 - [Events](https://docs.soliditylang.org/en/latest/contracts.html#events) allows you to print stuff to this log. (Events and logs are present in a special data structure that is not accessible)
 - [Using Chainlink VRF]()


## What do we want it to do?
 1. Users can enter by paying for a ticket
    1. The ticket fees are going to go to the winner during the draw
 2. After X period of time, the lottery will automatically draw a winner
    1. And this will be done programmatically 
 3. Using chainlink VRF & Chainlink Automation
    1. Chainlink VRF -> Randomness
    2. Chainlink AUtomation -> Time-based trigger

## Tests
 1. Write deploy scripts
   1. Note, these will not work on skSync (As of recording)
 2. Write tests
   1. Local chain
   2. Forked testnet
   3. Forked mainnet

 - Till - https://youtu.be/-1GB6m39-rM?t=67381






___
___
___

## Foundry

**Foundry is a blazingly fast, portable, and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat, and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions, and getting chain data.
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