// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract HelloWorld {
    string private helloMessage = "Hello World!";

    function getHelloMessage() public view returns (string memory) {
        return helloMessage;
    }
}