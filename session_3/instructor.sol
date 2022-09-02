pragma solidity ^0.8.0;

contract Instructor {
    
    address creator;
    string fname;
    uint age;

    event InstructorEvent(string name, uint age);
    
    constructor() {
        creator = msg.sender;
    }
    
    function setInstructor(string memory _fname, uint _age) public {
        fname = _fname;
        age = _age;
        emit InstructorEvent(_fname, _age);
    }
    
    function getInstructor() view public returns (string memory, uint){
        return(fname, age);   
    }
}