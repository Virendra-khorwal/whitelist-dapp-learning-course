// Import ethers from hardhat package
const {ethers} = require("hardhat");

async function main() {

  /*
  A contract facotry in ethers.js is a abtraction used to deploy new smart contracts, so whitelistedContract here is a factory for instances of our Whitelist contract.
  */

  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // here we deploy the contract
  const deployedWhitelistContract = await whitelistContract.deploy(10);

  // print the address of the deployed contract
  console.log("Whitelist Contract Address: ", deployedWhitelistContract.address);
}

// call the main function and catch if there is any error

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });