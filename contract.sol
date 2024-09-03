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
        // Mapping to store licenses by license number
    mapping(string => License) private licenses;
    
    // Address of the contract owner
    address public owner;
    
    // Event emitted when a new license is registered
    event LicenseRegistered(string licenseNumber, string holderName);
    
    // Event emitted when a license is revoked
    event LicenseRevoked(string licenseNumber);
    