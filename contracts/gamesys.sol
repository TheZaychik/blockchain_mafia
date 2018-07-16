pragma solidity ^0.4.22;

import "./citizen.sol";
import "./doctor.sol";
import "./donmafia.sol";
import "./kommisar.sol";
import "./mafia.sol";
import "./mabiac.sol";

contract GameSys {
    address[] players;

    constructor() public {

    }

    function getMaxVotes() returns (address) {

    }

    function addPlayer(address player) {
      players.push(player);
    }

}
