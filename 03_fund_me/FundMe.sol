// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;


import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


/**
 * Get funds from users (minimum 5 USD)
 * Withdraw funds to the owner of the contract
 * Set a minimum funding value in USD
 */


contract FundMe {
    uint256 public myVal = 1;
    uint256 public minUSD = 5;
    /**
     * address payable: Same as address, but with the additional members transfer and send.
     * https://docs.soliditylang.org/en/v0.8.25/types.html#address
     * It is important to also provide the`payable` keyword here, otherwise the function will automatically reject all Ether sent to it.
     * It is often a good idea to use `require` to check if functions are called correctly.
     * Undo any actions that have been done, and the remaining gas back -> https://youtu.be/umepbfKp5rI?t=15516
     *
     * https://docs.soliditylang.org/en/develop/units-and-global-variables.html#block-and-transaction-properties
     * msg.value (uint): number of wei sent with the message
     * The values of all members of msg, including msg.sender and msg.value can change for every external function call. This includes calls to library functions.
     *
     * https://chain.link/education-hub/oracle-problem
     * The blockchain oracle problem refers to the inability of blockchains to access external data, making them isolated networks, akin to a computer with no Internet connection. Bridging the connection between the blockchain (onchain) and the outside world (offchain) requires an additional piece of infrastructure—an oracle.
     * Centralized Blockchain Oracles:
     *
     * https://chain.link/education/blockchain-oracles
     * Blockchain oracles are entities that connect blockchains to external systems, thereby enabling smart contracts to execute based upon inputs and outputs from the real world.
     *
     * https://docs.chain.link/data-feeds
     * Chainlink Data Feeds are the quickest way to connect your smart contracts to the real-world data such as asset prices, reserve balances, NFT floor prices, and L2 sequencer health.
     * https://data.chain.link/feeds
     * https://data.chain.link/feeds/ethereum/mainnet/eth-usd
     *
     * Operating a Chainlink node allows you to be part of the Chainlink Network, helping developers build hybrid smart contracts, giving them access to real-world data and services.
     * https://docs.chain.link/chainlink-nodes
     */

     // Recap- 4:36:22 https://youtu.be/umepbfKp5rI?t=16582
    function fund() public payable {
        myVal = myVal + 2; // This line will be revarted if (msg.value > 1e18) is not true, therefore if it add 2 to myVal it will be revarted to previous value
        // require(msg.value > 1e18, "Didn't send enough ETH!");// 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18
        require(msg.value > minUSD, "Didn't send enough ETH!"); // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18
    }

    function withdraw() public {}

    function getPrice() public view returns(uint256){
        /**
         * To work with an contract we need Address of that contract and ABI
         * To consume price data, your smart contract should reference AggregatorV3Interface, which defines the external functions implemented by Data Feeds.
         * https://docs.chain.link/data-feeds/using-data-feeds#solidity
         * https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol
         * 
         * Get address from here https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1
         * Network: Sepolia Testnet
         * Aggregator: ETH/USD
         * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
         */

         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        ( /* uint80 roundID */, int price, /*uint startedAt*/, /*uint timeStamp*/, /*uint80 answeredInRound*/ ) =priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate() public {}


    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }
}

/**
 * Every transaction will have some attribute
 * Nonce: tx count for the account
 * Gas price: price per unit of gas (in wei)
 * Gas Limit: max gas that this tx can use
 * To: address that the tx is sent to
 * Value amount of wei to send
 * Data: what to send to the To address
 * v,r,s: components of tx signature
 */

// https://youtu.be/umepbfKp5rI?t=16019
// $70163.47000000