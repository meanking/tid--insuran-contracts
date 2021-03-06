// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "./matic/ContextMixin.sol";
import "./matic/NativeMetaTransaction.sol";

contract MockUSDC is
    ERC20,
    NativeMetaTransaction,
    ContextMixin
{
    string constant public ERC712_VERSION = "1";

    constructor() public ERC20("MockUSDC", "USDC") {}

    function decimals() public view override returns (uint8) {
        return 6;
    }

    /**
     * @notice Initialize the contract after it has been proxified
     * @dev meant to be called once immediately after deployment
     */
    function initialize()
        external
        initializer
    {
      _initializeEIP712("MockUSDC", ERC712_VERSION);
    }

    // This is to support Native meta transactions
    // never use msg.sender directly, use _msgSender() instead
    function _msgSender()
        internal
        override
        view
        returns (address payable sender)
    {
        return ContextMixin.msgSender();
    }

    // For test purpose.
    function mint(uint256 amount_) external {
        _mint(msg.sender, amount_);
    }
}
