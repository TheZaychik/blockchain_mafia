pragma solidity ^0.4.22;

contract Citizen {
  bool private isDead;
  uint private votes;
  bool private isSleeping;
  uint public constant typeContract = 0; // citizen = 0, doctor = 1, donmafia = 2, kommisar = 3, mafia = 4, maniac = 5

  constructor() {
    isDead = false;
    isSleeping = false;
    votes = 0;
  }

  function addVote() {
    votes += 1;
  }

  function sleep() {
    isSleeping = true;
  }

  function stopSleep() {
    isSleeping = false;
  }

  function getVotes() returns (uint) {
    return votes;
  }

  function kill() {
    isDead = true;
  }

  function vote(address addr, uint typeContr) {
    if (typeContr == 0){

    }
    else if (typeContr == 1){

    }
    else if (typeContr == 2){

    }
    else if (typeContr == 3){

    }
    else if (typeContr == 4){

    }
    else if (typeContr == 5){

    }
  }

}
