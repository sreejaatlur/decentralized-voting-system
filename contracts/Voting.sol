// Specify the compiler version
pragma solidity ^0.5.15;

// Create a smart contract named Voting
contract Voting {
    // Define a struct to represent a candidate
    struct Candidate {
        uint id;
        string name;
        string party; 
        uint voteCount;
    }

    // Mapping to store candidates based on their IDs
    mapping (uint => Candidate) public candidates;

    // Mapping to track whether an address has voted
    mapping (address => bool) public voters;

    // Variables to track the number of candidates and the start and end times of voting
    uint public countCandidates;
    uint256 public votingEnd;
    uint256 public votingStart;

    // Function to add a new candidate
    function addCandidate(string memory name, string memory party) public  returns(uint) {
        // Increment the count of candidates
        countCandidates ++;
        // Create a new candidate and store it in the mapping
        candidates[countCandidates] = Candidate(countCandidates, name, party, 0);
        // Return the ID of the new candidate
        return countCandidates;
    }
   
    // Function to allow an address to vote for a candidate
    function vote(uint candidateID) public {
        // Check if the current time is within the voting period
        require((votingStart <= now) && (votingEnd > now));
   
        // Check if the candidate ID is valid
        require(candidateID > 0 && candidateID <= countCandidates);

        // Check if the sender (voter) has not voted before
        require(!voters[msg.sender]);
              
        // Mark the sender as voted
        voters[msg.sender] = true;
       
        // Increment the vote count for the chosen candidate
        candidates[candidateID].voteCount ++;
    }
    
    // Function to check if the sender (address) has voted
    function checkVote() public view returns(bool){
        return voters[msg.sender];
    }
       
    // Function to get the total number of candidates
    function getCountCandidates() public view returns(uint) {
        return countCandidates;
    }

    // Function to get details of a specific candidate by ID
    function getCandidate(uint candidateID) public view returns (uint,string memory, string memory,uint) {
        return (candidateID,candidates[candidateID].name,candidates[candidateID].party,candidates[candidateID].voteCount);
    }

    // Function to set the start and end dates of the voting period
    function setDates(uint256 _startDate, uint256 _endDate) public{
        // Check if the dates are valid and the voting period has not started
        require((votingEnd == 0) && (votingStart == 0) && (_startDate + 1000000 > now) && (_endDate > _startDate));
        // Set the start and end dates
        votingEnd = _endDate;
        votingStart = _startDate;
    }

    // Function to get the start and end dates of the voting period
    function getDates() public view returns (uint256,uint256) {
        return (votingStart,votingEnd);
    }
}
