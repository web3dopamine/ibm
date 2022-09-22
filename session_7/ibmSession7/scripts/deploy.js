// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  // const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  // const ONE_YEAR_IN_SECS = 365 * 24 * 60 * 60;
  // const unlockTime = currentTimestampInSeconds + ONE_YEAR_IN_SECS;

  // const lockedAmount = hre.ethers.utils.parseEther("1");
  let abi = [
    "event GreeterEvent(string NewGreeting)",
    "function greet() view returns (string memory)",
    "function setGreeting(string memory _greeting)",
  ];


  const Greeter = await hre.ethers.getContractFactory("Greeter");
  const greeter = await Greeter.deploy("Hi! world");


  // Connect to the network
// let provider = ethers.getDefaultProvider("homestead");
let httpProvider = new ethers.providers.JsonRpcProvider();

// The address from the above deployment example
let contractAddress = "0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9";

// We connect to the Contract using a Provider, so we will only
// have read-only access to the Contract
let contract = new ethers.Contract(contractAddress, abi, httpProvider);

// A Signer from a private key
let privateKey = '0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80';
let wallet = new ethers.Wallet(privateKey, httpProvider);

// Create a new instance of the Contract with a Signer, which allows
// update methods
let contractWithSigner = contract.connect(wallet);

  let tx = await contractWithSigner.setGreeting("whats up!");

  await greeter.deployed();

  console.log(
    `successfully deployed`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
