const { ethers } = require("ethers");

const main = async () => {
const provider = new ethers.providers.JsonRpcProvider(`https://kovan.infura.io/v3/${process.env.INFURA_API_KEY}`)

const account1 = '' // Your account address 1
const account2 = '' // Your account address 2

const privateKey1 = 'process.env.PRIVATE_KEY' // Private key of account 1
const wallet = new ethers.Wallet(privateKey1, provider)


    const senderBalanceBefore = await provider.getBalance(account1)
    const recieverBalanceBefore = await provider.getBalance(account2)

    console.log(`\nSender balance before: ${ethers.utils.formatEther(senderBalanceBefore)}`)
    console.log(`reciever balance before: ${ethers.utils.formatEther(recieverBalanceBefore)}\n`)

    const tx = await wallet.sendTransaction({
        to: account2,
        value: ethers.utils.parseEther("0.025")
    })

    await tx.wait()
    console.log(tx)

    const senderBalanceAfter = await provider.getBalance(account1)
    const recieverBalanceAfter = await provider.getBalance(account2)

    console.log(`\nSender balance after: ${ethers.utils.formatEther(senderBalanceAfter)}`)
    console.log(`reciever balance after: ${ethers.utils.formatEther(recieverBalanceAfter)}\n`)
}

require("dotenv").config();
main()