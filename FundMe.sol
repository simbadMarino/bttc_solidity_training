/*SPDX-License-Identifier: MIT
What is this contract gonna do?
1) Get funds from users/donators
2) Owner is able to withdraw the funds
3) Set a min. amount of USD to fund/donate
*/
pragma solidity 0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

//Original deploy cost: 266 BTT
//After minBTTinUSD deploy constat: 259 BTT

contract FundMe {

    using PriceConverter for uint256;
    uint256 public constant MIN_BTT_IN_USD = 1e14;
    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender; //This part of the code will be executed as soon as the contract is deployed and 
    }
    

    function fund() public payable{
        //Allow users to send BTT
        //Have a minimum amount of BTT to fund
        //1. How do we send BTT to this contract??
        require(msg.value.getConvertionRate() >= MIN_BTT_IN_USD, "You did not send enough BTT :(, Minimum is 0.0001 USDT");  // 1e18 wei =1 BTT, so in this SC minimum a donator needs to donate 1k BTT
        //Have a list which stores funders addresses so we can thank them publicaly later on
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;

    }

 
    
    function withdraw() public onlyOwner{
        for(uint256 fundersIndex=0; fundersIndex < funders.length; fundersIndex++)
        {
            address funder = funders[fundersIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        //To withdraw crypto you can either use:
        //Transfer
        //payable(msg.sender).transfer(address(this).balance);
        //send
        //call: call is the recommended way of sending BTT or any main coins in EVMs 
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require (callSuccess, "Call failed due to XYZ reason..."); //require is used in solidity to confirm a function can be executed. If the first parameter in require resolves as "true" solidity interpretes it as Good to Go and proceed with execution, if it becomes false the transation will revert and wont be executed

    }
    
    function getBTTPrice(uint256 _bttAmount) public view returns (uint256,uint256){
        return  (PriceConverter.getPrice(),PriceConverter.getConvertionRate(_bttAmount));
    }
    
    modifier onlyOwner(){
        require(msg.sender == i_owner, "sender is not owner, cannot withdraw");
        _; //Underscore and ; after the require means require will be executed before the called fuction is called.

    }
    
    //What happens if someone sends money accidentaly without using the fundMe function?
    //We can use the receive() and Fallback special functions.
    //receive() special function is called when someone transact with the contract without data
    //Fallack() is used when someone transacts with the contract with data in the calldata

    receive() external payable {
        fund(); //Route transaction trough the fund function

    }

    fallback() external payable {
        fund(); //Route transaction trough the fund function

    }

}



