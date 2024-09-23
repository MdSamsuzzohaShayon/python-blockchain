// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
// lib/chainlink-brownie-contracts/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2_5Mock.sol
import {VRFCoordinatorV2_5Mock} from "@chainlink/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2_5Mock.sol";
import {LinkToken} from "test/mocks/LinkToken.sol";

abstract contract CodeConstants {
    // VRF Mock Values
    uint96 public MOCK_BASE_FEE = 2.25 ether;
    uint96 public MOCK_GAS_PRICE_LINK = 1e9;
    int96 public MOCK_WEI_PER_UNIT_LINK = 4e15; // MOCK_WEI_PER_UINT_LINK

    uint256 public constant ETH_SEPOLIA_CHAIN_ID = 11155111;
    uint256 public constant LOCAL_CHAIN_ID = 31337;
}

contract HelperConfig is CodeConstants, Script {
    error HelperConfig__InvalidChainId();

    struct NetworkConfig {
        uint256 entranceFee;
        uint256 interval;
        address vrfCoordinator;
        bytes32 gasLane;
        uint32 callbackGasLimit;
        uint256 subscriptionId;
        address link;
        address account;
    }

    NetworkConfig public localNetworkConfig;
    mapping(uint256 chainId => NetworkConfig) public networkConfigs;

    constructor() {
        networkConfigs[ETH_SEPOLIA_CHAIN_ID] = getSepoliaEthConfig();
    }

    function getConfigByChainId(uint256 chainId) public returns (NetworkConfig memory) {
        if (networkConfigs[chainId].vrfCoordinator != address(0)) {
            return networkConfigs[chainId];
        } else if (chainId == LOCAL_CHAIN_ID) {
            // Get or create anvil eth config
            return getOrCreateAnvilEthConfig();
        } else {
            revert HelperConfig__InvalidChainId();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        return NetworkConfig({
            entranceFee: 0.01 ether, // 1e16
            interval: 30, // 30 seconds
            vrfCoordinator: 0x9DdfaCa8183c41ad55329BdeeD9F6A8d53168B1B, // https://docs.chain.link/vrf/v2-5/supported-networks#sepolia-testnet
            gasLane: 0x787d74caea10b2b357790d5b5247c2f63d1d91572a9846f780606e4d953677ae, // 100 gwei Key Hash -> https://docs.chain.link/vrf/v2-5/supported-networks#sepolia-testnet
            callbackGasLimit: 500000, // 500000 gas
            subscriptionId: 22306313612449588283480022287687747743722089014746490803157979491593498088321, // Script will create automitically subscription ID for us -> https://vrf.chain.link/#/side-drawer/subscription/22306313612449588283480022287687747743722089014746490803157979491593498088321
            link: 0x779877A7B0D9E8603169DdbD7836e478b4624789, // https://docs.chain.link/resources/link-token-contracts#sepolia-testnet
            account: 0x61e3dDcbdF250C5e775f78F91AF9b0A3230422bA // Sepolia account
        });
    }

    function getConfig() public returns (NetworkConfig memory) {
        return getConfigByChainId(block.chainid);
    }

    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory) {
        // Check to see if we set an active network config
        if (localNetworkConfig.vrfCoordinator != address(0)) {
            return localNetworkConfig;
        }

        // Deploy mock and such
        vm.startBroadcast();
        VRFCoordinatorV2_5Mock vrfCoordinatorMock =
            new VRFCoordinatorV2_5Mock(MOCK_BASE_FEE, MOCK_GAS_PRICE_LINK, MOCK_WEI_PER_UNIT_LINK);
        LinkToken linkToken = new LinkToken();
        vm.stopBroadcast();

        localNetworkConfig = NetworkConfig({
            entranceFee: 0.01 ether, // 1e16
            interval: 30, // 30 seconds
            vrfCoordinator: address(vrfCoordinatorMock),
            gasLane: 0x787d74caea10b2b357790d5b5247c2f63d1d91572a9846f780606e4d953677ae, // 100 gwei Key Hash -> https://docs.chain.link/vrf/v2-5/supported-networks#sepolia-testnet
            callbackGasLimit: 500000, // 500000 gas
            subscriptionId: 0, // Script will create automitically subscription ID for us
            link: address(linkToken),
            account: 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38 // Default address for tx.origin and msg.sender, 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38. -> lib/forge-std/src/Base.sol
        });

        return localNetworkConfig;
    }
}