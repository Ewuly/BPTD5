// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    mapping(address => bool) public allowedUsers;


    constructor(string memory name, string memory symbol,uint256 initialSupply) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
    }

    //Create a customer allow listing function. Only allow listed users should be able to call getToken()
    function allowListUser(address user) public {
        allowedUsers[user] = true;
    }

    
    function getToken() public returns(bool){
        require(allowedUsers[msg.sender], "User not allowed");
        _mint(msg.sender,100* 10**18);
        return true;
    }

    function buyToken() public payable returns(bool){
        require(allowedUsers[msg.sender], "User not allowed");
        uint256 numTokens = msg.value;
        _mint(msg.sender, numTokens * (10**uint256(decimals())));
        return true;
    }
}
