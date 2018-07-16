var a = artifacts.require("./citizen.sol");
var b = artifacts.require("./doctor.sol");
var c = artifacts.require("./donmafia.sol");
var d = artifacts.require("./gamesys.sol");
var e = artifacts.require("./kommisar.sol");
var f = artifacts.require("./mafia.sol");
var g = artifacts.require("./maniac.sol");


contract('mafia', function(accounts) {
  it("should assert true", function(done) {
    var mafia = mafia.deployed();
    assert.isTrue(true);
    done();
  });
});
