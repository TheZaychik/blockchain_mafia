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
    await assert.equal(await citizen1.isDead(), false);
    await assert.equal(await citizen2.isDead(), false);
    await assert.equal(await citizen3.isDead(), false);
    await assert.equal(await mafia.isDead(), false);
    await assert.equal(await kommisar.isDead(), false);
    await assert.equal(await doctor.isDead(), false);
  });
  it("Mafia, kommisar and maniac can kill someone", async function() {
    await mafia.kill(await citizen1.address, await citizen1.typeContract());
    await maniac.kill(await citizen2.address, await citizen2.typeContract())
    await kommisar.kill(await mafia.address, await mafia.typeContract());
    await assert.equal(await mafia.isDead(), true);
    await assert.equal(await citizen2.isDead(), true);
    await assert.equal(await citizen1.isDead(), true);
  });
  it("Doctor can heal", async function() {
    await doctor.cure(await mafia.address, await mafia.typeContract());
    await doctor.cure(await citizen1.address, await citizen1.typeContract());
    await doctor.cure(await citizen2.address, await citizen1.typeContract());
    await assert.equal(await mafia.isDead(), false);
    await assert.equal(await citizen2.isDead(), false);
    await assert.equal(await citizen1.isDead(), false);
  });
  it("Kommisar can find role (except maniac)", async function() {
    await assert.equal((await kommisar.check(await mafia.address, await mafia.typeContract())).toNumber(), 3);
    await assert.equal((await kommisar.check(await citizen1.address, await citizen1.typeContract())).toNumber(), 0);
    await assert.equal((await kommisar.check(await maniac.address, await maniac.typeContract())).toNumber(), 0);
  });
  it("We can vote", async function() {
    await citizen1.vote(await mafia.address, await mafia.typeContract());
    await assert.equal((await mafia.getVotes()).toNumber(),1);
  });
  it("We can sleep and wake up", async function(){
    await citizen1.sleep();
    await mafia.sleep();
    await kommisar.sleep();
    await assert.equal(await citizen1.isSleeping(), true);
    await assert.equal(await mafia.isSleeping(), true);
    await assert.equal(await kommisar.isSleeping(), true);
    await citizen1.stopSleep();
    await mafia.stopSleep();
    await kommisar.stopSleep();
    await assert.equal(await citizen1.isSleeping(), false);
    await assert.equal(await mafia.isSleeping(), false);
    await assert.equal(await kommisar.isSleeping(), false);
  });
});
