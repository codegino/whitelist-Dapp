// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {

	// maximum number of addresses which can be whitelisted
	uint8 public maxWhitelistedAddresses;

  // to keep track of the whitelisted addresses
	uint8 public numAddressesWhiteListed;

	mapping(address => bool) public whitelistedAddresses;

	constructor(uint8 _maxWhitelistedAddresses) {
		maxWhitelistedAddresses = _maxWhitelistedAddresses;
	}

	function addAddressToWhitelist() public {
		require(!whitelistedAddresses[msg.sender], "Sender already in the whitelist");
		require(numAddressesWhiteListed < maxWhitelistedAddresses, "Max limit reached");
		whitelistedAddresses[msg.sender] = true;
		numAddressesWhiteListed++;
	}
}
