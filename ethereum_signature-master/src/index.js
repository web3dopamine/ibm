var abi = require('ethereumjs-abi');
// Require web3 to instantiate
const Web3 = require("web3");

// Get elements from DOM
// // Elements of the signing process
const dataToSign = document.getElementById("data-to-sign");
const accountInput = document.getElementById("account");
const signButton = document.getElementById("sign-button");
const dataSigned = document.getElementById("data-signed");

// // Elements of the recover process
const signature = document.getElementById("signature");
const originalText = document.getElementById("original-text");
const accountThatSigned = document.getElementById("account-that-signed");
const recoverButton = document.getElementById("recover-button");

// Event handlers
// // Method that signs data
const signData = () => {

  // recipient = is the address that should be paid.
  // amount, = in wei, specifies how much ether should be sent.
  // nonce can be any unique number to prevent replay attacks
  // contractAddress is used to prevent cross-contract replay attacks

  var hash = "0x" + abi.soliditySHA3(
    ["address", "uint256", "uint256", "address"],
    //message
    ["0x93905fd3f9b8732015f2b3ca6c16cbcb60ecf895", "10000000000000000", 1, "0xC87D533169f5596db6a8a592Ac2Fe24cAB087026"]
  ).toString("hex");

  console.log("data hash="+hash);
   //0x7f524163a35e729738b7e18d37151f1c5a7e00a52bb99d2f6601dcc1b5e4d92d

    //0x322fa6d3d9917d60d5e6daac25ae1be45dfed17bc74a8c8bd04df41a86fe3508 with eth

   
  // sign receives three parameters:
  // 1.- Data that will be signed
  // 2.- Account that will sign the data
  // 3.- Web3 provider password to unlock accounts (not needed in this case)
 
  var mySign = web3.eth.personal.sign(hash, "0x93905fd3f9b8732015f2b3ca6c16cbcb60ecf895", "").then(signature => {
    // This function retrieves a signature
    dataSigned.value = signature;
    console.log(signature);
    });

  //sign=0x483ec47ab7d45c1d6e762368d2718b1c3b9d1a88d60960ba69678cd2585dcdf821b37f19d40fe8acd1282af6d7ad544aed9dd9d58d1deb47899b341bbb1b754e1b

    //sign=0x92d84e22a7f354299bdc5a13a56b35786b7c5d12958bcd5954054725f5b88586499903268f0efeac4a4fe140a30c4ab7a23af582da3f0263e1290ea265bef2f51b with eth
   
};

// // Method that recovers signer public key
const recoverAccount = () => {
  // ecRecover receives two parameters:
  // 1.- The original message signed
  // 2.- The signature
  web3.eth.personal
    .ecRecover(originalText.value, signature.value)
    .then(accountRecovered => {
      // This function retrieves the original signer account
      accountThatSigned.value = accountRecovered;
    });
};

window.onload = () => {
  if (!window.web3) {
    // If not injected web3 environment, show a warning
    alert("This app needs some web3 provider such as metamask");
  } else {
    // Instantiate a new web3 with full capabilities
    web3 = new Web3(Web3.givenProvider, null, {});

    // Request the user account and save it into input
    web3.eth.requestAccounts().then(accounts => {
      accountInput.value = accounts[0];
    });

    // Add listeners to clicks that handle the sign and recover process's
    signButton.addEventListener("click", signData);
    recoverButton.addEventListener("click", recoverAccount);
  }
};



// hash:
// 0xe965c11eb2529581f7ba44f0343ca4aff8713376e3e727656ad6f9db0f4d173a
// signature:
// 0x61afbe4ec5fda2ce3818eecb9472a56e9de0ed75bc11d8bac1c717477c6f8955516f43f0bafecaa316f50f3691a3c2df33b3dd8dd267f1e0c5139d1e7af5bf021b