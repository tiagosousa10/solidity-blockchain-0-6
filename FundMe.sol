// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    constructor() payable  {}

    //uint256 public myValue = 1;
    uint public minimumUsd = 5e18;

    function fund() public payable {
    // allow users to send money
    //have a minimum $ sent
    //1. how do we send eth to this
    //myValue = myValue + 2;
    require(getConversionRate(msg.value) >= minimumUsd, "didn't send enough ether");

    }

    function getPrice() public view returns (uint256){
        //address 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        //abi 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
        (, int256 price,,, )= priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        // 1600

        return uint256(price) * 1e10;
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        // 1 ETH ?
        //1600_00000000(18zeros)
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }

    function getVersion() public view returns(uint256) {
        return AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43).version();
    }
}