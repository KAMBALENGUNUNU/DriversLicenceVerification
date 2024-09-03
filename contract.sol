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

     // Function to revoke a license
    function revokeLicense(string memory _licenseNumber) public onlyOwner {
        require(licenses[_licenseNumber].issueDate != 0, "License not found");
        require(licenses[_licenseNumber].isValid == true, "License already revoked");

        licenses[_licenseNumber].isValid = false;
        emit LicenseRevoked(_licenseNumber);
    }


    // Function to update license details
    function updateLicense(
        string memory _licenseNumber,
        string memory _newHolderName,
        uint256 _newExpiryDate
    ) public onlyOwner {
          require(licenses[_licenseNumber].issueDate != 0, "License not found");
        require(licenses[_licenseNumber].isValid == true, "Cannot update revoked license");
        require(_newExpiryDate > licenses[_licenseNumber].issueDate, "New expiry date must be after issue date");

        licenses[_licenseNumber].holderName = _newHolderName;
        licenses[_licenseNumber].expiryDate = _newExpiryDate;
        emit LicenseUpdated(_licenseNumber, _newHolderName);
    }


    // Function to check if an address is authorized (only the owner in this case)
    function isAuthorized(address _address) public view returns (bool) {
        return _address == owner;
    }


    // Fallback function to prevent accidental ether transfers
    fallback() external payable {
        revert("This contract does not accept ether");
    }
