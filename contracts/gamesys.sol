pragma solidity ^0.4.22;

import "./citizen.sol";
import "./doctor.sol";
import "./kommisar.sol";
import "./mafia.sol";
import "./maniac.sol";

contract GameSys {
    address[] players;
    // address[] games;

    constructor() public {

    }

    function getMaxVotes() returns (address) {

    }

    /* function startGame() {

    }

    function joinGame(address game) {

    } */

    function addPlayer(address player) {
      players.push(player);
    }

}
