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

    //dynamic array
    Person [] public listOfPeople; // [] empty list || [3] -> static array

//    Person public pat = Person({favoriteNumber: 7, name: "pat"});
  //  Person public mariah = Person({favoriteNumber: 3, name: "mariah"});

// chelsea -> 232
    mapping(string => uint256) public nameToFavoriteNumber;


    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    //view -> read state (dont update) || pure 
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

//calldata (you CANT modify), memory(you can modify) -> temporary variables     || storage 
    function addPerson(string memory _name, uint256 _favoriteNumber ) public {
        //_name = "cat";
        
        //Person memory newPerson = Person(_favoriteNumber, _name)
        listOfPeople.push(Person(_favoriteNumber, _name));

        nameToFavoriteNumber[_name] =  _favoriteNumber;
    }

}