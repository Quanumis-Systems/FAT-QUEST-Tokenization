// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AxonalBridgeProtocol is Ownable {

    enum BridgeStatus { PENDING, ACTIVE, CLOSED }

    struct AxonalBridge {
        address creator;
        string metadataUrl;
        BridgeStatus status;
    }

    mapping(uint256 => AxonalBridge) public bridges;
    uint256 public bridgeCounter;

    constructor() Ownable(msg.sender) {}

    function createAxonalBridge(string memory metadataUrl) public onlyOwner returns (uint256) {
        bridgeCounter++;
        bridges[bridgeCounter] = AxonalBridge(msg.sender, metadataUrl, BridgeStatus.PENDING);
        return bridgeCounter;
    }

    function activateBridge(uint256 bridgeId) public onlyOwner {
        bridges[bridgeId].status = BridgeStatus.ACTIVE;
    }

    function closeBridge(uint256 bridgeId) public onlyOwner {
        bridges[bridgeId].status = BridgeStatus.CLOSED;
    }

    function addDataToBridge(uint256 bridgeId, address contributor, bytes memory data) public {
        // Logic to add data to a bridge
        // For now, it's just a placeholder
    }
}
