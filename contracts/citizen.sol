pragma solidity ^0.4.22;

contract Citizen {
  bool private isDead;
  uint private votes;
  bool private isSleeping;
  uint public constant tip = 0; // citizen = 0, doctor = 1, donmafia = 2, kommisar = 3, mafia = 4, maniac = 5

  constructor() {
    isDead = false;
    isSleeping = false;
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
