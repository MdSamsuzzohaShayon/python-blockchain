#/bin/bash

# Encoding SVG file
cat Makefile 
make deploy ARGS="--network sepolia"
base64 --help

# Making encoded hash
base64 -i img/example-1.svg

# Decoding SVG file
# data:image/svg+xml;base64,<ENCODED_HASH>
forge test --fork-url $SEPOLIA_RPC_URL







forge fmt
make mint
make deploy
make deployMoood
cast send <DEPLOYED_CONTRACT_ADDRESS> "mintNft()" --private-key <ACCOUNT_PRIVATE_KEY_ANVIL> --rpc-url http://localhost:8545
cast send <DEPLOYED_CONTRACT_ADDRESS> "flipMood(uint256)" 0 --private-key <ACCOUNT_PRIVATE_KEY_ANVIL> --rpc-url http://localhost:8545
cast sig "transferFrom(address, address, uint256)"
# https://openchain.xyz/signatures?query=0x23b872dd
cast --calldata-decode "transferFrom(address, address, uint256)" 0x5FbDB2315678afecb367f032d93F642f64180aa3
