//SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

contract SimpleStorage{
//Basic types: boolean, uint, int, address, bytes
    uint256 myNumber;
    uint128 public peopleIndex;
    struct Person {

        uint256 age;
        string name;
    }

    //Person public Caro = Person({age: 34, name: "Carolina"});

    Person[] public listOfPeople;


    mapping (string => uint256) public getAge;

    //Following function stores a uint26¿56 number into SimpleStorage contract
    function store(uint256 _myNumber) public virtual {
        myNumber = _myNumber;
        //retrieve();
    }

    function addPerson(string memory _name, uint256 _age) public {

        listOfPeople.push(Person(_age, _name));
        getAge[_name] = _age;
        peopleIndex ++;
    }

  

    //view pure
    //Following function retrieves myNumber data from the contract
    function retrieve() public view returns(uint256){
        return myNumber;
    }
}
