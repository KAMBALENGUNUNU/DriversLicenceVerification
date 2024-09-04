# Driver's License Verification Smart Contract

This project implements a simple smart contract in Solidity that allows a company or an authorized entity to register, verify, update, and revoke driver's licenses on the Ethereum blockchain. The contract ensures that the authenticity of a driver's license can be easily verified, providing a decentralized and secure way to manage driver's license data.

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Implementation](#implementation)
- [Contract Structure](#contract-structure)
- [How to Use](#how-to-use)
  - [Deployment](#deployment)
  - [Interacting with the Contract](#interacting-with-the-contract)
- [Security Considerations](#security-considerations)
- [License](#license)

## Project Overview

The **Driver's License Verification** smart contract is designed to manage the lifecycle of driver's licenses. It allows authorized entities to:
- **Register** new licenses with holder details and validity periods.
- **Verify** the authenticity and validity of any registered license.
- **Revoke** a license if it is no longer valid.
- **Update** certain details, such as the holder's name or the expiry date.

This smart contract provides transparency, security, and immutability, ensuring that driver's license data cannot be tampered with and can be verified by anyone.
## Features

- **Registration of Licenses**: Authorized users can register new driver's licenses.
- **Verification**: Anyone can verify the authenticity of a license by querying the blockchain.
- **Revocation**: Authorized users can revoke a license, marking it as invalid.
- **Updating Information**: Authorized users can update certain details of a license.
- **Access Control**: Only the contract owner can register, update, or revoke licenses.
- **Events**: Emits events for registration, revocation, and updates for transparency.
- **Updating Information**: Authorized users can update certain details of a license.
- **Access Control**: Only the contract owner can register, update, or revoke licenses.
- **Events**: Emits events for registration, revocation, and updates for transparency.
### Contract Structure

- **License Struct**: Stores details of each driver's license, including the holder's name, license number, issue date, expiry date, and validity status.
- **Mappings**: The contract uses mappings to efficiently store and retrieve licenses by their license number.
- **Modifiers**: The `onlyOwner` modifier restricts certain functions to the contract owner for security purposes.
- **Events**: `LicenseRegistered`, `LicenseRevoked`, and `LicenseUpdated` events are emitted to log actions taken on the licenses.
### How to Use

#### Deployment

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/KAMBALENGUNUNU/drivers-license-verification.git
    cd drivers-license-verification
    ```
  
2. **Compile the Contract**:
    - Use Remix IDE, Truffle, or Hardhat to compile the contract.
    - Ensure you are using Solidity version `^0.8.0`.

3. **Deploy the Contract**:
    - Deploy the contract to an Ethereum test network (e.g., Ropsten, Rinkeby) or a local blockchain using tools like Remix or Truffle.
    - Note the contract address after deployment.
#### Interacting with the Contract

1. **Register a License**:
    - Call the `registerLicense()` function with the following parameters:
      - `_holderName`: The name of the license holder.
      - `_licenseNumber`: The unique license number.
      - `_issueDate`: The Unix timestamp representing the issue date.
      - `_expiryDate`: The Unix timestamp representing the expiry date.    

2. **Verify a License**:
    - Call the `verifyLicense()` function with the `_licenseNumber` parameter.
    - The function returns:
      - Whether the license is valid.
      - The holder's name.
      - The license number.
      - The issue date and expiry date.  

3. **Revoke a License**:
    - Call the `revokeLicense()` function with the `_licenseNumber` parameter to mark the license as invalid.
4. **Update License Information**:
    - Call the `updateLicense()` function with the following parameters:
      - `_licenseNumber`: The license number to be updated.
      - `_newHolderName`: The new name of the holder (if applicable).
      - `_newExpiryDate`: The new expiry date.

5. **Check Authorization**:
    - Call the `isAuthorized()` function with an address to check if it is authorized to perform restricted actions.
## Security Considerations

- **Access Control**: Only the contract owner (or a designated authorized entity) can register, update, or revoke licenses. This is enforced through the `onlyOwner` modifier.
- **Immutability**: Key details of a license, such as the license number and issue date, cannot be altered once registered. Only the holder's name and expiry date can be updated.
- **Data Integrity**: The contract ensures that licenses cannot be registered with invalid dates, and that updates adhere to the same constraints.
## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
---

This smart contract is designed to provide a simple, secure, and transparent way to manage driver's licenses using blockchain technology. If you have any questions or need further assistance, feel free to open an issue or contribute to the project.