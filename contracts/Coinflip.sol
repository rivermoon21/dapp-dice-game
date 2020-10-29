pragma solidity 0.5.12;

contract Coinflip {
  address payable public _owner;
  address payable public _gamer;
  uint private _balance;
  uint public _amountBet;
  event winResult(bool wL);

  modifier onlyOwner() {
    require(msg.sender == _owner, "Only Owner can do this");
    _;
  }

  modifier onlyGamer() {
    require(msg.sender == _gamer, "Only gamer can do this");
    _;
  }

  modifier minimum(uint cost) {
    require(msg.value >= cost, "Insufficient balance. Bet More!");
    _;
  }

  mapping (address => uint256) public contractBalance;

  constructor() public payable minimum(5 ether) {
    _owner = msg.sender;
    contractBalance[_owner] = msg.value;
  }

  function coinFlip() public view returns(uint) {
    return (now % 2);
  }

  function createBet(uint headTails) public payable minimum(1 ether) onlyGamer {
    uint outcome = coinFlip();
    _amountBet = msg.value;
    // win bet, get double the amount
    if(headTails == outcome){
      emit winResult(true);
    }
    // lose,
    else if (headTails != outcome) {
      emit winResult(true);
    }
  }

  function getBalance() public view returns (uint) {
    return contractBalance[_owner];
  }

  // function withdrawAll() public onlyOwner returns (uint) {
  //
  // }
}
