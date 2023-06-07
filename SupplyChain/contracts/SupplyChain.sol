// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract SupplyChain {
    uint32 public product_id = 0; // Product id
    uint32 public participant_id = 0; // Participant id
    uint32 public owner_id = 0; // Owner id

    struct product {
        string modelNumber;
        string partNumber;
        string serialNumber;
        address productOwner;
        uint32 cost;
        uint32 mfgTimeStamp;
    }
    mapping (uint32 => product) public products;

    struct participant {
        string userName;
        string password;
        string participantType;
        address participantAddress;
    }
    mapping (uint32 => participant) public participants;

    struct ownership {
        uint32 productId;
        uint32 ownerId;
        uint32 trxTimeStamp; // Transaction Time Stamp
        address productOwner;
    }
    mapping (uint32 => ownership) public ownerships; // Ownerships by owner_id
    mapping (uint32 => uint32[]) public productTrack;   // Ownerships by product_id / Movement track for a product

    event TransferOwnership (uint32 product_id);

    function addParticipant(string memory _name, string memory _pass, address _pAdd, string memory _pType) public returns (uint32) {
        uint32 userId = participant_id++;
        participants[userId].userName = _name;
        participants[userId].password = _pass;
        participants[userId].participantAddress = _pAdd;
        participants[userId].participantType = _pType;

        return userId;
    }
}


