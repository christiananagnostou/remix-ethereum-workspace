pragma solidity ^0.7.4;

contract WorkingWithVariables {
    uint256 public myUint;
    bool public myBool;
    uint8 public myUint8;
    address public myAddress;
    string public myString = 'Hello World';
      
    function setMyUint(uint _num) public {
        myUint = _num;
    }
    
    function setMyBool (bool _bool) public {
        myBool = _bool;
    }
    
    function incrementUint() public {
        myUint8++;
    }
    
    function decrement() public {
        myUint8--;
    }
    
    function setAddress(address _address) public {
        myAddress = _address;
    }
    
    function getBalanceOfAddress () public view returns(uint){
        return myAddress.balance;
    }
    
    
    function setMyString (string memory _myString) public {
        myString = _myString;
    }
}
