pragma solidity ^0.4.22;

import "./citizen.sol";
import "./doctor.sol";
import "./kommisar.sol";
import "./mafia.sol";

contract Maniac {
  bool public isDead;
  uint public votes;
  bool private isSleeping;

  uint public constant typeContract = 0; // citizen = 0, doctor = 1, kommisar = 2, mafia = 3, maniac = 4;
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

  function killGuilty(address addr, uint typeContr) public {

        if (typeContr == 0){
            Citizen(addr).kill();
        }
        else if (typeContr == 1){
            Doctor(addr).kill();//remake
        }
        else if (typeContr == 2){
            Kommisar(addr).kill();
        }
        else if (typeContr == 3){
            Mafia(addr).kill();//remake
        }
        else if (typeContr == 4){
            Maniac(addr).kill();//remake
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
