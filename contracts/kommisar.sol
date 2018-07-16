pragma solidity ^0.4.22;

import "./citizen.sol";
import "./doctor.sol";
import "./donmafia.sol";
import "./mafia.sol";
import "./mainac.sol";

contract Kommisar {
    bool private isDead;
    uint private votes;
    bool private isSleeping;
    uint public constant typeContract = 3; // citizen = 0, doctor = 1, donmafia = 2, kommisar = 3, mafia = 4, maniac = 5

    constructor() {
        isDead = false;
        isSleeping = false;
        votes = 0;
    }

    function addVote() public {
        votes += 1;
    }

    function sleep() public {
        isSleeping = true;
    }

    function stopSleep() public{
        isSleeping = false;
    }

    function getVotes() public returns (uint){
        return votes;
    }

    function kill(address addr, uint typeContr){
      if (typeContr == 0){
         Citizen(addr).isDead = true;
      }
      else if (typeContr == 1){
         Doctor(addr).isDead = true;
      }
      else if (typeContr == 2){
        Kommisar(addr).isDead = true;
      }
      else if (typeContr == 3){
         Mafia(addr).isDead = true;
      }
      else if (typeContr == 4){
         Maniac(addr).isDead = true;
      }
    }

    function check(address addr, uint typeContr) returns (uint) {
      return typeContr;
    }

    function vote(address addr, uint typeContr) public {
        if (typeContr == 0){
            Citizen(addr).addVote();
        }
        else if (typeContr == 1){
            Doctor(addr).addVote();//remake
        }
        else if (typeContr == 2){
            DonMafia(addr).addVote();//remake
        }
        else if (typeContr == 3){
            Kommisar(addr).addVote();
        }
        else if (typeContr == 4){
            Mafia(addr).addVote();//remake
        }
        else if (typeContr == 5){
            Maniac(addr).addVote();//remake
        }
    }

}
