// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;

contract A {
    function getSenderAndOrigin() public view returns (address, address) {
        return (msg.sender, tx.origin);
    }
}
