// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract StudentData{
    string public studentName;
    uint256 public studentId;
    bool public isActive;
    address public wallet;
    uint256 public registeredTime;
    uint256 public credits;

    constructor(){
        studentName = "Budi Santoso";
        studentId = 2101001;
        isActive = true;
        wallet = msg.sender;
        registeredTime = block.timestamp;
        credits = 0;
    }

     function updateCredits() public {
        credits = credits + 3;
        // Bisa juga ditulis: credits += 3;
    }

    function getAge() public view returns (uint256) {
        return block.timestamp - registeredTime;
    }
}