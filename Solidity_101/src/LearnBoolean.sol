// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract LearnBoolean {
    bool public isActive;
    bool public hasGraduated;

    constructor() {
        isActive = true;
        hasGraduated = false;
    }

    // Fungsi untuk mengubah status
    function changeStatus(bool _status) public {
        isActive = _status;
    }

    // Fungsi untuk lulus
    function graduate() public {
        hasGraduated = true;
    }
}