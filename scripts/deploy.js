const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  // Deploy FATQuest
  const FATQuest = await hre.ethers.getContractFactory("FATQuest");
  const fatQuest = await FATQuest.deploy(deployer.address);
  await fatQuest.deployed();
  console.log("FATQuest deployed to:", fatQuest.address);

  // Deploy AxonalBridgeProtocol
  const AxonalBridgeProtocol = await hre.ethers.getContractFactory("AxonalBridgeProtocol");
  const axonalBridgeProtocol = await AxonalBridgeProtocol.deploy();
  await axonalBridgeProtocol.deployed();
  console.log("AxonalBridgeProtocol deployed to:", axonalBridgeProtocol.address);

  // Deploy EV.AI
  const EVAI = await hre.ethers.getContractFactory("EVAI");
  const evai = await EVAI.deploy(fatQuest.address, axonalBridgeProtocol.address);
  await evai.deployed();
  console.log("EVAI deployed to:", evai.address);

  // Deploy OrganicBonds
  const OrganicBonds = await hre.ethers.getContractFactory("OrganicBonds");
  const organicBonds = await OrganicBonds.deploy(fatQuest.address, axonalBridgeProtocol.address);
  await organicBonds.deployed();
  console.log("OrganicBonds deployed to:", organicBonds.address);

  // Deploy ProjectSynergy
  const ProjectSynergy = await hre.ethers.getContractFactory("ProjectSynergy");
  const projectSynergy = await ProjectSynergy.deploy(fatQuest.address, axonalBridgeProtocol.address);
  await projectSynergy.deployed();
  console.log("ProjectSynergy deployed to:", projectSynergy.address);

  // Deploy QuanumisMultiversity
  const QuanumisMultiversity = await hre.ethers.getContractFactory("QuanumisMultiversity");
  const quanumisMultiversity = await QuanumisMultiversity.deploy(fatQuest.address, axonalBridgeProtocol.address);
  await quanumisMultiversity.deployed();
  console.log("QuanumisMultiversity deployed to:", quanumisMultiversity.address);

  // Deploy Timelock
  const Timelock = await hre.ethers.getContractFactory("TimelockController");
  const timelock = await Timelock.deploy(3600, [], [], deployer.address);
  await timelock.deployed();
  console.log("Timelock deployed to:", timelock.address);

  // Deploy QuanumisDAO
  const QuanumisDAO = await hre.ethers.getContractFactory("QuanumisDAO");
  const quanumisDAO = await QuanumisDAO.deploy(fatQuest.address, timelock.address);
  await quanumisDAO.deployed();
  console.log("QuanumisDAO deployed to:", quanumisDAO.address);

  // Grant roles
  const proposerRole = await timelock.PROPOSER_ROLE();
  const executorRole = await timelock.EXECUTOR_ROLE();
  const adminRole = await timelock.TIMELOCK_ADMIN_ROLE();

  await timelock.grantRole(proposerRole, quanumisDAO.address);
  await timelock.grantRole(executorRole, quanumisDAO.address);
  await timelock.revokeRole(adminRole, deployer.address);

  console.log("Deployment complete!");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
