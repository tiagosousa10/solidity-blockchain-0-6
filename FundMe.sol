// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    constructor() payable  {}

    //uint256 public myValue = 1;
    uint public minimumUsd = 5e18;

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ether");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public{
        // for loop
        // [1,2,3]
        //for(/*starting index, ending index, step amount */)
        //0, 10,1
        //0,1,2,3,4

        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
    }

    
}