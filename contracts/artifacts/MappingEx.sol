pragma solidity ^0.5.13;

contract SimpleMappingExample {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public addressMapping;
    
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }
    
    function setMyAddressToTrue() public {
        addressMapping[msg.sender] = true;
    }
}
