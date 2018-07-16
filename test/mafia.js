var a = artifacts.require("./citizen.sol");
var b = artifacts.require("./doctor.sol");
var d = artifacts.require("./gamesys.sol");
var e = artifacts.require("./kommisar.sol");
var f = artifacts.require("./mafia.sol");
var g = artifacts.require("./maniac.sol");


contract('mafia', function(accounts) {
  var citizen1, citizen2, citizen3, mafia, kommisar, doctor;
  it("Players are created", async function() {
    citizen1 = await a.new();
    citizen2 = await a.new();
    citizen3 = await a.new();
    mafia = await f.new();
    kommisar = await e.new();
    maniac = await g.new();
    doctor = await b.new();
    assert.equal(await citizen1.isDead(), false);
    assert.equal(await citizen2.isDead(), false);
    assert.equal(await citizen3.isDead(), false);
    assert.equal(await mafia.isDead(), false);
    assert.equal(await kommisar.isDead(), false);
    assert.equal(await doctor.isDead(), false);
  });
  it("Mafia, kommisar and maniac can kill someone", async function() {
    mafia.kill(await citizen1.address, await citizen1.typeContract());
    maniac.kill(await citizen2.address, await citizen2.typeContract())
    kommisar.kill(await mafia.address, await mafia.typeContract());
    assert.equal(await mafia.isDead(), true);
    assert.equal(await citizen2.isDead(), true);
    assert.equal(await citizen1.isDead(), true);
  });
  it("Doctor can heal", async function() {
    
  });
});
