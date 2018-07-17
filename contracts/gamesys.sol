pragma solidity ^0.4.22;

import "./citizen.sol";
import "./doctor.sol";
import "./kommisar.sol";
import "./mafia.sol";
import "./maniac.sol";

contract GameSys {
    Citizen public citizen1; Citizen public citizen2; Citizen public citizen3; Citizen public citizen4; Citizen public citizen5;
    Doctor public doctor1;
    Kommisar public kommisar1;
    Mafia public mafia1; Mafia public mafia2;
    Maniac public maniac1;

   address[] players;
   uint[] roles;
   uint public maxPlayers = 0; // 10
   uint public kommisar_count = 0; // 1
   uint public doctor_count = 0; // 1
   uint public mafia_count = 0; // 2
   uint public maniac_count = 0; // 1
   uint public citizen_count = 0; // 5
   uint public turns = 0;
   // address[] games;
   // roles number citizen = 0, doctor = 1, kommisar = 2, mafia = 3, maniac = 4

   constructor() public {

   }
   function initGame() {
       citizen1.sleep();
       citizen2.sleep();
       citizen3.sleep();
       citizen4.sleep();
       citizen5.sleep();
       mafia1.sleep();
       mafia2.sleep();
       maniac1.sleep();
       doctor1.sleep();
       kommisar1.sleep();
   }

   function initPlayers() public {
       for(uint i = 0; i < 10; i++){
           if(roles[i] == 0){
               if(citizen_count == 5){
                   citizen1 = Citizen(players[i]);
                   citizen_count -=1;
               }
               else if(citizen_count == 4){
                   citizen2 = Citizen(players[i]);
                   citizen_count -=1;
               }
               else if(citizen_count == 3){
                   citizen3 = Citizen(players[i]);
                   citizen_count -=1;
               }
               else if(citizen_count == 2){
                   citizen4 = Citizen(players[i]);
                   citizen_count -=1;
               }
               else if(citizen_count == 1){
                   citizen5 = Citizen(players[i]);
                   citizen_count -=1;
               }
           }
           if(roles[i] == 1){
               doctor1 =  Doctor(players[i]);
           }
           if(roles[i] == 2){
               kommisar1 = Kommisar(players[i]);
           }
           if(roles[i] == 3){
               if (mafia_count == 2){
                   mafia1 = Mafia(players[i]);
                   mafia_count -=1;
               }
               else if(mafia_count == 1){
                   mafia2 = Mafia(players[i]);
               }
           }
           if(roles[i] == 4){
               maniac1 = Maniac(players[i]);
           }
       }

   }

   function addPlayer(address player) public  {
       if (maxPlayers < 10) {
           players.push(player);
           if (kommisar_count == 0 ) {
               kommisar_count = 1;
               roles.push(2);
           }
       else if (doctor_count == 0) {
           doctor_count = 1;
           roles.push(1);
       }
       else if (mafia_count < 2) {
           mafia_count +=1;
           roles.push(3);
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

}
