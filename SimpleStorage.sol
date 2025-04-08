// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SimpleStorage {
    //favoriteNumber gets initialized to 0 if no value is given

    uint256 myFavoriteNumber; //0

    //uint256[] listOfFavoritesNumbers; 
    // 0  1  2
    // [0,78,90]
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person public pat = Person({favoriteNumber: 7, name: "pat"});
    Person public mariah = Person({favoriteNumber: 3, name: "mariah"});

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    //view -> read state (dont update) || pure 
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

}