pragma solidity ^0.4.22;

import "./citizen.sol";
import "./doctor.sol";
import "./kommisar.sol";
import "./mafia.sol";

contract Maniac {
  bool public isDead;
  uint public votes;
  bool public isSleeping;

  uint public constant typeContract = 4; // citizen = 0, doctor = 1, kommisar = 2, mafia = 3, maniac = 4;
  constructor() public {
    isDead = false;
    isSleeping = false;
    votes = 0;
  }

  function die() {
    isDead = true;
  }

  function heal() {
    isDead = false;
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

  function getVotes() public view returns (uint) {
    return votes;
  }

  function kill(address addr, uint typeContr){
    if (typeContr == 0){
       Citizen(addr).die();
    }
    else if (typeContr == 1){
       Doctor(addr).die();
    }
    else if (typeContr == 2){
      Kommisar(addr).die();
    }
    else if (typeContr == 3){
       Mafia(addr).die();
    }
    else if (typeContr == 4){
       Maniac(addr).die();
    }
  }

  function vote(address addr, uint typeContr) {
    if (typeContr == 0){
       Citizen(addr).addVote();
    }
    else if (typeContr == 1){
       Doctor(addr).addVote();//remake
    }

    else if (typeContr == 2){
       Kommisar(addr).addVote();
    }
    else if (typeContr == 3){
       Mafia(addr).addVote();//remake
    }
    else if (typeContr == 4){
       Maniac(addr).addVote();//remake
    }

  }
}
