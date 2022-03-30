// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

interface IPremiumCalculator {
    function getPremiumRate(uint16 assetIndex_) external view returns(uint256);
}
