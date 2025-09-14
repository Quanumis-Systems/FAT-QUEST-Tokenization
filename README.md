# FAT QUEST: Fractal Agentic Tokenization

This repository contains the official implementation of the **FAT QUEST** protocol, a revolutionary tokenomics model that leverages **Fractal Agentic Tokenization** to create a dynamic, adaptive, and intelligent currency system. The core of this system is the **Quanumis User Experience Smart Token (QUEST)**.

For a detailed exploration of the concepts, design, and implications of this model, please see the [**FAT QUEST Whitepaper**](./quanumis_systems_whitepaper.md).

## Core Concepts

The FAT QUEST protocol moves beyond static tokens to create a living economic ecosystem. The key principles are:

-   **Fractal Nature:** QUESTs are composed of smaller, fundamental units called “fractals.” This modularity allows for granular control and customization of token utility.

-   **Emergent Agency:** Individual fractals are passive building blocks contributing to the network's infrastructure. However, when combined into a complete QUEST, they unlock **agentic capabilities**, allowing the token to analyze data, make decisions, and interact with the ecosystem.

-   **Personalized Functionality & Governance:** QUESTs can be customized for specific use cases. Users can also "nest" tokens to create hierarchical structures for governance proposals, representing a collective investment in new ideas.

-   **Intrinsic Rewards:** The system is designed to intrinsically reward participation. All fractals are automatically staked by default and passively grow and evolve over time, eventually maturing into complete QUESTs.

## Repository Contents

-   `/contracts`: Contains the Solidity smart contracts that define the FAT QUEST protocol, including the logic for Fractals and QUESTs.
-   `/scripts`: Includes deployment scripts for deploying the smart contracts to an Ethereum network.
-   `/client`: A React-based frontend application for interacting with the deployed FAT QUEST smart contracts.
-   `hardhat.config.js`: The configuration file for the Hardhat development environment.

## Getting Started

To get started with developing and testing the FAT QUEST protocol, you will need Node.js and npm installed.

### Backend (Smart Contracts)

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/fat-quest.git
    ```

2.  **Install dependencies:**
    ```bash
    npm install
    ```

3.  **Compile the smart contracts:**
    ```bash
    npx hardhat compile
    ```

4.  **Run a local blockchain node:**
    ```bash
    npx hardhat node
    ```

5.  **Deploy the contracts to your local node:**
    In a new terminal, run the deployment script:
    ```bash
    npx hardhat run scripts/deploy.js --network localhost
    ```

### Frontend (Client Application)

1.  **Navigate to the `client` directory:**
    ```bash
    cd client
    ```

2.  **Install client dependencies:**
    ```bash
    npm install
    ```

3.  **Start the development server:**
    ```bash
    npm start
    ```

The frontend will now be running and available at `http://localhost:3000`.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more information.
