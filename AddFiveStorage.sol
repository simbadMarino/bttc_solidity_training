//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage{

    //+5
    //overrides
    //virtual override
    function store(uint256 _newNumber) public override {
        myNumber = _newNumber + 5;

    } 

}
