// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DriversLicenseVerification {
    // Struct to store license details
    struct License {
        string holderName;
        string licenseNumber;
        uint256 issueDate;
        uint256 expiryDate;
        bool isValid;
    }