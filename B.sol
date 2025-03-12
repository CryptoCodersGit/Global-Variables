// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;
import "./A.sol";

contract B {
    A contractA;

    constructor(address _contractA) {
        contractA = A(_contractA);
    }

    function callA() public view returns (address, address) {
        return contractA.getSenderAndOrigin();
    }
}
//A>B  B-A  