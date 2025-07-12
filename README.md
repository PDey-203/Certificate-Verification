# 📜 CertificateHashVerifier

A secure and decentralized smart contract built on Ethereum for storing, verifying, and retrieving certificate document hashes. This contract ensures **uniqueness**, **immutability**, and **authenticity** of certificates using blockchain technology.

![License](https://img.shields.io/badge/License-MIT-green.svg)
![Solidity](https://img.shields.io/badge/Solidity-^0.8.0-blue.svg)
![Status](https://img.shields.io/badge/Smart%20Contract-Ready-success)

---

## 🚀 Features

- ✅ **Store Certificate**  
  Save certificate metadata (`issuer`, `hash`, `timestamp`) with a unique ID.

- 🔒 **Prevent Duplicate Hashes**  
  Ensures no two certificates can be stored with the same document Hash.

- 🔎 **Verify Certificate**  
  Check if a certificate ID with its corresponding Hash matches a given Certificate Hash.

- 📂 **Retrieve Certificate**  
  Fetch stored certificate details (issuer, hash, timestamp) by ID.

---

## 🛠️ Tech Stack

- **Language**: Solidity `^0.8.0`
- **Blockchain**: Ethereum / EVM-compatible
- **License**: MIT

---

## 📘 Contract Overview

```solidity
struct Certificate {
    address issuer;
    bytes32 documentHash;
    uint256 timestamp;
}

function storeCertificate(string memory certId, bytes32 documentHash) public {...}

function verifyCertificate(string memory certId, bytes32 documentHash) public view returns (bool) {...}

function getCertificate(string memory certId) public view returns (
        address issuer,
        bytes32 hash,
        uint256 timestamp
    ){...}
