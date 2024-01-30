//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import {SimpleStorage} from './SimpleStorage.sol';
contract StorageFactory{

    //unit256 public favoriteNumber
    //type visibility name
    SimpleStorage[] public listOfSimpleStorage;

    function createSimpleStorageContract() public {
        
        listOfSimpleStorage.push(new SimpleStorage());
        
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //Address
        //ABI (Application Binary Interface)
        listOfSimpleStorage[_simpleStorageIndex].store(_newSimpleStorageNumber);

    }

    function sfGetData(uint256 _simpleStorageIndex) public view returns(uint256){

        return listOfSimpleStorage[_simpleStorageIndex].retrieve();

    }
}
