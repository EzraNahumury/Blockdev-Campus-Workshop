// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract LearnString {
    string public studentName;

    constructor(){
        studentName = "Ez";
    }

    function changeName(string memory _studentName)  public  {
        studentName = _studentName;
    }
}