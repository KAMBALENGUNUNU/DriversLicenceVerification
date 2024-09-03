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
     // Event emitted when a license is updated
    event LicenseUpdated(string licenseNumber, string holderName);

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Access denied: Only owner can perform this action");
        _;
    }
    // Constructor to set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

       // Function to register a new license
    function registerLicense(
        string memory _holderName,
        string memory _licenseNumber,
        uint256 _issueDate,
        uint256 _expiryDate
    ) public onlyOwner {
        require(licenses[_licenseNumber].issueDate == 0, "License already registered");
        require(_expiryDate > _issueDate, "Expiry date must be after issue date");
         licenses[_licenseNumber] = License({
            holderName: _holderName,
            licenseNumber: _licenseNumber,
            issueDate: _issueDate,
            expiryDate: _expiryDate,
            isValid: true
        });

        emit LicenseRegistered(_licenseNumber, _holderName);
    }

     // Function to verify the authenticity of a license
    function verifyLicense(string memory _licenseNumber) public view returns (bool, string memory, string memory, uint256, uint256) {
        License memory license = licenses[_licenseNumber];
        require(license.issueDate != 0, "License not found");

        return (license.isValid, license.holderName, license.licenseNumber, license.issueDate, license.expiryDate);
    }
