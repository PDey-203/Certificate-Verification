// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertificateHashVerifier {
    address private owner;

    struct Certificate {
        address issuer;
        bytes32 documentHash;
        uint256 timestamp;
    }

    mapping(string => Certificate) private certificates;
    mapping(bytes32 => bool) private hashExists;

    event CertificateStored(
        string certId,
        bytes32 hash,
        address indexed issuer
    );
    event CertificateVerified(string certId, bool isValid);

    constructor() {
        owner = msg.sender;
    }

    function storeCertificate(
        string memory certId,
        bytes32 documentHash
    ) public {
        require(
            certificates[certId].timestamp == 0,
            "Certificate ID already exists"
        );
        require(
            !hashExists[documentHash],
            "Certificate with this hash already exists"
        );

        certificates[certId] = Certificate({
            issuer: msg.sender,
            documentHash: documentHash,
            timestamp: block.timestamp
        });

        hashExists[documentHash] = true;
        emit CertificateStored(certId, documentHash, msg.sender);
    }

    function verifyCertificate(
        string memory certId,
        bytes32 documentHash
    ) public view returns (bool) {
        Certificate memory cert = certificates[certId];
        require(cert.timestamp != 0, "Certificate not found");

        bool matchResult = (cert.documentHash == documentHash);
        return matchResult;
    }

    function getCertificate(
        string memory certId
    ) public view returns (address issuer, bytes32 hash, uint256 timestamp) {
        Certificate memory cert = certificates[certId];
        require(cert.timestamp != 0, "Certificate not found");

        return (cert.issuer, cert.documentHash, cert.timestamp);
    }
}
