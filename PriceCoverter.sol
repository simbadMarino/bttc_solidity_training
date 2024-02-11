// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;
import "./Band.sol";

library PriceConverter {
    function getPrice() internal view returns (uint256 price) {
        IBand bandRef;
        bandRef = IBand(0xDA7a001b254CD22e46d3eAB04d937489c93174C3); //main
        IBand.ReferenceData memory data;
        data = bandRef.getReferenceData("BTT", "USD");
        price = data.rate;
    }

    function getConvertionRate(
        uint256 bttAmount
    ) internal view returns (uint256) {
        //msg.value.getConverstionRate
        uint256 bttPrice = getPrice();
        uint256 bttAmountinUSD = (bttPrice * bttAmount) / 1e18;
        return bttAmountinUSD;
    }
}
