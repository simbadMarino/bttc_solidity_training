/*SPDX-License-Identifier: MIT
What is this contract gonna do?
1) Get funds from users/donators
2) Owner is able to withdraw the funds
3) Set a min. amount of USD to fund/donate
*/
pragma solidity 0.8.19;

import {PriceConverter} from "./PriceConverter.sol";


    

contract FundMe {

    using PriceConverter for uint256;
    uint256 public minBTTinUSD = 5e18;
    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    

    function fund() public payable{
        //Allow users to send BTT
        //Have a minimum amount of BTT to fund
        //1. How do we send BTT to this contract??
        require(msg.value.getConvertionRate() >= minBTTinUSD, "You did not send enough BTT :(, Minimum is 5 USDT");  // 1e18 wei =1 BTT, so in this SC minimum a donator needs to donate 1k BTT
        //Have a list which stores funders addresses so we can thank them publicaly later on
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    }

 
    /*
    function withdraw() public {

    }
    
    function getBTTPrice() public {}
    //Address
    //ABI

    function getBTTUSDConversionRate() public {}
    */


}



