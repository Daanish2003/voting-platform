// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract for voting system
contract Ballot {
    // unsigned integer for store the vote value
    // initial voting value to 0
    uint public votes = 0;
   // set voting value
   function setVotes() public {
    votes = votes + 1;
   }
   // get voting value
   function getVotes() public view returns(uint) {
    return votes;
   }
}