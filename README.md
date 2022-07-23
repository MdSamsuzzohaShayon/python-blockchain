# Python Blockchain
 - [tutorials](https://www.youtube.com/watch?v=M576WGiDBdQ&t=2627s), [docs](https://github.com/smartcontractkit/full-blockchain-solidity-course-py)
### Blockchain 00:06:25
 - **Bitcoin** was the first one to take blockchain mainstream
 - **Bitcoin** is like digital gold
 - Bitcoin can be used to make peer-to-peer transactions in a decentralized network. This network is powered by cryptography allowes prople to engage in censorship resistant finance in a decentralized manner.
 - **Ethereum** allows for smart contracts
 - Chainlink provides data and external compution to smart contract
 - Ethereum used the same blockchain infrastructure with an additional feature. Decentralized application, decentralized organization and build smart contracts and engage in agreements without third party, intermediary or centralized governing force.
 - Smart contract is a self-executing set of instructions that is executed without a third party intermediary
 - Bitcoin does also have smart contract however they are not touring complete, meaning, they don't have the full range of capabilities.
 - The ethereum protocol has given rise to many new paradigms and industries including d5, nfts, dows or decentralized
 - **Hybrid Smart Contract** combine on-chain and off-chain components
### Characteristics 00:15:06
 1. Decentralized - there is no centralized source that controls the blockchain, the individuals that make up blockchain are known as node operators
 2. Transparent - Everything that's done on a blockchain and all the rules that are made can be seen by everyone
 3. Speed
 4. Immutable - Blockchains are immutable which means they can't be changed. Because of this they can't be tampered with or corrumted in any way shape
 5. Remove counterparty risk
 6. Allow for trust minimized agreements
 7. Hybrid smart contracts combine on and off-chain

### Digital wallet (Metamask) 00:25:00
 - We must need to backup **Secret Recovery Phrase** in order to keep real money - if anyone has that recovery phrase he will have access to our wallet and all of the funds
 - Install metamask chrome extension -> create account - account details -> export private key -> download and save private key -> copy address -> scan address with __https://etherscan.io__ or __https://rinkeby.etherscan.io__ (for testing)
 - One private key is only for one single account of our wallet
 - Make a tweet with ether address and post the tweet here __https://faucet.rinkeby.io/__ to get free testing ether 

| **Concept** | **Access** | **Public or private** |  |
|---|---|---|---|
| Mnemonic | All accounts | Keep Private |  |
| Private Key | 1 Account | Keep Private |  |
| Public Address | Nothing | It is public |  |

 - When we work with eth, working with ethereum mainnet when intract with smart contract, d5, or any other mainnet real value to be working on mainnet
 - There are some testnets to resemble ethereum before using it. Not real money this is just for testing

### Gas 00:36:52
 - Whenever we do something on the block chain it cost gas. The amount of **gas** used and how much to pay depends on how **computationally expensive** the transaction is.
 - Gas - Measure of computation use
 - Gas price - how much it costs per unit of gas
 - Gas Limit - Max amount of gas in a transaction 
 - Transaction fees - gas used x gas price
 - E.g. 21000 gas @ 1 GWEI per gas = 21000 GWEI

### Blockchain demo 00:44:25

### Concept definations - (01:00:00)
 0. Get ideas of [blockchain](https://andersbrownworth.com/)
 1. **Hash** - Unique fixed length string to identify a peace of data
 2. **Hash Algorithms** - A function that computes data into a unique hash
 3. **Mining** - the process of finding solutions to the blockchain problem. e.g. The problem to find a hash that starts with 4 zeros. nodes get paid for mining block.
 4. **Block** - a list of transactions mined together
 5. **Decentralized** - having no single point of authority
 6. **Nonce** - a number used once to find the solution to the blockchain problem. It's also used to define the transaction number for an account/address.
 7. **Nonce** - a number used once to find the solution to the blockchain problem.
 8. **Private key** - Only known to the key holder, it is used to sign transactions
 9. **Public key** - is derived from private key. Anyone can see it, and use it to verify that a transaction came from.
 10. Private key -> public key -> address





- Attacks - 01:19:28
- Scalability -> sharding -> layer 1: base layer blockchain implementation -> layer 2: any application that is build on top of a layer 2 - 01:25:32

### Reacp 01:28:00
 - ETH and BTC are both proof of work (in 2022), 
 - ETH 2.0 will be proof of stake
 - POW & POS are sybil resistance mechanisms
 - The bigger the blockchain, the more secure
 - Consensus is how blockchain decide what the state of the chain is
 - Sharding and rollups are scalability solutions
 - Only so many transactions can fit into a block

### Solidity code 01:29:25
 - [Lesson 1: Welcome to Remix! Simple Storage](https://github.com/smartcontractkit/full-blockchain-solidity-course-py#lesson-1-welcome-to-remix-simple-storage) -> [Github code](https://github.com/PatrickAlphaC/simple_storage) -> [remix ide](https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.7+commit.e28d00a7.js)
 - [Lesson 2: Storage Factory 02:09:30](https://github.com/PatrickAlphaC/storage_factory) 
 - [Lesson 3: fund me 02:26:30](https://github.com/smartcontractkit/full-blockchain-solidity-course-py#lesson-3-fund-me)
 - [Lesson 4: Simple Storage Python 03:32:50](https://github.com/PatrickAlphaC/web3_py_simple_storage)
 - [Chainlink](https://data.chain.link/)

### Deploy with python on local environment 03:28:00
 - [**Ganache**](https://trufflesuite.com/ganache/) - Quickly fire up a personal Ethereum blockchain which you can use to run tests, execute commands, and inspect state while controlling how the chain operates.
 - Download, install and quickstart ganache desktop - (03:50:00)
 - We can also use ganache cli - (04:18:00) (more friendly for programmer)
    ```
    sudo npm install --global yarn
    yarn global add ganache-cli
    // or
    sudo npm install --global ganache-cli
    ganache --version
    ```
 - deploy with ganache cli in terminal
 ```
 # keep ganache cli running
 ganache -d
 # run the code on another terminal or tab
 python3 deploy.py
 ```
 - [Install web3.py](https://pypi.org/project/web3/) `pip install web3`





Rivision 02:26:00
Till 03:44:00
















































