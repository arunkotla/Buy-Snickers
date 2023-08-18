// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Snickers{
    struct Memo{
        string name;
        string comment;
        uint timestamp;
         address from;
        }

        Memo[] public memo;
        address payable public owner;

        constructor(){
            owner  = payable(msg.sender);
        }

        function buySnickers(string memory name, string memory comment) payable public {
            require(msg.value > 0, "pls pay more than 0");
            owner.transfer(msg.value);
            memo.push(Memo(name, comment, block.timestamp, msg.sender));
        }

        function getSnickerDetails() public view returns(Memo[] memory){
            return memo;
        }
}