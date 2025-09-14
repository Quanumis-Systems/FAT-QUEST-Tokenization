// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./FAT_QUEST.sol";
import "./AxonalBridgeProtocol.sol";

contract ProjectSynergy {
    struct Project {
        address creator;
        string description;
        uint256 axonalBridgeId;
        // Further details about the project
    }

    Project[] public projects;
    FATQuest private fatQuest;
    AxonalBridgeProtocol private axonalBridgeProtocol;

    constructor(address _fatQuestAddress, address _axonalBridgeProtocolAddress) {
        fatQuest = FATQuest(_fatQuestAddress);
        axonalBridgeProtocol = AxonalBridgeProtocol(_axonalBridgeProtocolAddress);
    }

    function createProject(string memory description) public {
        uint256 axonalBridgeId = axonalBridgeProtocol.createAxonalBridge(description);
        projects.push(Project(msg.sender, description, axonalBridgeId));
        // Further logic for project creation
    }

    function addComponentToProject(uint256 projectId, string memory componentDescription, bytes memory componentData) public {
        require(projectId < projects.length, "Project does not exist");
        Project storage project = projects[projectId];
        
        // Logic to add a component to a project
        // This could involve creating a new task on the axonal bridge
        axonalBridgeProtocol.addDataToBridge(project.axonalBridgeId, msg.sender, componentData);
    }

    // further functions for managing projects and components
}
