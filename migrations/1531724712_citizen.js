var a = artifacts.require("./citizen.sol");
var b = artifacts.require("./doctor.sol");
var c = artifacts.require("./donmafia.sol");
var d = artifacts.require("./gamesys.sol");
var e = artifacts.require("./kommisar.sol");
var f = artifacts.require("./mafia.sol");
var g = artifacts.require("./maniac.sol");


module.exports = function(deployer) {
  deployer.deploy(a);
  deployer.deploy(b);
  deployer.deploy(c);
  deployer.deploy(d);
  deployer.deploy(e);
  deployer.deploy(f);
  deployer.deploy(g);

};
