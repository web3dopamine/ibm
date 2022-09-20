const ethers = require('ethers');
async function main() {
// The Contract interface
let abi = [
    "event GreeterEvent(string NewGreeting)",
    "function greet() view returns (string memory)",
    "function setGreeting(string memory _greeting)",
];

// Connect to the network
// let provider = ethers.getDefaultProvider("homestead");
let httpProvider = new ethers.providers.JsonRpcProvider();

// The address from the above deployment example
let contractAddress = "0xe7f1725e7734ce288f8367e1bb143e90bb3f0512";

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

// The operation is NOT complete yet; we must wait until it is mined
await tx.wait();

// let tx2 = await contractWithSigner.setGreeting("whats up!");

// The operation is NOT complete yet; we must wait until it is mined
// await tx.wait();

contract.on("GreeterEvent", (NewGreeting, event)=> {
	console.log("New Greeting is", NewGreeting);
})

}

main();