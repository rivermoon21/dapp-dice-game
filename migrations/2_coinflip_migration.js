const Flip = artifacts.require("Coinflip");

module.exports = function(deployer,network, accounts) {
  deployer.deploy(Flip).then(function(instance) {
    instance.deposit({value: 500000000000000000, from: accounts[0] }).then(function() {
      console.log("Deposit Success");
    }).catch(function(err) {
      console.error("\nInstance-" + err);
    });

  }).catch(function(err) {
    console.error("\nDeployerError-" + err);
  });
};
