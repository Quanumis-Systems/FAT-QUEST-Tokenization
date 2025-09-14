// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./FAT_QUEST.sol";
import "./AxonalBridgeProtocol.sol";

contract EVAI {
    struct DataRequest {
        address requester;
        string description;
        uint256 axonalBridgeId;
        // Further details about the data request
    }

    DataRequest[] public dataRequests;
    FATQuest private fatQuest;
    AxonalBridgeProtocol private axonalBridgeProtocol;

    constructor(address _fatQuestAddress, address _axonalBridgeProtocolAddress) {
        fatQuest = FATQuest(_fatQuestAddress);
        axonalBridgeProtocol = AxonalBridgeProtocol(_axonalBridgeProtocolAddress);
    }

    function createDataRequest(string memory description) public {
        uint256 axonalBridgeId = axonalBridgeProtocol.createAxonalBridge(description);
        dataRequests.push(DataRequest(msg.sender, description, axonalBridgeId));
        // Further logic for creating a data request
    }

    function contributeData(uint256 requestId, bytes memory data) public {
        require(requestId < dataRequests.length, "Data request does not exist");
        DataRequest storage request = dataRequests[requestId];
        
        // Logic to contribute data to a request
        // This could involve creating a new task on the axonal bridge
        axonalBridgeProtocol.addDataToBridge(request.axonalBridgeId, msg.sender, data);
    }

    // further functions for managing data requests and contributions
}
