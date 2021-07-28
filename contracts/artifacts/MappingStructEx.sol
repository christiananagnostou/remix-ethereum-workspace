pragma solidity ^0.5.13;

contract MappingStructExample {
    struct Payment {
        uint256 amount;
        uint256 timestamps;
    }

    struct Balance {
        uint256 totalBalance;
        uint256 numPayents;
        mapping(uint256 => Payment) payments;
    }

    mapping(address => Balance) public balanceReceived;

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;

        Payment memory payment = Payment(msg.value, now);

        balanceReceived[msg.sender].payments[
            balanceReceived[msg.sender].numPayents
        ] = payment;
        balanceReceived[msg.sender].numPayents++;
    }

    function withdrawMoney(address payable _to, uint256 _amount) public {
        require(
            balanceReceived[msg.sender].totalBalance >= _amount,
            "Not enough funds!"
        );
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }

    function withdrawAllMoney(address payable _to) public {
        uint256 balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    }
}
