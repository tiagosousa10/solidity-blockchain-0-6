// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SimpleStorage {
    //Basic types: boolean, uint, int, address, bytes
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 88;
    string favoriteNumberInText = "eighty-eight";
    int256 favoriteInt = -88;
    address myAddress = 0x0008cC44b4fF3B7A2D6d5E9eEc53a1CE69Ed46B95;
    bytes32 favoriteBytes32 = "cat"; //
}