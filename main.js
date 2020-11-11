var web3 = new Web3(Web3.givenProvider);

$(document).ready(function() {
  window.ethereum.enable().then(function(accounts) {
    contractIntance = new web3.eth.Contract(window.abi, "", {from: accounts[0]});
    console.log(contractIntance);
  });



});
