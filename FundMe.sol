// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract FundMe {
    constructor() payable  {}

    //uint256 public myValue = 1;
    uint public minimumUsd = 5;

    function fund() public payable {
    // allow users to send money
    //have a minimum $ sent
    //1. how do we send eth to this
    //myValue = myValue + 2;
    require(msg.value >= minimumUsd, "didn't send enough ether");


    }
}