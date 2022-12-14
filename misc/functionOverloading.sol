pragma solidity >=0.5.0 <0.7.0; 

contract Base1 { //parent
    function foo() virtual public {} 
} 
contract Base2 { 
    function foo() override virtual public {} 
 } 
contract Inherited is Base1, Base2 
 { // Derives from multiple bases defining foo(), so we must explicitly // override it 
    function foo() public override(Base1, Base2) {} 
}
