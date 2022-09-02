pragma solidity ^0.8.0;

contract Owned {
    
    address contractCreator;
    
    constructor(){
        contractCreator = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == contractCreator);
        _;
    }
}

contract Instructor is Owned {
    
        address creator;
        struct Instructors {
            string fname;
            string lname;
            uint age;
        }
        
        
    mapping (address => Instructors) mapInstructor;
    
    address[] public InstructorAddr;
    
    constructor() {
        creator = msg.sender;
    }
    
    function setInstructor(address _address, string memory _fname, string memory _lname, uint _age) public onlyOwner  {
       Instructors storage instructor = mapInstructor[_address];
        
        instructor.fname = _fname;
        instructor.lname = _lname;
        instructor.age = _age;
        
        InstructorAddr.push(_address);
    }
    
    function getInstructorAddr() view public returns(address[] memory){
        return InstructorAddr;
    }
    function getInstructor(address _address) view public returns (string memory, string memory, uint){
        return (mapInstructor[_address].fname, mapInstructor[_address].lname, mapInstructor[_address].age);   
    }
    function countInstructor() view public returns(uint){
        return InstructorAddr.length;
    }
}