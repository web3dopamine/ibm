const { ethers } = require("ethers");

async function main(){

const provider = new ethers.providers.JsonRpcProvider(`https://mainnet.infura.io/v3/${process.env.INFURA_API_KEY}`)

const address = '0x93905fd3f9b8732015f2b3Ca6c16Cbcb60ECf895'

const balance = await provider.getBalance(address)
console.log(`\nETH Balance of ${address} --> ${ethers.utils.formatEther(balance)} ETH\n`)
}

require("dotenv").config();
main()


