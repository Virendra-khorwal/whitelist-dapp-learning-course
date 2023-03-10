//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false my default for all other addresses. 
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /*
        addAddressToWhitelist - This function adds the address of the sender to the whitelist
    */

   function addAddressToWhitelist() public {
    // Check if the user has alreadt been whitelisted
    require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
   

    // Check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw error
    require(numAddressesWhitelisted < maxWhitelistedAddresses, "More Addresses can't be addes, limit reached");

    // Add the address which callled the function to the whitelistedAddress arrray
    whitelistedAddresses[msg.sender] = true;

    // Increase the number of whitelisted addresses
    numAddressesWhitelisted += 1;
   }
}