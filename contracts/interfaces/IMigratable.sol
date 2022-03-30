// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

interface IMigratable {
    function approveMigration(IMigratable migrateTo_) external;
    function onMigration(address who_, uint256 amount_, bytes memory data_) external;
}
