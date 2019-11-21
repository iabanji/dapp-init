pragma solidity >=0.4.22 <0.6.0;

contract Passport {
    address public owner;
    
    struct Voter {
        address voter;
        string name;
        string surname;
        uint age;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    Voter[] public voters;
    mapping (address => bool) public voterAddresses;
    
    modifier isAuthVoter {
        require(!voterAddresses[msg.sender]);
        _;
    }
    
    function addNewVoter(
            string memory _name,
            string memory _surname,
            uint _age) isAuthVoter public returns(uint) {
                require(_age >= 18, "Person's age must be 18 or more");
                require(bytes(_surname).length > 0, "Person's surname must be 1 or more symbols");
                require(bytes(_name).length > 0, "Person's name must be 1 or more symbols");
                voters.push(Voter(msg.sender, _name, _surname, _age));
                voterAddresses[msg.sender] = true;
                
                return (voters.length - 1);
            }
}

contract Election {
    
}
