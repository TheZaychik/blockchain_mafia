var a = artifacts.require("./citizen.sol");
var b = artifacts.require("./doctor.sol");
var d = artifacts.require("./gamesys.sol");
var e = artifacts.require("./kommisar.sol");
var f = artifacts.require("./mafia.sol");
var g = artifacts.require("./maniac.sol");


contract('mafia', function(accounts) {
  var citizen1, citizen2, citizen3, mafia, kommisar, doctor;
  it("Citizens is created", async function() {
    citizen1 = await a.new();
    citizen2 = await a.new();
    citizen3 = await a.new();
    assert.equal(citizen1.isDead, false);
  });
});
