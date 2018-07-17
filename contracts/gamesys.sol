pragma solidity ^0.4.22;

import "./citizen.sol";
import "./doctor.sol";
import "./kommisar.sol";
import "./mafia.sol";
import "./maniac.sol";

contract GameSys {
    address[10] players;
    uint[10] roles;
    uint maxPlayers = 0; // 10
    uint kommisar_count = 0; // 1
    uint doctor_count = 0; // 1
    uint mafia_count = 0; // 2
    uint maniac_count = 0; // 1
    uint doctor_count = 0; // 1
    uint citizen_count = 0; // 5
    // address[] games;
    // roles number citizen = 0, doctor = 1, kommisar = 2, mafia = 3, maniac = 4

    constructor() public {

    }


    function addPlayer(address player) {
      if (maxPlayers < 10){
      players.push(player);
      if (kommisar_count == 0 ){
        kommisar_count = 1;
        roles.push(2);
      }
      else if (doctor_count == 0) {
        doctor_count = 1;
        roles.push(1);
      }
      else if (mafia_count < 2) {
        mafia_count +=1;
        roles.push(3)
      }
      else if(maniac_count == 0){
        maniac_count = 1;
        roles.push(4);
      }
      else if(citizen_count < 5){
        citizen_count +=1;
        roles.push(0);
      }
      maxPlayers +=1;
    }

    }


    function getMaxVotes() returns (address) {

    }
}
