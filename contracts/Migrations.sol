// Specify the compiler version
pragma solidity ^0.5.15;

// Create a smart contract named Migrations
contract Migrations {
  // Declare public variables to store the owner's address and the last completed migration
  address public owner;
  uint public last_completed_migration;

  // Modifier to restrict access to the owner
  modifier restricted() {
    // Check if the sender is the owner; otherwise, revert with a custom error message
    require(msg.sender == owner, "Access restricted to owner");
    _;
  }

  // Constructor to set the owner as the deployer of the contract
  constructor() public {
    owner = msg.sender;
  }

  // Function to set the last completed migration, accessible only to the owner
  function setCompleted(uint completed) public restricted {
    // Update the last completed migration
    last_completed_migration = completed;
  }

  // Function to upgrade the contract to a new address, accessible only to the owner
  function upgrade(address new_address) public restricted {
    // Create a new instance of the Migrations contract at the specified address
    Migrations upgraded = Migrations(new_address);
    
    // Call the setCompleted function of the new contract with the last completed migration from the current contract
    upgraded.setCompleted(last_completed_migration);
  }
}
