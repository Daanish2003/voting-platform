// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract for voting system
contract Ballot {

    // Keep the tract of number of candidate and fullfill the function to generate unique id
    uint public candidateCount;


    // constructor for adding candidate
    constructor () {
      addCandidate("Ken");
      addCandidate("Ben");
    } 

    // structure of the canditate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //mapping to number of candidates
    // mapping to the voter address
    mapping (uint => Candidate) public candidateLookup;
    mapping(address => bool) public voterLookup;


    // function to add canditate
    function addCandidate(string memory name) public {
        candidateLookup[candidateCount] = Candidate(candidateCount, name, 0);
        candidateCount ++;
    }

    // function get all candidate at once
    function getCandidate() external view returns(string[] memory, uint[] memory) {
        string[] memory names = new string[] (candidateCount);
        uint[] memory voteCounts = new uint[](candidateCount);
        for (uint i = 0; i < candidateCount; i++) {
        names[i] = candidateLookup[i].name;
        voteCounts[i] = candidateLookup[i].voteCount;
    }
    return (names, voteCounts);
    }

    // voting function
    // checks for the voter id
    function vote(uint id) external {
        require (!voterLookup[msg.sender]);
        require (id >= 0 && id <= candidateCount-1);
        candidateLookup[id].voteCount++;
        emit votedEvent(id);
}

event votedEvent(uint indexed id);

}
