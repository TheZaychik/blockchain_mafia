pragma solidity ^0.4.22;

contract Citizen {
  bool private isDead;
  uint private votes;

  constructor() {
    isDead = false;
    votes = 0;
  }


  function addVote() {
    votes += 1;
  }

  function getVotes() returns (uint) {
    return votes;
  }

  function Kill() {
    isDead = true;
  }

  function Vote(address addr) {

  }


}
